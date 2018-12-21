module Loading exposing (loadingSpinner)

import Element exposing (Element, centerX, image)


loadingSpinner : Element msg
loadingSpinner =
    { src = "assets/spinner.svg"
    , description = "loading..."
    }
        |> image [ centerX ]
