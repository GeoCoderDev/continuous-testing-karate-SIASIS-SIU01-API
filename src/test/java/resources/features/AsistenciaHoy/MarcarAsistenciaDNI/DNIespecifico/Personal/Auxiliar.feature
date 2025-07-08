@A-ASISTENCIAPERSONALDNI
Feature: Marcar Asistencia DNI Específico - Auxiliar

    Background:
        * url baseCookie

    Scenario: Marcar asistencia con DNI específico para Auxiliar
        * def loginFeature = 'classpath:resources/features/login/Directivo.feature'
        * call read('classpath:resources/features/SetCookies/GenericSetCookies.feature')
        * def fechaHoraEsperadaISO = getAdjustedTime()
        Given path '/api/asistencia-hoy/marcar'
        And request 
        """
        {
            "ID_o_DNI": "15430124",
            "TipoAsistencia": "personal",
            "Actor": "A",
            "ModoRegistro": "E",
            "FechaHoraEsperadaISO": "#(fechaHoraEsperadaISO)"
        }
        """
        When method post
        Then status 200
