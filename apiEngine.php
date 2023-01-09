<?php
    require_once('MySQLiWorker.php');
    require_once ('apiConstants.php');
    
    ini_set('display_errors', 0);
    ini_set('display_startup_errors', 0);
    error_reporting(E_ALL);
    
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
            return json_decode('{}');
        }
        
        //Вызов функции по переданным параметрам в конструкторе
        function callApiFunction() {
            if (file_exists(dirname(__FILE__). '\\' . $this->apiName . '\\' . $this->apiName . '.php')) {
                $apiClass = APIEngine::getApiEngineByName($this->apiName);//Получаем объект API
                $apiReflection = new ReflectionClass($this->apiName);//Через рефлексию получем информацию о классе объекта
                try {
                    $functionName = $this->method . '_' . strtolower($this->apiName);//Название метода для вызова
                    $apiReflection->getMethod($functionName);//Провераем наличие метода
                    return json_encode($apiClass->$functionName($this->apiGetData, $this->apiPostData));
                } catch (InvalidArgumentException $ex) {
                    header('HTTP/1.1 400 Bad Request');
                    $resultFunctionCall->error = $ex->getMessage();
                } catch (Exception $ex) {
                    header('HTTP/1.1 500 Internal Server Error');
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