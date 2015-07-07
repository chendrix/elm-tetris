module Tetris.Model where

import Matrix exposing (..)

import List as L exposing (..)

type Piece
  = I
  | J
  | L
  | O
  | S
  | T
  | Z

type RotationUnit
  = None
  | CCW90
  | CCW180
  | CCW270

inDegrees : RotationUnit -> Float
inDegrees unit =
  case unit of
    None ->  degrees 0
    CCW90 -> degrees 90
    CCW180 -> degrees 180
    CCW270 -> degrees 270

rotateCW : RotationUnit -> RotationUnit
rotateCW unit =
  case unit of
    None -> CCW90
    CCW90 -> CCW180
    CCW180 -> CCW270
    CCW270 -> None

rotateCCW : RotationUnit -> RotationUnit
rotateCCW unit =
  case unit of
    None -> CCW270
    CCW90 -> None
    CCW180 -> CCW90
    CCW270 -> CCW180

type alias Tetrimino = { piece : Piece, rotation : RotationUnit }

tetrimino : Piece -> Tetrimino
tetrimino p = { piece = p, rotation = None }


allTetriminos : Piece -> List Tetrimino
allTetriminos p =
  L.map (\r -> { piece = p, rotation = r})
    [None, CCW90, CCW180, CCW270]