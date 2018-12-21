module Session exposing (Session, navKey)

import Browser.Navigation as Nav



-- MODEL


type alias Session =
    { navKey : Nav.Key
    }



-- HELPERS


navKey : Maybe Session -> Maybe Nav.Key
navKey maybeSession =
    case maybeSession of
        Nothing ->
            Nothing

        Just session ->
            Just session.navKey
