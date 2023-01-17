<?php
    require_once('../SqlScript.php');
    require_once('../PageType/PageType.php');

    ini_set('display_errors', 1);
    error_reporting(E_ALL);

    class CardResponse {
        public $type;
        public $cards = array();
    }

    class ElemList {
        public $VALUE;
        public $IMG;

        function __construct($value, $img) {
            $this->VALUE = $value;
            $this->IMG = $img;
        }
    }

    class Table {
        public $COLUMN1;
        public $COLUMN2;

        function __construct($column1, $column2) {
            $this->COLUMN1 = $column1;
            $this->COLUMN2 = $column2;
        }
    }

    class Card extends apiBaseClass {
         
        function getMaxPosition($idPage) {
            $result = $this->mySQLWorker->connectLink->query((new SqlScript("/Card/sql/GetMaxPositionCard.sql"))->replace('%ID_PAGE%', $idPage)->getSql());
            if ($row = $result->fetch_assoc()) {
                return $row['POSITION'] + 1;
            }
            return 1;
        }

        function getMaxPositionContent($idCard) {
            $result = $this->mySQLWorker->connectLink->query((new SqlScript("/Card/sql/GetMaxPositionCardContent.sql"))->replace('%ID_CARD%', $idCard)->getSql());
            if ($row = $result->fetch_assoc()) {
                return $row['POSITION'] + 1;
            }
            return 1;
        }

        function get_card($getData, $postData) {
            if (!isset($getData['id']) || !isset($getData['type'])) {
                throw new InvalidArgumentException('Не указаны параметры запроса');
            }

            if ($getData['type'] === 'preview') {
                $cardResponse = new CardResponse();
                $pageType = new PageType();
                $cardResponse->type = $pageType->get_pagetype($getData, $postData);
                $result = $this->mySQLWorker->connectLink->query((new SqlScript("/Card/sql/GetCardsPreview.sql"))->replace('%ID%', $getData['id'])->getSql());
                while($row = $result->fetch_assoc()) {
                    $cardResponse->cards[] = $row;
                }
                return $cardResponse;
            } else if ($getData['type'] === 'content') {
                $result = $this->mySQLWorker->connectLink->query((new SqlScript("/Card/sql/GetCardsContent.sql"))->replace('%ID_CARD%', $getData['id'])->getSql());
                $response = array();
                while($row = $result->fetch_assoc()) {
                    $myArray = array();
                    $myArray['ID'] = $row['ID'];
                    if ($row['TYPE'] === 'ELEM_LIST' || $row['TYPE'] === "TEXT3" || $row['TYPE'] === "TABLE") {
                        $myArray['VALUE'] = json_decode($row['VALUE']);
                    } else {
                        $myArray['VALUE'] = $row['VALUE'];
                    }
                    $myArray['TYPE'] = $row['TYPE'];
                    $myArray['POSITION'] = $row['POSITION'];
                    $myArray['VISIBLE'] = $row['VISIBLE'];
                    $response[] = $myArray;
                }
                return $response;
            } else {
                throw new InvalidArgumentException('Ошибка в праметре type');
            }
        }

        function post_card($getData, $postData) {
            if (empty($postData)) {
                throw new InvalidArgumentException('Не указаны данные элемента');
            }
            if (!isset($getData['id']) || !isset($getData['type'])) {
                throw new InvalidArgumentException('Не указаны параметры запроса');
            }
            
            $postObject = json_decode($postData);


            if ($getData['type'] === 'preview') {
                $pos = $this->getMaxPosition($getData['id']);
                $pageType = new PageType();
                $type = $pageType->get_pagetype($getData, $postData);

                $imgPath = apiBaseClass::saveFile($postObject->img->imgBase64, $postObject->img->imgExtension);
                if (!empty($postObject->position) && $pos > $postObject->position) {
                    $result = $this->mySQLWorker->connectLink->query((new SqlScript("/Card/sql/UpdatePositionCard.sql"))
                                                                            ->replace("%FIRST_POSITION%", $postObject->position)
                                                                            ->replace("%SECOND_POSITION%", $pos)
                                                                            ->replace("%OPERATION%", "+")
                                                                            ->replace("%ID_PAGE%", $getData['id'])
                                                                            ->getSql());  
                    $pos = $postObject->position;                                                                           
                }

                $sql = (new SqlScript("/Card/sql/AddCard.sql"))
                            ->replace("%TITLE%", $postObject->title)
                            ->replace("%IMG_SRC%", $imgPath)
                            ->replace("%POSITION%", $pos)
                            ->replace("%ID_PAGE%", $getData['id']);  
                if ($type['TYPE'] == "4") {
                    $sql->replace("%SRC%", $postObject->src);
                } else {
                    $sql->replace("'%SRC%'", "NULL");
                }
                $result = $this->mySQLWorker->connectLink->query($sql->getSql());
            } else if ($getData['type'] === 'content') {     
                $pos = $this->getMaxPositionContent($getData['id']);           
                $value = null;
                if ($postObject->type === 'IMG1' || $postObject->type === 'IMG2') {
                    $imgPath = apiBaseClass::saveFile($postObject->img->imgBase64, $postObject->img->imgExtension);
                    $value = $imgPath;
                } else if ($postObject->type === 'ELEM_LIST') {
                    $imgPath = apiBaseClass::saveFile($postObject->img->imgBase64, $postObject->img->imgExtension);
                    $elem = new ElemList($postObject->value ,apiBaseClass::saveFile($postObject->img->imgBase64, $postObject->img->imgExtension));
                    $value = json_encode($elem);
                } else if ($postObject->type === 'TABLE') {
                    $elem = new ElemList($postObject->value ,apiBaseClass::saveFile($postObject->img->imgBase64, $postObject->img->imgExtension));
                    $value = json_encode($elem);
                } else {
                    $value = $postObject->value;
                }

                if (!empty($postObject->position) && $pos > $postObject->position) {
                    $result = $this->mySQLWorker->connectLink->query((new SqlScript("/Card/sql/UpdatePositionContentCard.sql"))
                                                                            ->replace("%FIRST_POSITION%", $postObject->position)
                                                                            ->replace("%SECOND_POSITION%", $pos)
                                                                            ->replace("%OPERATION%", "+")
                                                                            ->replace("%ID_CARD%", $getData['id'])
                                                                            ->getSql());  
                    $pos = $postObject->position;                                                                           
                }

                $sql = (new SqlScript("/Card/sql/AddContentCard.sql"))
                            ->replace("%VALUE%", $value)
                            ->replace("%TYPE%", $postObject->type)
                            ->replace("%POSITION%", $pos)
                            ->replace("%ID_CARD%", $getData['id']); 
                $result = $this->mySQLWorker->connectLink->query($sql->getSql());
            } else {
                throw new InvalidArgumentException('Ошибка в праметре type');
            }

        }

        function delete_card($getData, $postData) {
            if (!isset($getData['id'])) {
                throw new InvalidArgumentException('Не указан id карточки');
            }

            $result = $this->mySQLWorker->connectLink->query((new SqlScript("/Card/sql/DeleteCard.sql"))->replace('%ID%', $getData['id'])->getSql());
        }

        function put_card($getData, $postData) {
            if (!isset($getData['id'])) {
                throw new InvalidArgumentException('Не указан id карточки');
            }

            if (empty($postData)) {
                throw new InvalidArgumentException('Не указаны данные элемента');
            }

            $postObject = json_decode($postData);
            
            $imgPath = null;
            if (!empty($postObject->img)) {
                $imgPath = apiBaseClass::saveFile($postObject->img->imgBase64, $postObject->img->imgExtension);
            }
            
            $sql = (new SqlScript("/Card/sql/UpdateCard.sql"))
                                ->replace("%TITLE%", $postObject->title)
                                ->replace("%DESCRIPTION%", $postObject->description)
                                ->replace("%VIDEO_SRC%", $postObject->videoSrc)
                                ->replace("%ID_PAGE%", $postObject->idPage)
                                ->replace("%ID%", $getData['id']);

            if ($imgPath != null) {
                $sql->replace("%IMG%", "`IMG_SRC` = '" . $imgPath . "',");
            } else {
                $sql->replace("%IMG%", "");
            }


            $result = $this->mySQLWorker->connectLink->query($sql->getSql());  

        }
        
    }

?>