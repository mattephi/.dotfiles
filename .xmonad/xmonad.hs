
import XMonad
import Data.Monoid
import System.Exit
import System.IO
import XMonad.Util.Run
import XMonad.Util.SpawnOnce
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.DynamicLog

import qualified XMonad.StackSet as W
import qualified Data.Map        as M

myTerminal = "tilix"
myModMask = mod4Mask

defaults = def {
    terminal = myTerminal,
    modMask = myModMask
}

main = do
    xmonad $ defaults
