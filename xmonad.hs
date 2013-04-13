import XMonad
 
import XMonad.Layout
import XMonad.Layout.NoBorders
import XMonad.Layout.ResizableTile
 
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
{-import XMonad.Hooks.UrgencyHook-}

import XMonad.Config.Xfce
 
import XMonad.Util.EZConfig
import XMonad.Util.Run
import Graphics.X11.Xlib
import Graphics.X11.ExtraTypes.XF86
import qualified XMonad.StackSet as W
import qualified Data.Map as M
import System.IO
import System.Exit

main = do
    {-wsBar <- spawnPipe myWorkSpaceBar-}
    {-statusBar <- spawnPipe myStatusBar-}
    xmonad $ xfceConfig
        { terminal = myTerminal
        , manageHook = manageDocks <+> myManageHook <+> manageHook defaultConfig
        , layoutHook = avoidStruts $ myLayoutHook
        , borderWidth = myBorderWidth
        , normalBorderColor = myInactiveBorderColor
        , focusedBorderColor = myActiveBorderColor
        {-, logHook = dynamicLogWithPP $ myDzenPP wsBar-}
        {-, workspaces = myWorkspaces-}
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
    {-++ -}
    {-[ (otherModMasks ++ "M-" ++ [key], action tag)-}
      {-| (tag, key)  <- zip myWorkspaces "123456"-}
      {-, (otherModMasks, action) <- [ ("", windows . W.view) -- was W.greedyView-}
                                      {-, ("S-", windows . W.shift)]-}
    {-]-}
myTerminal = "urxvtc"

-- Border
myBorderWidth = 2
myInactiveBorderColor = "#000000"
myActiveBorderColor = "#5E8D87"

-- Bitmaps
{-myBitmapsPath = "/home/josh/.icons/"-}

-- Font
{-myFont = "Monaco:size=10"-}
{-myFont = "-*-PixelCarnageMono-*-*-*-*-11-*-*-*-*-*-*-*"-}
{-myFont = "-*-nu-*-*-*-*-*-*-*-*-*-*-*-*"-}
myFont = "-*-proggyclean-*-*-*-*-13-*-*-*-*-*-*-*"
{-myFont = "-*-dina-*-*-*-*-11-*-*-*-*-*-*-*"-}
{-myFont = "-*-terminus-*-*-*-*-12-*-*-*-*-*-iso8859-*"-}
-- Colors
myBgBgColor = "black"
myFgColor = "gray80"
myBgColor = "gray20"
myHighlightedFgColor = "white"
myHighlightedBgColor = "gray40"
 
myCurrentWsFgColor = "white"
myCurrentWsBgColor = "gray40"
myVisibleWsFgColor = "gray80"
myVisibleWsBgColor = "gray20"
myHiddenWsFgColor = "gray80"
myHiddenEmptyWsFgColor = "gray50"
myUrgentWsBgColor = "brown"
myTitleFgColor = "white"
 
myUrgencyHintFgColor = "white"
myUrgencyHintBgColor = "brown"
 
-- dzen general options
-- 
{-myDzenGenOpts = "-fg '" ++ myFgColor ++ "' -bg '" ++ myBgColor ++ "' -h '16'" ++ " -fn '" ++ myFont ++ "'"-}
 
{-myWorkSpaceBar = "dzen2 -w 520 -x 0 -ta l " ++ myDzenGenOpts-}
{-myStatusBar = "conky -c ~/.conkyrc | dzen2 -x 965 -w 475 -ta r " ++ myDzenGenOpts-}
 
-- Layouts
myLayoutHook = smartBorders $ (tiled ||| Mirror tiled ||| Full)
  where
    tiled = ResizableTall nmaster delta ratio []
    nmaster = 1
    delta = 3/100
    ratio = 1/2
 
-- Workspaces
{-myWorkspaces            :: [String]-}
{-myWorkspaces            = clickable . (map dzenEscape) $ ["web","vim","term","chat","music","vm"] -}
  {-where clickable l     = [ "^ca(1,xdotool key alt+" ++ show (n) ++ ")" ++ ws ++ "^ca()" |-}
                            {-(i,ws) <- zip [1..] l,-}
                            {-let n = i ]-}

myManageHook = composeOne
    [ isFullscreen -?> doFullFloat ]
 
-- Dzen config
{-myDzenPP h = defaultPP { -}
  {-ppOutput = hPutStrLn h,-}
  {-ppSep = "^bg(" ++ myBgBgColor ++ ")^r(1,15)^bg()",-}
  {-ppWsSep = " ",-}
  {-ppCurrent = wrapFgBg myCurrentWsFgColor myCurrentWsBgColor,-}
  {-ppVisible = wrapFgBg myVisibleWsFgColor myVisibleWsBgColor,-}
  {-ppHidden = wrapFg myHiddenWsFgColor,-}
  {-ppHiddenNoWindows = \wsId -> if wsId `notElem` myWorkspaces then "" else wrapFg myHiddenEmptyWsFgColor wsId,-}
  {-ppUrgent = wrapBg myUrgentWsBgColor,-}
  {-ppTitle = (\x -> " " ++ wrapFg myTitleFgColor x),-}
  {-ppLayout  = dzenColor myFgColor"" .-}
                {-(\x -> case x of-}
                    {-"ResizableTall" -> wrapBitmap "rob/tall.xbm"-}
                    {-"Mirror ResizableTall" -> wrapBitmap "rob/mtall.xbm"-}
                    {-"Full" -> wrapBitmap "rob/full.xbm"-}
                {-)-}
  {-}-}
  {-where-}
    {-wrapFgBg fgColor bgColor content= wrap ("^fg(" ++ fgColor ++ ")^bg(" ++ bgColor ++ ")") "^fg()^bg()" content-}
    {-wrapFg color content = wrap ("^fg(" ++ color ++ ")") "^fg()" content-}
    {-wrapBg color content = wrap ("^bg(" ++ color ++ ")") "^bg()" content-}
    {-wrapBitmap bitmap = "^p(5)^i(" ++ myBitmapsPath ++ bitmap ++ ")^p(5)"-}
