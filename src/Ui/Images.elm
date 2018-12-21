module Images exposing (findSelected, imagesToDict)

import Dict exposing (Dict, fromList)
import Element exposing (Element)
import Tuple exposing (first, second)


imagesToDict : List { src : String, description : String } -> String -> Dict String (List { src : String, description : String })
imagesToDict images selected =
    let
        tupleImages =
            images
                |> List.partition (\image -> image.src == selected)

        maybeSelectedImage =
            first tupleImages |> List.head
    in
    (case maybeSelectedImage of
        Nothing ->
            case images |> List.isEmpty of
                False ->
                    [ ( "false", images ) ]

                True ->
                    []

        Just selectedImage ->
            case second tupleImages |> List.isEmpty of
                True ->
                    [ ( "true", [ selectedImage ] ) ]

                False ->
                    [ ( "true", [ selectedImage ] )
                    , ( "false", second tupleImages )
                    ]
    )
        |> Dict.fromList


findSelected : Dict String (List { src : String, description : String }) -> Maybe { src : String, description : String }
findSelected imagesByStatus =
    case imagesByStatus |> Dict.get "true" of
        Nothing ->
            Nothing

        Just images ->
            images
                |> List.head
