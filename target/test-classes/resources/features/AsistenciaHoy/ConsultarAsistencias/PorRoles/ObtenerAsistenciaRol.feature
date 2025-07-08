@ASISTENCIAROLES
Feature: Datos Asistencia Hoy con cookies - Marcar y Consultar

    Background:
        * url baseCookie
        * call read('classpath:resources/features/AsistenciaHoy/MarcarAsistenciaDNI/AsistenciaPropia/MarcarAsistencia.feature')
        * def loginFeature = 'classpath:resources/features/login/Directivo.feature'
        * call read('classpath:resources/features/SetCookies/GenericSetCookies.feature')
        
    Scenario Outline: Marcar asistencia y luego consultar asistencias para un rol específico
        Given path '/api/asistencia-hoy/consultar-asistencias-tomadas'
        And param TipoAsistencia = 'personal'
        And param Actor = <actor>
        And param ModoRegistro = 'E'
        When method get
        Then status 200
        Examples:
            | actor |
            | 'D'     |
            | 'A'     |
            | 'PP'    |
            | 'PS'    |
            | 'PA'    |
