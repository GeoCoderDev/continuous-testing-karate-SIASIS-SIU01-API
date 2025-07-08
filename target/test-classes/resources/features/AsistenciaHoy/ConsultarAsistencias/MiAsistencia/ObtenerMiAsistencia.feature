@OBTENERMIASISTENCIA
Feature: Obtener mi asistencia

    Background:
        * url baseCookie
        * call read('classpath:resources/features/AsistenciaHoy/MarcarAsistenciaDNI/AsistenciaPropia/MarcarAsistencia.feature')        
    Scenario Outline: Marcar asistencia y Obtener mi asistencia
        Given path '/api/asistencia-hoy/consultar-asistencias-tomadas'
        * def loginFeature = 'classpath:resources/features/login/<rol>.feature'
        * call read('classpath:resources/features/SetCookies/GenericSetCookies.feature')
        And param TipoAsistencia = 'personal'
        And param ModoRegistro = 'E'
        When method get
        Then status 200
        Examples:
            | rol              |
            | Directivo        |
            | Auxiliar         |
            | CasoNoTutor      |
            | CasoTutorSecundaria |
            | ProfesorPrimaria |
            | PersonalAdmin    |
