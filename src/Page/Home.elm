module Page.Home exposing (Model, Msg, init, update, view)

import Element exposing (Element, centerX, centerY, el, fill, height, minimum, padding, spacing, text)
import Session exposing (Session)


type alias Model =
    { session : Maybe Session
    , name : String
    }


init : Maybe Session -> ( Model, Cmd Msg )
init session =
    ( { session = session
      , name = "ELM"
      }
    , Cmd.none
    )


view : Model -> { title : String, content : Element msg }
view model =
    { title = "Welcome Home"
    , content =
        text ("Hello " ++ model.name)
            |> el
                [ centerX
                , padding 10
                , spacing 20
                , height (fill |> minimum 400)
                ]
    }


type Msg
    = LoadPage


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    ( model, Cmd.none )
