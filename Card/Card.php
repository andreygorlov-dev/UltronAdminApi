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

        function getPosition($id) {
            $result = $this->mySQLWorker->connectLink->query((new SqlScript("/Card/sql/GetPositionCards.sql"))->replace("%ID%", $id)->getSql());
            if ($row = $result->fetch_assoc()) {
                return $row['POSITION'];
            }
            return 0;
        }

        function getPositionContent($id) {
            $result = $this->mySQLWorker->connectLink->query((new SqlScript("/Card/sql/GetPositionCardsContent.sql"))->replace("%ID%", $id)->getSql());
            if ($row = $result->fetch_assoc()) {
                return $row['POSITION'];
            }
            return 0;
        }

        function getImgSrc($id) {
            $result = $this->mySQLWorker->connectLink->query((new SqlScript("/Card/sql/GetImgSrcCard.sql"))->replace("%ID%", $id)->getSql());
            if ($row = $result->fetch_assoc()) {
                return $row['IMG_SRC_PREVIEW'];
            }
            throw new InvalidArgumentException('Несуществующий id страницы');;
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
                    $myArray['VISIBILITY'] = $row['VISIBILITY'];
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
                switch ($postObject->type) {
                    case 'IMG1':
                    case 'IMG2':
                        $imgPath = apiBaseClass::saveFile($postObject->img->imgBase64, $postObject->img->imgExtension);
                        $value = $imgPath;
                        break;
                    case 'ELEM_LIST':
                        $imgPath = apiBaseClass::saveFile($postObject->img->imgBase64, $postObject->img->imgExtension);
                        $elem = new ElemList($postObject->value ,apiBaseClass::saveFile($postObject->img->imgBase64, $postObject->img->imgExtension));
                        $value = json_encode($elem, JSON_UNESCAPED_UNICODE);
                        break;   
                    case 'TABLE':
                        $value = json_encode($postObject->table, JSON_UNESCAPED_UNICODE);
                        break;     
                    case 'TEXT3':
                        $value = json_encode($postObject->textType, JSON_UNESCAPED_UNICODE);
                        break;   
                    default:
                        $value = $postObject->value;
                        break;
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
            if (!isset($getData['id']) || !isset($getData['idParent'])) {
                throw new InvalidArgumentException('Не указан id');
            }

            if ($getData['type'] === 'preview') {
                $filepath = "../img/" . $this->getImgSrc($getData['id']);
                
                unlink($filepath);
                
                $result = $this->mySQLWorker->connectLink->query((new SqlScript("/Card/sql/UpdatePositionCard.sql"))
                                                                        ->replace("%FIRST_POSITION%", $this->getPosition($getData['id']) + 1)
                                                                        ->replace("%SECOND_POSITION%", $this->getMaxPosition($getData['idParent']))
                                                                        ->replace("%ID_PAGE%", $getData['idParent'])
                                                                        ->replace("%OPERATION%", "-")
                                                                        ->getSql());  
                $result = $this->mySQLWorker->connectLink->query((new SqlScript("/Card/sql/DeleteCard.sql"))->replace('%ID%', $getData['id'])->getSql());
            } else if ($getData['type'] === 'content') { 
                $result = $this->mySQLWorker->connectLink->query((new SqlScript("/Card/sql/UpdatePositionContentCard.sql"))
                                                                        ->replace("%FIRST_POSITION%", $this->getPositionContent($getData['id']) + 1)
                                                                        ->replace("%SECOND_POSITION%", $this->getMaxPositionContent($getData['idParent']))
                                                                        ->replace("%OPERATION%", "-")
                                                                        ->replace("%ID_CARD%", $getData['idParent'])
                                                                        ->getSql());  
                $result = $this->mySQLWorker->connectLink->query((new SqlScript("/Card/sql/DeleteElement.sql"))->replace('%ID%', $getData['id'])->getSql());
            } else {
                throw new InvalidArgumentException('Ошибка в праметре type');
            }

        }

        function put_card($getData, $postData) {
            //if (!isset($getData['id']) || !isset($getData['idParent'])) {
            //    throw new InvalidArgumentException('Не указан id');
            //}

            if ($getData['type'] === 'preview') {
                $this->updatePreview($getData, $postData);
            } else if ($getData['type'] === 'content') { 
                $this->updateContent($getData, $postData);
            } else {
                throw new InvalidArgumentException('Ошибка в праметре type');
            }
        }

        function updateContent($getData, $postData) {
            if (empty($postData)) {
                $result = $this->mySQLWorker->connectLink->query((new SqlScript("/Card/sql/UpdateVisibilityCardContent.sql"))
                            ->replace("%ID%", $getData['id'])
                            ->getSql());
                return;
            }

            $postObject = json_decode($postData);

            $pos = $this->getPositionContent($getData['id']);
            $oldPos = $this->getPositionContent($getData['id']);
            if (!empty($postObject->newPosition)) {
                if ($postObject->newPosition == $oldPos) {
                    throw new InvalidArgumentException('Новая позиция не должна быть равна старой');
                }

                $result = $this->mySQLWorker->connectLink->query((new SqlScript("/Card/sql/UpdatePositionContentCard.sql"))
                                                                        ->replace("%FIRST_POSITION%", min($oldPos, $postObject->newPosition))
                                                                        ->replace("%SECOND_POSITION%", max($oldPos, $postObject->newPosition))
                                                                        ->replace("%OPERATION%", $oldPos > $postObject->newPosition ? "+" : "-")
                                                                        ->replace("%ID_CARD%", $getData['idParent'])
                                                                        ->getSql());  
                $pos = $postObject->newPosition;                                                                           
            }

            $position = isset($postObject->newPosition) ? $postObject->newPosition : null;
            
            $sql = (new SqlScript("/Card/sql/UpdateCardContent.sql"))
                                ->replace("%ID%", $getData['id']);

            if ($position != null) {
                $sql->replace("%POSITION%", "`POSITION` = '" . $position . "'");
            } else {
                $sql->replace("%POSITION%", "");
            }
            
            $result = $this->mySQLWorker->connectLink->query($sql->getSql());
        }

        function updatePreview($getData, $postData) {
            if (empty($postData)) {
                $result = $this->mySQLWorker->connectLink->query($sql = (new SqlScript("/Card/sql/UpdateVisibilityCard.sql"))
                            ->replace("%ID%", $getData['id'])
                            ->getSql());
                return;
            }

            $postObject = json_decode($postData);
        
            $imgPath = null;
            if (isset($postObject->img)) {
                
                $filepath = "../img/" . $this->getImgSrc($getData['id']);
                unlink($filepath);

                $imgPath = apiBaseClass::saveFile($postObject->img->imgBase64, $postObject->img->imgExtension);
            }
            $pos = $this->getPosition($getData['id']);
            $oldPos = $this->getPosition($getData['id']);
            if (!empty($postObject->newPosition)) {
                if ($postObject->newPosition == $oldPos) {
                    throw new InvalidArgumentException('Новая позиция не должна быть равна старой');
                }

                $result = $this->mySQLWorker->connectLink->query((new SqlScript("/Card/sql/UpdatePositionCard.sql"))
                                                                        ->replace("%FIRST_POSITION%", min($oldPos, $postObject->newPosition))
                                                                        ->replace("%SECOND_POSITION%", max($oldPos, $postObject->newPosition))
                                                                        ->replace("%OPERATION%", $oldPos > $postObject->newPosition ? "+" : "-")
                                                                        ->replace("%ID_PAGE%", $getData['idParent'])
                                                                        ->getSql());  
                $pos = $postObject->newPosition;                                                                           
            }
            
            $title = !empty($postObject->title) ? $postObject->title : null;
            $src = !empty($postObject->src) ? $postObject->src : null;
            $position = isset($postObject->newPosition) ? $postObject->newPosition : null;
            
            $sql = (new SqlScript("/Card/sql/UpdateCard.sql"))
                                ->replace("%ID%", $getData['id']);

                                
            if ($title != null) {
                $sql->replace("%TITLE%", "`TITLE_PREVIEW` = '" . $title . "'". (($position != null || $imgPath != null || $src != null) ? "," : ""));
            } else {
                $sql->replace("%TITLE%", "");
            }
            
            if ($position != null) {
                $sql->replace("%POSITION%", "`POSITION` = '" . $position . "'" . (($imgPath != null || $src != null) ? "," : ""));
            } else {
                $sql->replace("%POSITION%", "");
            }
            
            if ($imgPath != null) {
                $sql->replace("%IMG%", "`IMG_SRC_PREVIEW` = '" . $imgPath . "'" . ($src != null ? "," : ""));
            } else {
                $sql->replace("%IMG%", "");
            }

            if ($src != null) {
                $sql->replace("%SRC%", "`SRC` = '" . $src . "'" );
            } else {
                $sql->replace("%SRC%", "");
            }
                        
            $result = $this->mySQLWorker->connectLink->query($sql->getSql()); 
        }
        
    }

?>