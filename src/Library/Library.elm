module Library.Library exposing (..)

import Maybe exposing (..)
import List exposing (..)
import Card exposing (..)
import List exposing (..)
import Util.ListUtil exposing (..)


type alias Library =
    List Card


init : Int -> Library
init cardCount =
    repeat cardCount (Card "fake")


popTop : Library -> ( Maybe Card, Library )
popTop library =
    case library of
        [] ->
            ( Nothing, [] )

        x :: xs ->
            ( Just x, xs )

popBottom : Library -> ( Maybe Card, Library )
popBottom library =
    case library of
        [] ->
            ( Nothing, [] )
        xs ->
            let
                card =
                    reverse xs |> head
                rest =
                    reverse xs |> tail
            in
                case rest of
                    Nothing ->
                        ( card, [] )
                    Just r ->
                        ( card, reverse r )

pushTop : Card -> Library -> Library
pushTop card library =
    card :: library


pushBottom : Card -> Library -> Library
pushBottom card library =
    library ++ [ card ]


removeByName : String -> Library -> ( Maybe Card, Library )
removeByName name library =
    Util.ListUtil.remove (\card -> card.name == name) [] library