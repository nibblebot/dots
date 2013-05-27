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
import Graphics.X11.Xlib
import Graphics.X11.ExtraTypes.XF86
import qualified XMonad.StackSet as W
import qualified Data.Map as M
import System.IO
import System.Exit

main = do
    wsBar <- spawnPipe myWorkSpaceBar
    statusBar <- spawnPipe myStatusBar
    xmonad $ desktopConfig
        { terminal = myTerminal
        , manageHook = manageDocks <+> myManageHook <+> manageHook desktopConfig
        , layoutHook = myLayoutHook
        , borderWidth = myBorderWidth
        , normalBorderColor = myInactiveBorderColor
        , focusedBorderColor = myActiveBorderColor
        , logHook = do
            myLogHook wsBar
            logHook desktopConfig
        , workspaces = myWorkspaces
        }
        `additionalKeysP` myKeysP
        {-`additionalKeys`-}
        {-[ ((0, xF86XK_AudioLowerVolume   ), spawn "/home/josh/bin/dvol lower")-}
        {-, ((0, xF86XK_AudioRaiseVolume   ), spawn "/home/josh/bin/dvol raise")-}
        {-, ((0, xF86XK_AudioMute          ), spawn "/home/josh/bin/dvol toggle")-}
        {-]-}

myKeysP = 
    [ ("C-M-q", spawn "killall conky dzen2; xmonad --recompile && xmonad --restart")
    , ("C-S-M-q", io (exitWith ExitSuccess))
    , ("M-b", sendMessage ToggleStruts)
    ] 

myTerminal = "urxvtc"

myLogHook h = dynamicLogWithPP ( defaultPP
	{
		  ppCurrent		= dzenColor deepred background .	pad
		, ppVisible		= dzenColor foreground background . 	pad
		, ppHidden		= dzenColor aqua background . 	pad
		, ppHiddenNoWindows	= dzenColor grey background.	pad
		, ppWsSep		= ""
		, ppSep			= "    "
		{-, ppLayout		= wrap "^ca(1,xdotool key alt+space)" "^ca()" . dzenColor white1 background .-}
				{-(\x -> case x of-}
                    {-"ResizableTall" -> "Tall"-}
                    {-"Mirror ResizableTall" -> "Wide"-}
                    {-"Full" -> "Full"-}
                    {-[>"ResizableTall" -> wrapBitmap "rob/tall.xbm"<]-}
                    {-[>"Mirror ResizableTall" -> wrapBitmap "rob/mtall.xbm"<]-}
                    {-[>"Full" -> wrapBitmap "rob/full.xbm"<]-}
				{-) -}
--		, ppTitle	=   wrap "^ca(1,xdotool key alt+shift+x)^fg(#222222)^i(/home/sunn/.xmonad/dzen2/corner_left.xbm)^bg(#222222)^fg(#AADB0F)^fn(fkp)x^fn()" "^fg(#222222)^i(/home/sunn/.xmonad/dzen2/corner_right.xbm)^ca()" .  dzenColor white0 "#222222" . shorten 40 . pad		
		, ppOrder	=  \(ws:l:t:_) -> [ws,l]
		, ppOutput	=   hPutStrLn h
	})

{-wrapBitmap bitmap = "^p(5)^i(" ++ myBitmapsPath ++ bitmap ++ ")^p(5)"-}

-- Border
myBorderWidth = 0
myInactiveBorderColor = "#000000"
myActiveBorderColor = "#5E8D87"

-- Bitmaps
myBitmapsPath = "/home/josh/.icons/"

-- Font
myFont = "Monaco:size=8"
{-myFont = "-*-PixelCarnageMono-*-*-*-*-11-*-*-*-*-*-*-*"-}
{-myFont = "-*-nu-*-*-*-*-*-*-*-*-*-*-*-*"-}
{-myFont = "-*-dina-*-*-*-*-11-*-*-*-*-*-*-*"-}
{-myFont = "-*-terminus-*-*-*-*-12-*-*-*-*-*-iso8859-*"-}

{-myFont = "-*-proggyclean-*-*-*-*-13-*-*-*-*-*-*-*"-}
-- Colors
foreground = "#000000"
background = "#D2E4FC"
aqua = "#036654"
deepred = "#A80000"
grey = "#999999"

-- dzen general options
-- 
myDzenGenOpts = "-fg '" ++ foreground ++ "' -bg '" ++ background ++ "' -h '16'" ++ " -fn '" ++ myFont ++ "'"
 
myWorkSpaceBar = "dzen2 -e '' -w 520 -x 0 -y 0 -ta l " ++ myDzenGenOpts
myStatusBar = "conky -c ~/.conkyrc | dzen2 -e '' -x 965 -y 0 -w 475 -ta r " ++ myDzenGenOpts
 
-- Layouts
myLayoutHook = avoidStruts $ smartBorders $ smartSpacing 6 $ (tiled ||| Mirror tiled ||| Full)
  where
    tiled = ResizableTall nmaster delta ratio []
    nmaster = 1
    delta = 3/100
    ratio = 1/2
 
{-Workspaces-}
myWorkspaces            :: [String]
myWorkspaces            = clickable . (map dzenEscape) $ ["web","vim","term","chat","music","vm","7","8","9"]
  where clickable l     = [ "^ca(1,xdotool key alt+" ++ show (n) ++ ")" ++ ws ++ "^ca()" |
                            (i,ws) <- zip [1..] l,
                            let n = i ]

myManageHook = composeOne
    [ isFullscreen -?> doFullFloat ]
