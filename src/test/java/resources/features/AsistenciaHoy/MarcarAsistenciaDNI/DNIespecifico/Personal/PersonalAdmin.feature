@PA-ASISTENCIAPERSONALDNI
Feature: Marcar Asistencia DNI Específico - Personal Admin

    Background:
        * url baseCookie

    Scenario: Marcar asistencia con DNI específico para Personal Admin
        * def loginFeature = 'classpath:resources/features/login/Directivo.feature'
        * call read('classpath:resources/features/SetCookies/GenericSetCookies.feature')
        * def fechaHoraEsperadaISO = getAdjustedTime()
        Given path '/api/asistencia-hoy/marcar'
        And request 
        """
        {
            "ID_o_DNI": "41809910",
            "TipoAsistencia": "personal",
            "Actor": "PA",
            "ModoRegistro": "E",
            "FechaHoraEsperadaISO": "#(fechaHoraEsperadaISO)"
        }
        """
        When method post
        Then status 200
