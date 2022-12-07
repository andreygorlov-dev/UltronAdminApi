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

        public static function getRandomFileName($path, $extension='')
        {
            do {
                $name = md5(microtime() . rand(0, 9999));
                $file = $path . $name . $extension;
            } while (file_exists($file));
        
            return $name;
        }

        public static function saveFile($fileBase64, $extension) 
        {
            $path_with_end_slash = "\\img\\";
            $splited = explode(',', substr($fileBase64 , 5 ) , 2);
            $mime=$splited[0];
            $data=$splited[1];
            $output_file_without_extension = apiBaseClass::getRandomFileName($path_with_end_slash, $extension);
            $mime_split_without_base64=explode(';', $mime,2);
            $mime_split=explode('/', $mime_split_without_base64[0],2);
            $output_file_with_extension=$output_file_without_extension.'.'.$extension;
            file_put_contents(dirname(__FILE__). '\\' . $path_with_end_slash . $output_file_with_extension, base64_decode($data) );
            return "/".$path_with_end_slash . "/" . $output_file_with_extension;
        }
        
    }

?>