<?php
    class apiBaseClass {
        
        public $mySQLWorker=null;//Одиночка для работы с базой
        
        //Конструктор с возможными параметрами
        function __construct($dbName="UltronContentDB", $dbHost="localhost", $dbUser="root", $dbPassword="") {
            if (isset($dbName)){//Если имя базы передано то будет установленно соединение с базой
                $this->mySQLWorker = MySQLiWorker::getInstance($dbName,$dbHost,$dbUser,$dbPassword);
            }
        }
        
        function __destruct() {
            if (isset($this->mySQLWorker)){             //Если было установленно соединение с базой, 
                $this->mySQLWorker->closeConnection();  //то закрываем его когда наш класс больше не нужен
            }
        }
        
        //Создаем дефолтный JSON для ответов
        function createDefaultJson() {
            $retObject = json_decode('{}');
            return $retObject;
        }
        
    }

?>