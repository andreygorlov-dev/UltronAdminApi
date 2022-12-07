<?php
    ini_set('display_errors', 1);
    error_reporting(E_ALL);

    class Card extends apiBaseClass { 
        function get_card($getData, $postData) {
            return "card get request";
        }

        function post_card($getData, $postData) {
            return "card post request";
        }

        function delete_card($getData, $postData) {
            return "card delete request";
        }

        function put_card($getData, $postData) {
            return "card put request";
        }
        
    }

?>