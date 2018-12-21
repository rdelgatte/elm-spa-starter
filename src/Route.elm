module Route exposing (Route(..), fromUrl, href, parser, pushUrl, replaceUrl, routeToString)

import Browser.Navigation as Nav
import Html exposing (Attribute)
import Html.Attributes as Attr
import Url exposing (Url)
import Url.Parser as Parser exposing ((</>), (<?>), Parser, oneOf, query, s, string, top)



-- ROUTING


type Route
    = Root
    | Home


parser : Parser (Route -> a) a
parser =
    oneOf
        [ Parser.map Home (s "home")
        ]



-- PUBLIC HELPERS


href : Route -> Attribute msg
href targetRoute =
    Attr.href (routeToString targetRoute)


replaceUrl : Maybe Nav.Key -> Route -> Cmd msg
replaceUrl maybeNavKey route =
    case maybeNavKey of
        Nothing ->
            Cmd.none

        Just key ->
            Nav.replaceUrl key (routeToString route)


pushUrl : Url -> Maybe Nav.Key -> Cmd msg
pushUrl url maybeKey =
    case maybeKey of
        Nothing ->
            Cmd.none

        Just key ->
            Nav.pushUrl key (Url.toString url)


fromUrl : Url -> Maybe Route
fromUrl url =
    { url | path = Maybe.withDefault "" url.fragment, fragment = Nothing }
        |> Parser.parse parser



-- INTERNAL


routeToString : Route -> String
routeToString page =
    let
        pieces =
            case page of
                Root ->
                    []

                Home ->
                    [ "home" ]
    in
    "#/" ++ String.join "/" pieces
