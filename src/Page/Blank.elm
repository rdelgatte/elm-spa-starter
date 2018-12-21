module Page.Blank exposing (view)

import Element exposing (Element, text)
import Html exposing (Html)


view : { title : String, content : Element msg }
view =
    { title = ""
    , content = text ""
    }
