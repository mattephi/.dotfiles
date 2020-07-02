
import XMonad
import Data.Monoid
import System.Exit
import System.IO
import XMonad.Util.Run
import XMonad.Util.SpawnOnce
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.DynamicLog
import XMonad.Layout.Spacing

import qualified XMonad.StackSet as W
import qualified Data.Map        as M

myTerminal = "tilix"
myBorderWidth = 2
myModMask = mod4Mask

-- Hooks:Init
myStartupHook = do
    spawnOnce "nitrogen --restore &"
    spawnOnce "compton &"

myLayoutHook = avoidStruts (spacingRaw 
                            False  (Border 5 0 5 0) 
                            True   (Border 0 5 0 5) 
                            True $ (tiled ||| Full))
    where
        tiled     = Tall nmaster delta ratio
        nmaster   = 1
        ratio     = 1/2
        delta     = 3/100

defaults = def {
    -- Stuff
    terminal = myTerminal,
    modMask = myModMask,
    borderWidth = myBorderWidth,

    -- Hooks
    startupHook = myStartupHook,
    layoutHook = myLayoutHook

}

main = do
    xmproc <- spawnPipe "xmobar ~/.config/xmobar/xmobar.config"
    xmonad $ docks defaults
