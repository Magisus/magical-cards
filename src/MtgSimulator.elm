port module MtgSimulator exposing (..)

import Html exposing (..)
import List exposing (head, tail, isEmpty)
import Maybe exposing (withDefault)


main =
    program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }



-- INIT --


type alias Model =
    Deck


type alias Deck =
    { library : List String
    , hand : List String
    }


model : List String -> List String -> Model
model library hand =
    { library = library, hand = hand }


init : ( Model, Cmd Msg )
init =
    ( model [] [], Cmd.none )



-- UPDATE --


type Msg
    = DrawCard


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    ( model, Cmd.none )


drawCard : Deck -> Deck
drawCard deck =
    let
        card =
            deck.library
                |> head

        library =
            deck.library
                |> tail
                |> withDefault []
    in
        case card of
            Nothing ->
                deck

            Just c ->
                { deck | library = library, hand = c :: deck.hand }



-- VIEW --


view : Model -> Html Msg
view model =
    text "Hello"



-- SUBSCRIPTIONS --


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
