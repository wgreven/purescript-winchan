module Browser.WinChan
  ( WINCHAN
  , openWindow
  ) where

import Control.Monad.Aff (Aff, makeAff)
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Exception (Error)
import Data.Foreign (Foreign)
import Prelude

foreign import data WINCHAN :: !

type URL = String
type WindowFeatures = String

foreign import openWindowImpl :: forall eff.
                                 URL
                              -> URL
                              -> String
                              -> (Error -> Eff (winChan :: WINCHAN | eff) Unit)
                              -> (Foreign -> Eff (winChan :: WINCHAN | eff) Unit)
                              -> Eff (winChan :: WINCHAN | eff) Unit

openWindow :: forall eff.
              URL
           -> URL
           -> WindowFeatures
           -> Aff (winChan :: WINCHAN | eff) Foreign
openWindow url relayUrl windowFeatures = makeAff (openWindowImpl url relayUrl windowFeatures)
