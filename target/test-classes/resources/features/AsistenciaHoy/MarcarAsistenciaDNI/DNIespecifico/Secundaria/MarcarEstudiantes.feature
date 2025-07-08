@ES-ASISTENCIAPERSONALDNI
Feature: Marcar Asistencia Estudiantes Secundaria - DNI Específico

    Background:
        * url baseCookie

    Scenario: Marcar asistencia con DNI específico para Auxiliar
        * def loginFeature = 'classpath:resources/features/login/Auxiliar.feature'
        * call read('classpath:resources/features/SetCookies/GenericSetCookies.feature')
        * def fechaHoraEsperadaISO = getAdjustedTime()
        Given path '/api/asistencia-hoy/marcar'
        And request
            """
            {
                "ID_o_DNI": "11234534",
                "TipoAsistencia": "secundaria",
                "Actor": "E",
                "ModoRegistro": "E",
                "FechaHoraEsperadaISO": "#(fechaHoraEsperadaISO)",
                "NivelDelEstudiante": "S",
                "Grado": 1,
                "Seccion": "A"
            }
            """
        When method post
        Then status 200
