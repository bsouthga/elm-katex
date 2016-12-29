module Main exposing (main)

import KaTeX
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
    Model ""


update : Msg -> Model -> Model
update msg model =
    case msg of
        Change expression ->
            { model | expression = expression }


view : Model -> Html Msg
view model =
    div []
        [ h1 [] [ text "Enter LaTeX" ]
        , input [ type_ "text", placeholder "Expression", onInput Change ] []
        , h1 [] [ text "Rendered Element" ]
        , div []
            [ (KaTeX.render model.expression)
            ]
        , h1 [] [ text "Raw String" ]
        , div []
            [ text (KaTeX.renderToString model.expression)
            ]
        ]
