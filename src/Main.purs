module Main where

import Prelude
import Browser.WinChan (WINCHAN, openWindow)
import Browser.WindowFeatures (width, height, status, windowFeatures)
import Control.Monad.Aff (launchAff)
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Class (liftEff)
import Control.Monad.Eff.Console (CONSOLE, log)
import Control.Monad.Eff.Exception (EXCEPTION)
import Data.Options ((:=))

main :: forall e. Eff (err :: EXCEPTION, console :: CONSOLE, winChan :: WINCHAN | e) Unit
main = launchAff $ do
  openWindow "https://nuclear-iron-912.myreindex.com/auth/google" "https://nuclear-iron-912.myreindex.com/auth/channel"
    (windowFeatures $ width := 500 <> height := 467 <> status := true)
