
import XMonad
-- import Data.Monoid
-- import System.Exit
-- import System.IO
import XMonad.Util.Run
import XMonad.Util.SpawnOnce
import XMonad.Hooks.ManageDocks
-- import XMonad.Hooks.DynamicLog
import XMonad.Layout.Spacing
import XMonad.Hooks.SetWMName

-- import qualified XMonad.StackSet as W
-- import qualified Data.Map        as M

myTerminal = "tilix"
myBorderWidth = 3
myModMask = mod4Mask

-- Hooks:Init
myStartupHook = do
    spawnOnce "nitrogen --restore &"
    spawnOnce "compton &"
    setWMName "LG3D" -- JVM has WM whitelist, so it is necessary

myLayoutHook = avoidStruts (spacingRaw 
                            False  (Border 10 0 10 0)
                            True   (Border 0 10 0 10)
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

main :: IO ()
main = do
    xmproc <- spawnPipe "xmobar ~/.config/xmobar/xmobar.config"
    xmonad $ docks defaults
