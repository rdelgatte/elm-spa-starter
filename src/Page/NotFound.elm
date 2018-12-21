module Page.NotFound exposing (view)

import Element exposing (Element, el, text)
import Element.Region as Region



-- VIEW


view : { title : String, content : Element msg }
view =
    { title = "Page Not Found"
    , content =
        text "Page not found"
            |> el [ Region.heading 1 ]
    }
