port module Mtg exposing (..)
import Html exposing (..)
import Color exposing (..)

main =
    Html.beginnerProgram { model = model, view = view, update = update }


type alias Model =
    { background : Color
    }

model : Model
model =
    { background = (rgb 255 0 0) }


type Msg =
    Red | Green | Blue

update : Msg -> Model -> Model
update msg model =
    case msg of
        Red ->
             model
        Green ->
             model
        Blue ->
             model


view : Model -> Html Msg
view model =
    text "hello"
