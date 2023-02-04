<?php
    require_once('../SqlScript.php');

    ini_set('display_errors', 1);
    error_reporting(E_ALL);

    class Search extends apiBaseClass {

        function get_Search($getData, $postData) {
            if (!isset($getData['query'])) {
                throw new InvalidArgumentException('Не введён запрос');
            }
            
            $result = $this->mySQLWorker->connectLink->query((new SqlScript("/Search/sql/Search.sql"))->replace('%QUERY%', $getData['query'])->getSql());
            $myArray = array();
            while($row = $result->fetch_assoc()) {
                $myArray[] = $row;
            }
            return $myArray;

        }

    }
?>