<?php

    class SqlScript
    {

        private $sql;

        function __construct($filePath) 
        {
            $this->sql = file_get_contents(dirname(__FILE__) . $filePath);
            return $this;
        }

        function replace($search, $replace) 
        {
            $this->sql = str_replace($search, $replace, $this->sql);
            return $this;
        }

        function getSql() {
            return $this->sql;
        }

    }

?>