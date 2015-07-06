module Tetris.Color where

import Tetris.Model exposing (..)
import Color exposing (Color, rgb, red, yellow, hsla, toHsl)

color : Piece -> Color
color piece =
  case piece of
    I -> cyan
    J -> blue
    L -> orange
    O -> yellow

cyan : Color
cyan = rgb 0 255 255

violet : Color
violet = rgb 170 0 255

orange : Color
orange = rgb 255 165 0

blue : Color
blue = rgb 0 0 255

yellow : Color
yellow = rgb 255 255 0

darken : Float -> Color -> Color
darken percent c =
  let
    pre = toHsl c
    post = { pre | lightness <- (min pre.lightness (pre.lightness * (1 - percent)))}
  in
    hsla post.hue post.saturation post.lightness post.alpha
