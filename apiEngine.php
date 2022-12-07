<?php
    require_once('MySQLiWorker.php');
    require_once ('apiConstants.php');
    
    class APIEngine {
    
        private $apiGetData;
        private $apiPostData;
        private $method;
        private $apiName;
    
        //Статичная функция для подключения API из других API при необходимости в методах
        static function getApiEngineByName($apiName) {
            require_once 'apiBaseClass.php';
            require_once dirname(__FILE__). '\\' . $apiName . '\\' . $apiName . '.php';
            $apiClass = new $apiName();
            return $apiClass;
        }
        
        //Конструктор
        //$apiFunctionName - название API и вызываемого метода в формате apitest_helloWorld
        //$apiFunctionParams - JSON параметры метода в строковом представлении
        function __construct($apiName, $apiGetData, $apiPostData, $method) {
            $this->apiGetData = $apiGetData;
            $this->apiPostData = $apiPostData;
            $this->method = strtolower($method);
            $this->apiName = $apiName;
        }
    
        //Создаем JSON ответа
        function createDefaultJson() {
            $retObject = json_decode('{}');
            $response = APIConstants::$RESPONSE;
            $retObject->$response = json_decode('{}');
            return $retObject;
        }
        
        //Вызов функции по переданным параметрам в конструкторе
        function callApiFunction() {
            $resultFunctionCall = $this->createDefaultJson();//Создаем JSON  ответа
            if (file_exists(dirname(__FILE__). '\\' . $this->apiName . '\\' . $this->apiName . '.php')) {
                $apiClass = APIEngine::getApiEngineByName($this->apiName);//Получаем объект API
                $apiReflection = new ReflectionClass($this->apiName);//Через рефлексию получем информацию о классе объекта
                try {
                    $functionName = $this->method . '_card';//Название метода для вызова
                    $apiReflection->getMethod($functionName);//Провераем наличие метода
                    $response = APIConstants::$RESPONSE;
                    $resultFunctionCall->$response = $apiClass->$functionName($this->apiGetData, $this->apiPostData);
                } catch (Exception $ex) {
                    //Непредвиденное исключение
                    $resultFunctionCall->error = $ex->getMessage();
                }
            } else {
                //Если запрашиваемый API не найден
                $resultFunctionCall->errno = APIConstants::$ERROR_ENGINE_PARAMS;
                $resultFunctionCall->error = 'File not found';
                $resultFunctionCall->REQUEST = $_REQUEST;
            }
            return json_encode($resultFunctionCall);
        }
    }

?>