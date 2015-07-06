import String

import IO.IO exposing (..)
import IO.Runner exposing (Request, Response, run)
import ElmTest.Runner.Console exposing (runDisplay)
import ElmTest.Test exposing (..)


tests : Test
tests = suite "Tetris Tests"
        [
        ]

port requests : Signal Request
port requests = run responses (runDisplay tests)

port responses : Signal Response