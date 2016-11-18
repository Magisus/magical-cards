port module Mtg exposing (..)
import Html exposing (Html, Attribute, beginnerProgram, div, button, text)
import Html.Events exposing (onClick)
import Html.Attributes exposing (style)
import Color exposing (Color, rgb, toRgb)
import Color.Convert exposing (colorToHex)

main =
    Html.beginnerProgram { model = model, view = view, update = update }

type alias Model = RgbColor

model : Model
model =
    { red = 0, green = 0, blue = 0, alpha = 100 }

type alias RgbColor = { red : Int, green : Int, blue : Int, alpha : Float }


resetAt255 : Int -> Int
resetAt255 number =
    if number >= 255 then 0 else number + 5


toColor : RgbColor -> Color
toColor components =
    rgb components.red components.green components.blue

type Msg =
    Red | Green | Blue

update : Msg -> Model -> Model
update msg model =
    case msg of
        Red ->
            { model | red = resetAt255 model.red }
        Green ->
            { model | green = resetAt255 model.green }
        Blue ->
            { model | blue = resetAt255 model.blue }


createStyle : Model -> Attribute msg
createStyle model =
      style
          [ ("backgroundColor", model |> toColor |> colorToHex)
          , ("height", "90px")
          , ("width", "100%")
          ]


view : Model -> Html Msg
view model =
    div [] [ div [ createStyle model, onClick Blue ] []
    , button [ onClick Red ] [ text "R" ]
    , button [ onClick Green ] [ text "G" ]
    , button [ onClick Blue ] [ text "B" ]
    ]
