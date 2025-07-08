@OBTENERASISTENCIADNI
Feature: Datos Asistencia Hoy con cookies - Marcar y Consultar

    Background:
        * url baseCookie
        * call read('classpath:resources/features/AsistenciaHoy/MarcarAsistenciaDNI/AsistenciaPropia/MarcarAsistencia.feature')
        * def loginFeature = 'classpath:resources/features/login/Directivo.feature'
        * call read('classpath:resources/features/SetCookies/GenericSetCookies.feature')
        
    Scenario Outline: Obtener asistencias por DNI específico para personal
        Given path '/api/asistencia-hoy/consultar-asistencias-tomadas'
        And param TipoAsistencia = 'personal'
        And param Actor = <actor>
        And param ModoRegistro = 'E'
        And param ID_o_DNI = '<DNI>'
        When method get
        Then status 200
        Examples:
            | actor | DNI    | 
            | 'D'     | 15430124 | 
            | 'A'     | 15357278 | 
            | 'PP'    | 15378317 | 
            | 'PS'    | 15371028 | 
            | 'PA'    | 41809910 | 
