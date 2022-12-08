<?php
    require_once('../SqlScript.php');

    ini_set('display_errors', 1);
    error_reporting(E_ALL);

    class Card extends apiBaseClass {
         
        function get_card($getData, $postData) {
            if (!isset($getData['id'])) {
                throw new InvalidArgumentException('Не указан id страницы');
            }

            $result = $this->mySQLWorker->connectLink->query((new SqlScript("\\Card\\sql\\GetCards.sql"))->replace('%ID%', $getData['id'])->getSql());
            $myArray = array();
            while($row = $result->fetch_assoc()) {
                $myArray[] = $row;
            }
            return $myArray;
        }

        function post_card($getData, $postData) {
            if (empty($postData)) {
                throw new InvalidArgumentException('Не указаны данные элемента');
            }
            $postObject = json_decode($postData);
            $imgPath = null;
            if (!empty($postObject->img)) {
                $imgPath = apiBaseClass::saveFile($postObject->img->imgBase64, $postObject->img->imgExtension);
            }
            $result = $this->mySQLWorker->connectLink->query((new SqlScript("\\Card\\sql\\AddCard.sql"))
                                                                        ->replace("%TITLE%", $postObject->title)
                                                                        ->replace("%DESCRIPTION%", $postObject->description)
                                                                        ->replace("%IMG_SRC%", $imgPath)
                                                                        ->replace("%VIDEO_SRC%", $postObject->videoSrc)
                                                                        ->replace("%ID_PAGE%", $postObject->idPage)
                                                                        ->getSql());   
        }

        function delete_card($getData, $postData) {
            if (!isset($getData['id'])) {
                throw new InvalidArgumentException('Не указан id карточки');
            }

            $result = $this->mySQLWorker->connectLink->query((new SqlScript("\\Card\\sql\\DeleteCard.sql"))->replace('%ID%', $getData['id'])->getSql());
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
            
            $sql = (new SqlScript("\\Card\\sql\\UpdateCard.sql"))
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