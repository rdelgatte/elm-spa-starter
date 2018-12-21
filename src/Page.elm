module Page exposing (Page(..), view)

import Browser exposing (Document)
import Element exposing (Attribute, Color, Element, alignRight, centerX, column, el, fill, height, image, layout, link, padding, px, rgb255, rgba255, row, spacing, text, width)
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font exposing (color)
import Element.Region as Region
import Html.Events exposing (onClick)
import Route exposing (Route, routeToString)
import Session exposing (Session)


defaultLayout =
    layout
        [ width fill
        ]


type Page
    = Other
    | Home
    | Products
    | Skus
    | Sku
    | ProductGroup


view : Page -> { title : String, content : Element msg } -> Document msg
view page { title, content } =
    let
        footerAttributes =
            [ Region.footer
            , Background.color (rgb255 96 181 204)
            , width fill
            , height (px 30)
            ]
    in
    { title = "Basic SPA - " ++ title
    , body =
        [ column
            [ centerX
            , width fill
            ]
            [ viewHeader page
            , content
            , viewFooter footerAttributes
            ]
            |> defaultLayout
        ]
    }


viewHeader : Page -> Element msg
viewHeader page =
    let
        headerLogo =
            { url = routeToString Route.Home
            , label = { src = "src/assets/logo.png", description = "logo" } |> image [ height (px 80) ]
            }
                |> link [ Region.heading 1 ]
    in
    headerLogo
        :: viewMenu page
        |> row
            [ Region.navigation
            , Background.color (rgb255 96 181 204)
            , width fill
            , height (px 80)
            , padding 5
            ]


viewMenu : Page -> List (Element msg)
viewMenu page =
    let
        linkTo =
            navbarLink page
    in
    [ text "Home"
        |> linkTo Route.Home
    ]


activeLinkAttributes : Page -> Route -> List (Attribute msg)
activeLinkAttributes page route =
    case isActive page route of
        True ->
            [ Border.width 1
            , Font.bold
            , Border.shadow
                { offset = ( 1, 1 )
                , size = 1
                , blur = 3
                , color =
                    rgba255 255 255 255 0.5
                }
            ]

        False ->
            []


navbarLink : Page -> Route -> Element msg -> Element msg
navbarLink page route label =
    { url = routeToString route
    , label = label
    }
        |> link
            (activeLinkAttributes
                page
                route
                |> List.append [ padding 10 ]
            )
        |> el
            [ Region.navigation
            , alignRight
            , height (px 50)
            , padding 10
            ]


viewFooter : List (Attribute msg) -> Element msg
viewFooter attributes =
    { url = ""
    , label = text "Footer"
    }
        |> link attributes


isActive : Page -> Route -> Bool
isActive page route =
    case ( page, route ) of
        ( Home, Route.Home ) ->
            True

        _ ->
            False
