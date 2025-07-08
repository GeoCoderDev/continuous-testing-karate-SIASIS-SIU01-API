@axuiliarPrueba
Feature: Prueba Directivo

    Background:
        * url baseUrl

    Scenario: Token de directivo
        Given path '/api/login/auxiliar'
        And request { "Nombre_Usuario": "brigida_gonzales_1535", "Contraseña": "15357278" }
        When method post
        Then status 200
        * def token = response.data.token
        * def rol = response.data.Rol
        * def nombres = response.data.Nombres
        * def apellidos = response.data.Apellidos
        * def genero = response.data.Genero
        * def googleDriveFotoId = response.data.Google_Drive_Foto_ID
        And print token
        And print rol

        