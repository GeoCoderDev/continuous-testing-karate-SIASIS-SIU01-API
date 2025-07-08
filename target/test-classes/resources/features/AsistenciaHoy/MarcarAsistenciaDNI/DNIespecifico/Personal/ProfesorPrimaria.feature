@PP-ASISTENCIAPERSONALDNI
Feature: Marcar Asistencia DNI Específico - Profesor Primaria

    Background:
        * url baseCookie

    Scenario: Marcar asistencia con DNI específico para profesor de primaria
        * def loginFeature = 'classpath:resources/features/login/Directivo.feature'
        * call read('classpath:resources/features/SetCookies/GenericSetCookies.feature')
        * def fechaHoraEsperadaISO = getAdjustedTime()
        Given path '/api/asistencia-hoy/marcar'
        And request 
        """
        {
            "ID_o_DNI": "41612389",
            "TipoAsistencia": "personal",
            "Actor": "PP",
            "ModoRegistro": "E",
            "FechaHoraEsperadaISO": "#(fechaHoraEsperadaISO)"
        }
        """
        When method post
        Then status 200
