@ignore
Feature: Generic Set Cookies

    Background:
        * url baseCookie

    Scenario: Set Cookies Generic
        * def loginResponse = call read(loginFeature)
        Given path '/api/auth/login'
        And request 
        """
        {
            "Nombres": "#(loginResponse.nombres)",
            "Apellidos": "#(loginResponse.apellidos)",
            "token": "#(loginResponse.token)",
            "Genero": "#(loginResponse.genero)",
            "Google_Drive_Foto_ID": "#(loginResponse.googleDriveFotoId)",
            "Rol": "#(loginResponse.rol)"
        }
        """
        When method post
        Then status 201
   

    