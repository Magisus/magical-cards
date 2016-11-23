module Tests exposing (..)

import Test exposing (..)
import Expect
import Fuzz exposing (list, int, tuple, string)
import String


all : Test
all =
    describe "Game Simulator" 
        [ test "failing test" <| 
            \() -> Expect.true "this should fail" False 
        ]
