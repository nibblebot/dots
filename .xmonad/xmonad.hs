import XMonad
 
import XMonad.Layout
import XMonad.Layout.Spacing
import XMonad.Layout.NoBorders
import XMonad.Layout.ResizableTile
 
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
{-import XMonad.Hooks.UrgencyHook-}

import XMonad.Config.Desktop
 
import XMonad.Util.EZConfig
import XMonad.Util.Run
import Data.Monoid

import Graphics.X11.Xlib
import Graphics.X11.ExtraTypes.XF86
import qualified XMonad.StackSet as W
import qualified Data.Map as M
import System.IO
import System.Exit

main = do
    {-wsBar <- spawnPipe myWorkSpaceBar-}
    {-statusBar <- spawnPipe myStatusBar-}
    xmonad $ ewmh desktopConfig
        { terminal = myTerminal
        , manageHook = manageDocks <+> myManageHook <+> manageHook desktopConfig
        , layoutHook = myLayoutHook
        , borderWidth = myBorderWidth
        , normalBorderColor = myInactiveBorderColor
        , focusedBorderColor = myActiveBorderColor
        , logHook = do
            {-myLogHook wsBar-}
            logHook desktopConfig
        , workspaces = myWorkspaces
        }
        `additionalKeysP` myKeysP
        {-`additionalKeys`-}
        {-[ ((0, xF86XK_AudioLowerVolume), spawn "/home/josh/bin/dvol lower")-}
        {-, ((0, xF86XK_AudioRaiseVolume), spawn "/home/josh/bin/dvol raise")-}
        {-, ((0, xF86XK_AudioMute), spawn "/home/josh/bin/dvol toggle")-}
        {-]-}

myKeysP = 
    [ ("C-M-q", spawn "xmonad --recompile && xmonad --restart")
    , ("C-S-M-q", io (exitWith ExitSuccess))
    , ("M-b", sendMessage ToggleStruts)
    ] 

myTerminal = "urxvtc"

myLogHook h = dynamicLogWithPP ( defaultPP
	{
		  ppCurrent		= dzenColor orange background
		, ppVisible		= dzenColor orange background
		, ppHidden		= dzenColor white background
		, ppHiddenNoWindows	= dzenColor grey background
		, ppWsSep		= ""
		, ppSep			= ""
		, ppOrder	=  \(ws:l:t:_) -> [ws]
		, ppOutput	=   hPutStrLn h
	})

{-wrapBitmap bitmap = "^p(5)^i(" ++ myBitmapsPath ++ bitmap ++ ")^p(5)"-}

-- Border
myBorderWidth = 1
myInactiveBorderColor = "#999999"
myActiveBorderColor = "#FFD10B"

-- Bitmaps
myBitmapsPath = "/home/josh/.icons/"

-- Font
myFont = "Consolas:size=9"

-- Colors
aqua = "#036654"
deepred = "#A80000"
hotpink = "#DF5793"
orange = "#FFA916"
white = "#FFFFFF"
grey = "#AAAAAA"
solar_light = "#FDF6E3"
lightgrey = "#333333"

foreground = "#DDDDDD"
background = lightgrey

-- dzen general options
-- 
myDzenGenOpts = "-fg '" ++ foreground ++ "' -bg '" ++ background ++ "' -h '14'" ++ " -fn '" ++ myFont ++ "'"
 
myWorkSpaceBar = "dzen2 -e '' -w 250 -x 0 -y 0 -ta l " ++ myDzenGenOpts
myStatusBar = "conky -qc ~/.conkyrc | dzen2 -e '' -x 250 -y 0 -w 1670 -ta r " ++ myDzenGenOpts
 
-- Layouts
myLayoutHook = 
  avoidStruts $ 
  smartBorders $ 
  {-smartSpacing 6 $ -}
  (tiled ||| Mirror tiled ||| Full)
  where
    tiled = ResizableTall nmaster delta ratio []
    nmaster = 1
    delta = 3/100
    ratio = 1/2
 
{-Workspaces-}
myWorkspaces            :: [String]
myWorkspaces            = clickable . (map dzenEscape) $ [" main "," vim "," term "," chat "," music "," vm ", " read "]
  where clickable l     = [ "^ca(1,xdotool key alt+" ++ show (n) ++ ")" ++ ws ++ "^ca()" |
                            (i,ws) <- zip [1..] l,
                            let n = i ]

myManageHook = composeOne
    [ isFullscreen -?> doFullFloat ]
