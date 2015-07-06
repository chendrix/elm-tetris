module Tetris.View where

import Tetris.Model exposing (..)

import Graphics.Collage exposing (..)
import Graphics.Element exposing (..)
import Text

view _ =
  txt "Not yet implemented"

txt str =
  Text.fromString str
  |> Text.monospace
  |> centered