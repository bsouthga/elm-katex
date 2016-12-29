module Main exposing (main)

import KaTeX exposing (render, renderToString, renderWithOptions, defaultOptions)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)


type alias Model =
    { expression : String
    }


main : Program Never Model Msg
main =
    Html.beginnerProgram
        { model = model
        , view = view
        , update = update
        }


type Msg
    = Change String


model : Model
model =
    Model "\\pi"


update : Msg -> Model -> Model
update msg model =
    case msg of
        Change expression ->
            { model | expression = expression }


view : Model -> Html Msg
view model =
    div
        [ style
            [ ( "max-width", "600px" )
            , ( "margin", "0 auto" )
            , ( "margin-top", "50px" )
            , ( "font-family", "sans-serif" )
            ]
        ]
        [ h1 [] [ text "Render LaTeX in Elm using KaTeX" ]
        , div []
            [ a [ href "https://github.com/bsouthga/elm-katex/" ]
                [ text "elm-katex" ]
            , a
                [ style
                    [ ( "margin-left", "10px" )
                    ]
                , href "https://github.com/bsouthga/elm-katex/blob/master/examples/Example.elm"
                ]
                [ text "(Example Source)"
                ]
            ]
        , hr [] []
        , h2 [] [ text "Input expression" ]
        , input [ type_ "text", placeholder "Expression", onInput Change ] []
        , h2 [] [ text "Rendered Element" ]
        , div []
            [ (render model.expression)
            ]
        , h2 [] [ text "Display Mode" ]
        , div []
            [ (renderWithOptions { defaultOptions | displayMode = True } model.expression)
            ]
        , h2 [] [ text "Raw String" ]
        , div []
            [ text (renderToString model.expression)
            ]
        ]
