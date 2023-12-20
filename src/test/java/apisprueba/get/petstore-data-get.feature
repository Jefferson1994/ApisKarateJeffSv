Feature: Ejercicio de APIS opcion 3



  Background:

    * url api.baseUrl
    * def GetjsonresponseBien = read("successful-response-get.json")

  Scenario Outline:Registrar Usuario
    Given path '/v2/user'
    And request <parametros>
    When method post
    Then status 200

    Examples:
      |parametros|
      |{"id":1010 ,"username":"Jeff1111","firstName": "Jefferson ","lastName": "Sarango V","email": "jeff@mail.com","password":"123456","phone": "123456","userStatus": 0}|
      |{"id":"1111","username":"Jeff2222","firstName": "Jefferson Hernan ","lastName": "Sarango Vega","email": "jeff@mail.com","password":"123456","phone": "123456","userStatus": 0}|
      |{"id":1112,"username":"Jeff333","firstName": "Jefferson Andres ","lastName": "Sarango Vegas","email": "jeff@mail.com","password":"123456","phone": "123456","userStatus": 0}|



  Scenario Outline: Obtener información de un usuario por nombre de usuario
    And path '/v2/user', '<username>'
    When method get
    Then status 200
    And match $ == GetjsonresponseBien

    Examples:
      |username|
      |Jeff19944|
      |Jeff111|
      |Jeff1111|
      |Jeff2222|
      |Jeff333|



  Scenario Outline: Logearse en el sistema
    And path '/v2/user/logout'
    And request <parametros>
    When method get
    Then status 200

    Examples:
      | parametros                                    |
      | {"username": "Jeff19944", "password": "123456"} |
      | {"username": "Jeff111", "password": "123456"} |
      | {"username": "Jeff1111", "password": "123456"}   |
      | {"username": "Jeff2222", "password": "123456"}   |
      | {"username": "Jeff333", "password": "123456"}    |



  Scenario Outline: Actualizar el nombre y el correo
    And path '/v2/user/<username>'
    And request  <parametros>
    When method put
    Then status 200


    Examples:
    Examples:
      | username  | parametros |
      | Jeff333 | {"id": 4444, "username": "Jeff1111", "firstName": "Jefferson moises ", "lastName": "Sarango V", "email": "jeff1994@mail.com", "password": "123456", "phone": "123456", "userStatus": 0} |
      | Jeff2222 | {"id": 5555, "username": "Jeff2222", "firstName": "Jefferson Fernado ", "lastName": "Sarango Vega", "email": "jeff44@mail.com", "password": "123456", "phone": "123456", "userStatus": 0} |
      | Jeff1111   | {"id": 6666, "username": "Jeff333", "firstName": "Jefferson Alcivar", "lastName": "Sarango Vegas", "email": "jeff1958@mail.com", "password": "123456", "phone": "123456", "userStatus": 0} |



  Scenario Outline: Eliminar Usuario
    And path '/v2/user', '<username>'
    When method delete
    Then status 200

    Examples:
      |username|
      |Jeff2222|
      |Jeff111|
      |Jeff222|



