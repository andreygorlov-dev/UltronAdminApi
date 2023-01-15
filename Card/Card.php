<?php
    require_once('../SqlScript.php');
    require_once('../PageType/PageType.php');

    ini_set('display_errors', 1);
    error_reporting(E_ALL);

    class CardResponse {
        public $type;
        public $cards = array();
    }

    class Card extends apiBaseClass {
         
        function getMaxPosition($idPage) {
            $result = $this->mySQLWorker->connectLink->query((new SqlScript("/Card/sql/GetMaxPositionCard.sql"))->replace('%ID_PAGE%', $idPage)->getSql());
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
                //todo добавить получения информации карточки
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
                $pageType = new PageType();
                $type = $pageType->get_pagetype($getData, $postData);

                $imgPath = apiBaseClass::saveFile($postObject->img->imgBase64, $postObject->img->imgExtension);

                $pos = $this->getMaxPosition($getData['id']);
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
                //todo добавить добавление информации карточки
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