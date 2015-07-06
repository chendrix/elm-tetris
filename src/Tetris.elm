module Tetris where

import Time exposing (..)

import Graphics.Collage exposing (..)
import Graphics.Element exposing (..)
import Text

main =
  Signal.map view gameState

view _ =
  txt "Not yet implemented"

gameState =
  every hour

txt str =
  Text.fromString str
  |> Text.monospace
  |> centered