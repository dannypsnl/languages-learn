module Main exposing (..)

import Markdown
import Html exposing (Html, Attribute, textarea, button, div, text)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick, onInput)


main =
    Html.beginnerProgram { model = model, view = view, update = update }



-- MODEL


type alias Model =
    { content : String
    }


model : Model
model =
    { content = "" }



-- UPDATE


type Msg
    = Change String


update : Msg -> Model -> Model
update msg model =
    case msg of
        Change newContent ->
            { model | content = newContent }



-- VIEW


view : Model -> Html Msg
view model =
    div []
        [ textarea [
            placeholder "Text to reverse",
            onInput Change,
            rows 30,
            cols 30
          ] []
        , div [] [ Markdown.toHtml [] model.content ]
        ]
