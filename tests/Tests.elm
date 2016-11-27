module Tests exposing (..)

import Test exposing (..)
import Expect
import String
import MtgSimulator exposing (..)


all : Test
all =
    describe "Game Simulator"
        [ describe "Moving cards between zones"
            [ test "the top card should move from library to hand" <|
                \() ->
                    let
                        initial =
                            { library = [ "1", "2", "3" ]
                            , hand = []
                            }

                        expected =
                            { library = [ "2", "3" ]
                            , hand = [ "1" ]
                            }
                    in
                        Expect.equal expected <| MtgSimulator.drawCard initial
            , test "nothing should happen when library is empty" <|
                \() ->
                    let
                        initial =
                            { library = [], hand = [ "1" ] }
                    in
                        Expect.equal initial <| MtgSimulator.drawCard initial
            ]
        ]
