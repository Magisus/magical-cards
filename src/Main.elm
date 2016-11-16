port module Mtg exposing (..)
import Html exposing (Html, Attribute, beginnerProgram, div, button, text)
import Html.Events exposing (onClick)
import Html.Attributes exposing (style)
import Color exposing (Color, rgb)
import Color.Convert exposing (colorToHex)

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


createStyle : Model -> Attribute msg
createStyle model =
      style
          [ ("backgroundColor", colorToHex model.background)
          , ("height", "90px")
          , ("width", "100%")
          ]


view : Model -> Html Msg
view model =
    div [] [ div [ createStyle model ] []
    , button [ onClick Red ] [ text "R" ]
    , button [ onClick Green ] [ text "G" ]
    , button [ onClick Blue ] [ text "B" ]
    ]
