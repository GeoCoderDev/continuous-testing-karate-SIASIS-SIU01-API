@EP-ASISTENCIAPERSONALDNI
Feature: Marcar Asistencia Estudiantes Primaria - DNI Específico

    Background:
        * url baseCookie

    Scenario: Marcar asistencia con DNI específico para estudiante de primaria
        * def loginFeature = 'classpath:resources/features/login/ProfesorPrimaria.feature'
        * call read('classpath:resources/features/SetCookies/GenericSetCookies.feature')
        * def fechaHoraEsperadaISO = getAdjustedTime()
        Given path '/api/asistencia-hoy/marcar'
        And request
            """
            {
                "ID_o_DNI": "15357278",
                "TipoAsistencia": "primaria",
                "Actor": "E",
                "ModoRegistro": "E",
                "FechaHoraEsperadaISO": "#(fechaHoraEsperadaISO)",
                "NivelDelEstudiante": "P",
                "Grado": 1,
                "Seccion": "A"
            }
            """
        When method post
        Then status 200
