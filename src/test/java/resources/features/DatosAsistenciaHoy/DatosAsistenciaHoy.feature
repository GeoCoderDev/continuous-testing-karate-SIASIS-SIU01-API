@ASISTENCIAHOY
Feature: Datos Asistencia Hoy con cookies

    Background:
        * url baseCookie

    Scenario Outline: Obtener datos de asistencia para <usuario>
        * def loginFeature = '../login/<login>.feature'
        * call read('../SetCookies/GenericSetCookies.feature')
        Given path '/api/datos-asistencia-hoy'
        When method get
        Then status 200
        Examples:
            | usuario          | login               |
            | Directivo        | Directivo           |
            | Auxiliar         | CasoNoTutor         |
            | TutorSecundaria  | CasoTutorSecundaria |
            | ProfesorPrimaria | ProfesorPrimaria    |
            | PersonalAdmin    | PersonalAdmin       |
