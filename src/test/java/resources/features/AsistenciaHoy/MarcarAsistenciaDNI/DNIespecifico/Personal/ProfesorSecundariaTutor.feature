@PS-ASISTENCIAPERSONALDNI
Feature: Marcar Asistencia DNI Específico - Profesor Secundaria Tutor

    Background:
        * url baseCookie

    Scenario: Marcar asistencia con DNI específico para profesor de Secundaria Tutor
        * def loginFeature = 'classpath:resources/features/login/Directivo.feature'
        * call read('classpath:resources/features/SetCookies/GenericSetCookies.feature')
        * def fechaHoraEsperadaISO = getAdjustedTime()
        Given path '/api/asistencia-hoy/marcar'
        And request 
        """
        {
            "ID_o_DNI": "15371028",
            "TipoAsistencia": "personal",
            "Actor": "PS",
            "ModoRegistro": "E",
            "FechaHoraEsperadaISO": "#(fechaHoraEsperadaISO)"
        }
        """
        When method post
        Then status 200
