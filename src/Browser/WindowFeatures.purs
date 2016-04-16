module Browser.WindowFeatures
  ( WindowFeature
  , left
  , width
  , height
  , status
  , windowFeatures
  ) where

import Data.Foreign (Foreign)
import Data.Op (Op(Op))
import Data.Options (Option(), Options(), opt, runOptions, defaultToOptions)
import Data.String (joinWith)
import Data.Tuple (Tuple(..))
import Prelude

foreign import showForeign :: Foreign -> String

data WindowFeature

onOffOpt :: forall opt. String -> Option opt Boolean
onOffOpt = Op <<< onOffToOptions
  where
  onOffToOptions k true  = defaultToOptions k "on"
  onOffToOptions k false = defaultToOptions k "off"

left :: Option WindowFeature Int
left = opt "left"

width :: Option WindowFeature Int
width = opt "width"

height :: Option WindowFeature Int
height = opt "height"

status :: Option WindowFeature Boolean
status = onOffOpt "status"

windowFeatures :: Options WindowFeature -> String
windowFeatures opts = joinWith "," $ map showOption $ runOptions opts
  where
  showOption (Tuple k v) = k ++ "=" ++ (showForeign v)
