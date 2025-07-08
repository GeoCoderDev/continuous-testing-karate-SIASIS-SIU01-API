@SETCOOKIES
Feature: Set Cookies con diferentes usuarios

    Scenario Outline: Set Cookies para <usuario>
        * def loginFeature = '../login/<login>.feature'
        * call read('GenericSetCookies.feature')

    Examples:
        | usuario           | login                |
        | Directivo         | Directivo            |
        | Auxiliar          | CasoNoTutor          |
        | TutorSecundaria   | CasoTutorSecundaria  |
        | ProfesorPrimaria  | ProfesorPrimaria     |
        | PersonalAdmin     | PersonalAdmin        |
