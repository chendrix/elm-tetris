module Tetris.View where

import Tetris.Model exposing (..)
import Tetris.Color as C exposing (..)

import Graphics.Collage exposing (..)
import Graphics.Element exposing (..)
import Text

import List exposing (..)

view _ =
  [I, J, L, O, S, T, Z]
  |> map viewPiece
  |> flow down

viewPiece : Piece -> Element
viewPiece piece =
  let
    b = box piece
    s = spacer boxSize boxSize
  in
  case piece of
    I -> flow right [b, b, b, b]
    J -> flow down [flow right [b, b, b], flow right [s, s, b]]
    L -> flow down [flow right [b, s, s], flow right [b, b, b]]
    O -> flow down [flow right [b, b], flow right [b, b]]
    S -> flow down [flow right [s, b, b], flow right [b, b, s]]
    T -> flow down [flow right [b, b, b], flow right [s, b, s]]
    Z -> flow down [flow right [b, b, s], flow right [s, b, b]]
    otherwise -> empty

boxSize : Int
boxSize = 20

box : Piece -> Element
box piece =
  let
    s = square (toFloat boxSize)
    innerColor = C.color piece
    borderColor = darken 0.2 innerColor
    inside = filled innerColor s
    border = outlined (solid borderColor) s
  in
    collage boxSize boxSize [inside, border]

txt str =
  Text.fromString str
  |> Text.monospace
  |> centered