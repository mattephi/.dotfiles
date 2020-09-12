
import XMonad
-- import Data.Monoid
-- import System.Exit
import System.IO
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.SpawnOnce
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.EwmhDesktops
import XMonad.Layout.Spacing
import XMonad.Hooks.SetWMName

import Graphics.X11.ExtraTypes.XF86
import XMonad.Util.EZConfig(additionalKeys, additionalKeysP)

-- import qualified XMonad.StackSet as W
-- import qualified Data.Map        as M

scrLightPath = "sysfs/backlight/intel_backlight"
kbdLightPath = "sysfs/leds/spi::kbd_backlight"

myKeys = [("<XF86MonBrightnessUp>", spawn ("light -s " ++ scrLightPath ++ " -A 2"))
        , ("<XF86MonBrightnessDown>", spawn ("light -s " ++ scrLightPath ++ " -U 2"))
        , ("<XF86KbdBrightnessUp>", spawn ("light -s " ++ kbdLightPath ++ " -A 10"))
        , ("<XF86KbdBrightnessDown>", spawn ("light -s " ++ kbdLightPath ++ " -U 10"))
        , ("M-<Tab>", spawn ("rofi -show window"))
        , ("M-p", spawn ("rofi -show run"))
    ]

myTerminal = "gnome-terminal"
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
    startupHook = myStartupHook <+> ewmhDesktopsStartup,
    layoutHook = myLayoutHook,
    handleEventHook = ewmhDesktopsEventHook,
    logHook = ewmhDesktopsLogHook

}

main :: IO ()
main = do
    xmproc <- spawnPipe "xmobar ~/.config/xmobar/xmobar.config"
    xmonad $ docks defaults `additionalKeysP` myKeys
