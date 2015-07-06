module Tetris.View where

import Tetris.Model exposing (..)

import Graphics.Collage exposing (..)
import Graphics.Element exposing (..)
import Color exposing (Color, rgb, red, blue, yellow, hsla, toHsl)
import Text

view _ =
  viewPiece I

viewPiece : Piece -> Element
viewPiece piece =
  let b = box piece in
  case piece of
    I -> flow right [b, b, b, b]

boxSize : Int
boxSize = 20

box : Piece -> Element
box piece =
  let
    s = square (toFloat boxSize)
    innerColor = color piece
    borderColor = darken 0.2 innerColor
    inside = filled innerColor s
    border = outlined (solid borderColor) s
  in
    collage boxSize boxSize [inside, border]

color : Piece -> Color
color piece =
  case piece of
    I -> cyan

cyan : Color
cyan = rgb 0 255 255

violet : Color
violet = rgb 170 0 255

orange : Color
orange = rgb 255 165 0

darken : Float -> Color -> Color
darken percent c =
  let
    pre = toHsl c
    post = { pre | lightness <- (min pre.lightness (pre.lightness * (1 - percent)))}
  in
    hsla post.hue post.saturation post.lightness post.alpha

txt str =
  Text.fromString str
  |> Text.monospace
  |> centered