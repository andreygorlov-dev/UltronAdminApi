<?php
    require_once('../SqlScript.php');

    ini_set('display_errors', 1);
    error_reporting(E_ALL);

    class PageType extends apiBaseClass {

        function getImgSrc($id) {
            $result = $this->mySQLWorker->connectLink->query((new SqlScript("/PageType/sql/GetImgSrcPage.sql"))->replace("%ID%", $id)->getSql());
            if ($row = $result->fetch_assoc()) {
                return $row['IMG_SRC'];
            }
            throw new InvalidArgumentException('Несуществующий id страницы');;
        }

        function get_pagetype($getData, $postData) {
            if (!isset($getData['id'])) {
                throw new InvalidArgumentException('Не указан id страницы');
            }

            $result = $this->mySQLWorker->connectLink->query((new SqlScript("/PageType/sql/GetPageType.sql"))->replace("%ID%", $getData['id'])->getSql());
            if ($row = $result->fetch_assoc()) {
                return $row;
            }
            return null;
        }

        function post_pagetype($getData, $postData) {
            if (empty($postData)) {
                throw new InvalidArgumentException('Не указаны данные для шаблона');
            }
            if (!isset($getData['id'])) {
                throw new InvalidArgumentException('Не указан id страницы');
            }
            $postObject = json_decode($postData);
            $sql = new SqlScript("/PageType/sql/AddPageType.sql");
            switch ($postObject->type) {
                case "1" :
                    $sql->replace("'%SUBTITLE%'", "NULL")->replace("'%IMG_SRC%'", "NULL");
                    break;
                case "2":
                case "3":
                    $sql->replace("%SUBTITLE%", $postObject->subtitle)->replace("'%IMG_SRC%'", "NULL");
                    break;
                case "4":
                    $imgPath = null;
                    if (isset($postObject->img)) {        
                        $imgPath = apiBaseClass::saveFile($postObject->img->imgBase64, $postObject->img->imgExtension);
                    }
                    $sql->replace("'%SUBTITLE%'", "NULL")->replace("%IMG_SRC%", $imgPath);

                    break;
                default:
                    break;        
            }
            
            $result = $this->mySQLWorker->connectLink->query($sql->replace("%TYPE%", $postObject->type)->replace("%TITLE%", $postObject->title)->getSql());
            $last_id = mysqli_insert_id($this->mySQLWorker->connectLink);

            $result = $this->mySQLWorker->connectLink->query((new SqlScript("/PageType/sql/UpdateTypePage.sql"))
                                                                    ->replace("%ID_PAGE_TYPE%", $last_id)
                                                                    ->replace("%ID%", $getData['id'])
                                                                    ->getSql());
        }

        function delete_pagetype($getData, $postData) {
            
        }

        function put_pagetype($getData, $postData) {
        }
        
    }

?>