<?php
    require_once('../SqlScript.php');

    ini_set('display_errors', 1);
    error_reporting(E_ALL);

    class Document_Mavie extends apiBaseClass {

        function getMaxPosition() {
            $result = $this->mySQLWorker->connectLink->query((new SqlScript("/Document_Mavie/sql/GetMaxPositionDocuments.sql"))->getSql());
            if ($row = $result->fetch_assoc()) {
                return $row['POSITION'] + 1;
            }
            return 1;
        }

        function getImgSrc($id) {
            $result = $this->mySQLWorker->connectLink->query((new SqlScript("/Document_Mavie/sql/GetImgSrcDocument.sql"))->replace("%ID%", $id)->getSql());
            if ($row = $result->fetch_assoc()) {
                return $row['IMG_SRC'];
            }
            throw new InvalidArgumentException('Несуществующий id');;
        }

        function getDocSrc($id) {
            $result = $this->mySQLWorker->connectLink->query((new SqlScript("/Document_Mavie/sql/GetDocSrcDocument.sql"))->replace("%ID%", $id)->getSql());
            if ($row = $result->fetch_assoc()) {
                return $row['FILE_SRC'];
            }
            throw new InvalidArgumentException('Несуществующий id');
        }

        function getPosition($id) {
            $result = $this->mySQLWorker->connectLink->query((new SqlScript("/Document_Mavie/sql/GetPositionDocument.sql"))->replace("%ID%", $id)->getSql());
            if ($row = $result->fetch_assoc()) {
                return $row['POSITION'];
            }
            return 0;
        }

        function get_document_mavie($getData, $postData) {
            $result = $this->mySQLWorker->connectLink->query((new SqlScript("/Document_Mavie/sql/GetDocuments.sql"))->getSql());
            $myArray = array();
            while($row = $result->fetch_assoc()) {
                $myArray[] = $row;
            }
            return $myArray;
        }

        function post_document_mavie($getData, $postData) {
            if (empty($postData)) {
                throw new InvalidArgumentException('Не указаны данные страницы');
            }
            $postObject = json_decode($postData);
            $imgPath = null;
            if (!empty($postObject->img)) {
                $imgPath = apiBaseClass::saveFile($postObject->img->imgBase64, $postObject->img->imgExtension);
            }

            $filePath = null;
            if (!empty($postObject->doc)) {
                $filePath = apiBaseClass::saveDocument($postObject->doc->docBase64, $postObject->doc->docExtension);
            }

            $pos = $this->getMaxPosition();

            if (!empty($postObject->position) && $pos > $postObject->position) {
                $result = $this->mySQLWorker->connectLink->query((new SqlScript("/Document_Mavie/sql/UpdatePositionDocument.sql"))
                                                                        ->replace("%FIRST_POSITION%", $postObject->position)
                                                                        ->replace("%SECOND_POSITION%", $pos)
                                                                        ->replace("%OPERATION%", "+")
                                                                        ->getSql());  
                $pos = $postObject->position;                                                                           
            }

            $result = $this->mySQLWorker->connectLink->query((new SqlScript("/Document_Mavie/sql/AddDocument.sql"))
                                                                        ->replace("%TITLE%", $postObject->title)
                                                                        ->replace("%IMG_SRC%", $imgPath)
                                                                        ->replace("%FILE_SRC%", $filePath)
                                                                        ->replace("%POSITION%", $pos)
                                                                        ->getSql());   
        }

        function delete_document_mavie($getData, $postData) {
            if (!isset($getData['id'])) {
                throw new InvalidArgumentException('Не указан id страницы');
            }

            $imgPath = "../img/" . $this->getImgSrc($getData['id']);
            $docPath = "../doc/" . $this->getDocSrc($getData['id']);
            unlink($imgPath);
            unlink($docPath);

            $result = $this->mySQLWorker->connectLink->query((new SqlScript("/Document_Mavie/sql/UpdatePositionDocument.sql"))
                                                                        ->replace("%FIRST_POSITION%", $this->getPosition($getData['id']) + 1)
                                                                        ->replace("%SECOND_POSITION%", $this->getMaxPosition())
                                                                        ->replace("%OPERATION%", "-")
                                                                        ->getSql());  

            $result = $this->mySQLWorker->connectLink->query((new SqlScript("/Document_Mavie/sql/DeleteDocument.sql"))->replace('%ID%', $getData['id'])->getSql());
        }

        function put_document_mavie($getData, $postData) {
            if (!isset($getData['id'])) {
                throw new InvalidArgumentException('Не указан id страницы');
            }

            if (empty($postData)) {
                $result = $this->mySQLWorker->connectLink->query($sql = (new SqlScript("/Document_Mavie/sql/UpdateVisibility.sql"))
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
            
            $docPath = null;
            if (isset($postObject->doc)) {
                
                $filepath = "../doc/" . $this->getDocSrc($getData['id']);
                unlink($filepath);

                $docPath = apiBaseClass::saveDocument($postObject->doc->docBase64, $postObject->doc->docExtension);
            }

            $pos = $this->getPosition($getData['id']);
            $oldPos = $this->getPosition($getData['id']);
            if (!empty($postObject->newPosition)) {
                if ($postObject->newPosition == $oldPos) {
                    throw new InvalidArgumentException('Новая позиция не должна быть равна старой');
                }
                $result = $this->mySQLWorker->connectLink->query((new SqlScript("/Document_Mavie/sql/UpdatePositionDocument.sql"))
                                                                        ->replace("%FIRST_POSITION%", min($oldPos, $postObject->newPosition))
                                                                        ->replace("%SECOND_POSITION%", max($oldPos, $postObject->newPosition))
                                                                        ->replace("%OPERATION%", $oldPos > $postObject->newPosition ? "+" : "-")
                                                                        ->getSql());  
                $pos = $postObject->newPosition;                                                                           
            }
            
            $title = !empty($postObject->title) ? $postObject->title : null;
            $position = isset($postObject->newPosition) ? $postObject->newPosition : null;
            
            
            
            $sql = (new SqlScript("/Document_Mavie/sql/UpdateDocument.sql"))
                                ->replace("%ID%", $getData['id']);

                                
            if ($title != null) {
                $sql->replace("%TITLE%", "`TITLE` = '" . $title . "'". (($position != null || $imgPath != null || $docPath != null) ? "," : ""));
            } else {
                $sql->replace("%TITLE%", "");
            }
            
            if ($position != null) {
                $sql->replace("%POSITION%", "`POSITION` = '" . $position . "'" . (($imgPath != null || $docPath != null) ? "," : ""));
            } else {
                $sql->replace("%POSITION%", "");
            }
            
            if ($imgPath != null) {
                $sql->replace("%IMG%", "`IMG_SRC` = '" . $imgPath . "'" . ($docPath != null ? "," : ""));
            } else {
                $sql->replace("%IMG%", "");
            }

            if ($docPath != null) {
                $sql->replace("%DOC%", "`FILE_SRC` = '" . $docPath . "'" );
            } else {
                $sql->replace("%DOC%", "");
            }
            
            $result = $this->mySQLWorker->connectLink->query($sql->getSql());  

        }
        
    }

?>