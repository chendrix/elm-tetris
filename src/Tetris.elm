module Tetris where

import Time exposing (..)

import Tetris.Model exposing (..)
import Tetris.View exposing (..)

main =
  Signal.map view gameState

gameState =
  every hour