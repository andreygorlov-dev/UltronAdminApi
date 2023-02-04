<?php
    require_once('../SqlScript.php');

    ini_set('display_errors', 1);
    error_reporting(E_ALL);

    class Page extends apiBaseClass {
         
        function getMaxPosition() {
            $result = $this->mySQLWorker->connectLink->query((new SqlScript("/Page/sql/GetMaxPositionPages.sql"))->getSql());
            if ($row = $result->fetch_assoc()) {
                return $row['POSITION'] + 1;
            }
            return 1;
        }

        function getPosition($id) {
            $result = $this->mySQLWorker->connectLink->query((new SqlScript("/Page/sql/GetPositionPages.sql"))->replace("%ID%", $id)->getSql());
            if ($row = $result->fetch_assoc()) {
                return $row['POSITION'];
            }
            return 0;
        }
        
        function getImgSrc($id) {
            $result = $this->mySQLWorker->connectLink->query((new SqlScript("/Page/sql/GetImgSrcPage.sql"))->replace("%ID%", $id)->getSql());
            if ($row = $result->fetch_assoc()) {
                return $row['IMG_SRC'];
            }
            throw new InvalidArgumentException('Несуществующий id страницы');;
        }

        function get_page($getData, $postData) {
            $result = $this->mySQLWorker->connectLink->query((new SqlScript("/Page/sql/GetPages.sql"))->getSql());
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

            $pos = $this->getMaxPosition();

            if (!empty($postObject->position) && $pos > $postObject->position) {
                $result = $this->mySQLWorker->connectLink->query((new SqlScript("/Page/sql/UpdatePositionPage.sql"))
                                                                        ->replace("%FIRST_POSITION%", $postObject->position)
                                                                        ->replace("%SECOND_POSITION%", $pos)
                                                                        ->replace("%OPERATION%", "+")
                                                                        ->getSql());  
                $pos = $postObject->position;                                                                           
            }

            $result = $this->mySQLWorker->connectLink->query((new SqlScript("/Page/sql/AddPage.sql"))
                                                                        ->replace("%NAME%", $postObject->name)
                                                                        ->replace("%IMG_SRC%", $imgPath)
                                                                        ->replace("%POSITION%", $pos)
                                                                        ->getSql());   
        }

        function delete_page($getData, $postData) {
            if (!isset($getData['id'])) {
                throw new InvalidArgumentException('Не указан id страницы');
            }
            $filepath = "../img/" . $this->getImgSrc($getData['id']);
            unlink($filepath);

            $result = $this->mySQLWorker->connectLink->query((new SqlScript("/Page/sql/UpdatePositionPage.sql"))
                                                                        ->replace("%FIRST_POSITION%", $this->getPosition($getData['id']) + 1)
                                                                        ->replace("%SECOND_POSITION%", $this->getMaxPosition())
                                                                        ->replace("%OPERATION%", "-")
                                                                        ->getSql());  

            $result = $this->mySQLWorker->connectLink->query((new SqlScript("/Page/sql/DeletePage.sql"))->replace('%ID%', $getData['id'])->getSql());
        }

        function put_page($getData, $postData) {
            if (!isset($getData['id'])) {
                throw new InvalidArgumentException('Не указан id страницы');
            }

            if (empty($postData)) {
                $result = $this->mySQLWorker->connectLink->query($sql = (new SqlScript("/Page/sql/UpdateVisibility.sql"))
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
                $result = $this->mySQLWorker->connectLink->query((new SqlScript("/Page/sql/UpdatePositionPage.sql"))
                                                                        ->replace("%FIRST_POSITION%", min($oldPos, $postObject->newPosition))
                                                                        ->replace("%SECOND_POSITION%", max($oldPos, $postObject->newPosition))
                                                                        ->replace("%OPERATION%", $oldPos > $postObject->newPosition ? "+" : "-")
                                                                        ->getSql());  
                $pos = $postObject->newPosition;                                                                           
            }
            
            $name = !empty($postObject->name) ? $postObject->name : null;
            $position = isset($postObject->newPosition) ? $postObject->newPosition : null;
            
            
            
            $sql = (new SqlScript("/Page/sql/UpdatePage.sql"))
                                ->replace("%ID%", $getData['id']);

                                
            if ($name != null) {
                $sql->replace("%NAME%", "`NAME` = '" . $name . "'". (($position != null || $imgPath != null) ? "," : ""));
            } else {
                $sql->replace("%NAME%", "");
            }
            
            if ($position != null) {
                $sql->replace("%POSITION%", "`POSITION` = '" . $position . "'" . ($imgPath != null ? "," : ""));
            } else {
                $sql->replace("%POSITION%", "");
            }
            
            if ($imgPath != null) {
                $sql->replace("%IMG%", "`IMG_SRC` = '" . $imgPath . "'" );
            } else {
                $sql->replace("%IMG%", "");
            }
            
            $result = $this->mySQLWorker->connectLink->query($sql->getSql());  

        }
        
    }

?>