@ASISTENCIAPROPIA
Feature: Marcar mi Asitencia Propia con Rol

    Background:
        * url baseCookie

    Scenario Outline: Marcar mi asistencia propia con el rol de <usuario>
        * def loginFeature = 'classpath:resources/features/login/<login>.feature'
        * call read('classpath:resources/features/SetCookies/GenericSetCookies.feature')
        * def fechaHoraEsperadaISO = getAdjustedTime()
        Given path '/api/asistencia-hoy/marcar'
        And request
            """
            {
            "ModoRegistro": "E",
            "FechaHoraEsperadaISO": "#(fechaHoraEsperadaISO)",
            }
            """
        When method post
        Then status 200
        Examples:
            | usuario           | login               |
            | Directivo         | Directivo           |
            | Auxiliar          | Auxiliar            |
            | TutorSecundaria   | CasoTutorSecundaria |
            | NoTutorSecundaria | CasoNoTutor         |
            | ProfesorPrimaria  | ProfesorPrimaria    |
            | PersonalAdmin     | PersonalAdmin       |
