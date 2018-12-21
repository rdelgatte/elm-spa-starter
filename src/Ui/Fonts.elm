module Fonts exposing (fontDefaultSize, navigationFontSize, robotoFont)

import Element.Font as Font


robotoFont =
    Font.external
        { url = "https://fonts.googleapis.com/css?family=Roboto"
        , name = "Roboto"
        }


fontDefaultSize =
    Font.size 14


navigationFontSize =
    Font.size 18
