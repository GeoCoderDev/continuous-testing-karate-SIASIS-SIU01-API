@D-ASISTENCIAPERSONALDNI
Feature: Marcar Asistencia DNI Específico - Personal Directivo

    Background:
        * url baseCookie

    Scenario: Marcar asistencia con DNI específico para personal directivo
        * def loginFeature = 'classpath:resources/features/login/Directivo.feature'
        * call read('classpath:resources/features/SetCookies/GenericSetCookies.feature')
        * def fechaHoraEsperadaISO = getAdjustedTime()
        Given path '/api/asistencia-hoy/marcar'
        And request 
        """
        {
            "ID_o_DNI": "15430124",
            "TipoAsistencia": "personal",
            "Actor": "D",
            "ModoRegistro": "E",
            "FechaHoraEsperadaISO": "#(fechaHoraEsperadaISO)"
        }
        """
        When method post
        Then status 200
