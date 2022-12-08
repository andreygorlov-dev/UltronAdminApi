<?php
    require_once('../SqlScript.php');

    ini_set('display_errors', 1);
    error_reporting(E_ALL);

    class Page extends apiBaseClass {
         
        function get_page($getData, $postData) {
            $result = $this->mySQLWorker->connectLink->query((new SqlScript("\\Page\\sql\\GetPages.sql"))->getSql());
            $myArray = array();
            while($row = $result->fetch_assoc()) {
                $myArray[] = $row;
            }
            return $myArray;
        }

        function post_page($getData, $postData) {
            if (empty($postData)) {
                throw new InvalidArgumentException('Не указаны данные страницы');
            }
            $postObject = json_decode($postData);
            $imgPath = null;
            if (!empty($postObject->img)) {
                $imgPath = apiBaseClass::saveFile($postObject->img->imgBase64, $postObject->img->imgExtension);
            }
            $result = $this->mySQLWorker->connectLink->query((new SqlScript("\\Page\\sql\\AddPage.sql"))
                                                                        ->replace("%NAME%", $postObject->name)
                                                                        ->replace("%IMG_SRC%", $imgPath)
                                                                        ->getSql());   
        }

        function delete_page($getData, $postData) {
            if (!isset($getData['id'])) {
                throw new InvalidArgumentException('Не указан id страницы');
            }

            $result = $this->mySQLWorker->connectLink->query((new SqlScript("\\Page\\sql\\DeletePage.sql"))->replace('%ID%', $getData['id'])->getSql());
        }

        function put_page($getData, $postData) {
            if (!isset($getData['id'])) {
                throw new InvalidArgumentException('Не указан id страницы');
            }

            if (empty($postData)) {
                throw new InvalidArgumentException('Не указаны данные страницы');
            }

            $postObject = json_decode($postData);
            
            $imgPath = null;
            if (!empty($postObject->img)) {
                $imgPath = apiBaseClass::saveFile($postObject->img->imgBase64, $postObject->img->imgExtension);
            }
            
            $sql = (new SqlScript("\\Page\\sql\\UpdatePage.sql"))
                                ->replace("%NAME%", $postObject->name)
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