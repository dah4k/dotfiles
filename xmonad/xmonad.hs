-- Copyright 2024 dah4k
-- SPDX-License-Identifier: EPL-2.0
--
-- Build Requirements for most basic configuration:
--
--  * ghc                   (Haskell compiler)
--  * ghc-xmonad
--  * ghc-xmonad-devel      (Xmonad development library)
--
-- But most configuration also require additional 3rd party extensions:
--
--  * ghc-xmonad-contrib
--  * ghc-xmonad-contrib-devel
--
-- `Mod-q` to recompile and restart XMonad

import XMonad

-- Fix fullscreen video games [^bigeekfan].
-- [^bigeekfan]: https://www.bigeekfan.com/post/20181124_xmonad_config/
-- https://hackage.haskell.org/package/xmonad-contrib-0.15/docs/XMonad-Hooks-EwmhDesktops.html
import XMonad.Hooks.EwmhDesktops(ewmhFullscreen,ewmh)


-- Save the pixels, remove unused borders
-- http://hackage.haskell.org/package/xmonad-contrib-0.15/docs/XMonad-Layout-NoBorders.html
import XMonad.Layout.NoBorders(noBorders,smartBorders)


-- Grid Layout (disabled)
-- https://hackage.haskell.org/package/xmonad-contrib-0.16/docs/XMonad-Layout-Grid.html
-- import XMonad.Layout.Grid


-- Insert new window to Below (and Right)
-- https://hackage.haskell.org/package/xmonad-contrib-0.16/docs/XMonad-Hooks-InsertPosition.html
import XMonad.Hooks.InsertPosition


-- A module for spawning a command once, and only once.
-- Useful to start status bars and make session settings inside startupHook.
-- https://hackage.haskell.org/package/xmonad-contrib-0.16/docs/XMonad-Util-SpawnOnce.html
import XMonad.Util.SpawnOnce

-- TopicSpace (disabled)
-- https://tony-zorman.com/posts/topic-space/2022-09-11-topic-spaces.html
-- https://hackage.haskell.org/package/xmonad-contrib-0.18.1/docs/XMonad-Actions-TopicSpace.html
-- import XMonad.Actions.TopicSpace
-- topicItems :: [TopicItem]
-- topicItems =
--   [ noAction    "1:EDIT"    "."
--   , noAction    "2:COMPILE" "."
--   , noAction    "3:DOC"     "journal"
--   , inHome      "4:WEB"                 (spawn "firefox")
--   ]

------------------------------------------------------------------------
-- Dracula Theme Colors
-- https://spec.draculatheme.com/
------------------------------------------------------------------------
-- Standard
draculaBackground   = draculaDarkGray
draculaForeground   = draculaAnsiWhite
draculaSelection    = draculaGray
draculaComment      = draculaAnsiBrightBlack
draculaRed          = draculaAnsiRed
draculaOrange       = "#FFB86C"
draculaYellow       = draculaAnsiYellow
draculaGreen        = draculaAnsiGreen
draculaPurple       = draculaAnsiBlue
draculaCyan         = draculaAnsiCyan
draculaPink         = draculaAnsiMagenta

-- Dracula Gray aliases
draculaGray         = "#44475A"
draculaDarkGray     = "#282A36"

-- Darker Dracula Purple shades
-- https://www.color-hex.com/color/BD93F9
draculaDarkPurple1  = "#aa84e0"
draculaDarkPurple2  = "#9775c7"
draculaDarkPurple3  = "#8466ae"
draculaDarkPurple4  = "#715895"
draculaDarkPurple5  = "#5e497c"
draculaDarkPurple6  = "#4b3a63"
draculaDarkPurple7  = "#382c4a"
draculaDarkPurple8  = "#251d31"
draculaDarkPurple9  = "#120e18"

-- ANSI
draculaAnsiBlack    = "#21222C"
draculaAnsiRed      = "#FF5555"
draculaAnsiGreen    = "#50FA7B"
draculaAnsiYellow   = "#F1FA8C"
draculaAnsiBlue     = "#BD93F9"
draculaAnsiMagenta  = "#FF79C6"
draculaAnsiCyan     = "#8BE9FD"
draculaAnsiWhite    = "#F8F8F2"

-- ANSI Bright
draculaAnsiBrightBlack  = "#6272A4"
draculaAnsiBrightRed    = "#FF6E6E"
draculaAnsiBrightGreen  = "#69FF94"
draculaAnsiBrightYellow = "#FFFFA5"
draculaAnsiBrightBlue   = "#D6ACFF"
draculaAnsiBrightMagenta= "#FF92DF"
draculaAnsiBrightCyan   = "#A4FFFF"
draculaAnsiBrightWhite  = "#FFFFFF"


------------------------------------------------------------------------
-- My Basic Stuff
------------------------------------------------------------------------

myTerminal          = "alacritty"
myBorderWidth       = 16
myNormalBorderColor = draculaGray
myFocusedBorderColor= draculaDarkPurple2
myFocusFollowsMouse = False     -- Click-to-Focus avoids accidental focus lost
myClickJustFocuses  = False     -- Click URL focuses browser and go there


------------------------------------------------------------------------
-- My Layout
------------------------------------------------------------------------

-- * Remove borders when tallMain/wideMain layouts only contains one window.
-- * Remove borders when main layout is Fullcreen.
-- * Grid Layout is disabled because 2-3 windows are confusing between Tall and Grid
--
-- https://hackage.haskell.org/package/xmonad-0.15/docs/XMonad-Layout.html
myLayout = smartBorders tallMain
    ||| smartBorders wideMain
    -- ||| Grid
    ||| noBorders Full
  where
    tallMain = (Tall nmain delta ratio)
    wideMain = Mirror (Tall nmain delta ratio)
    nmain = 1       -- initial number of windows in main pane
    delta = 3/100   -- percentage to increment/decrement when resizing panes
    ratio = 1/2     -- initial ratio screen size of main pane

------------------------------------------------------------------------
-- My StartupHook
------------------------------------------------------------------------

-- * Fix monitor refresh rate to 144 Hz
-- * Disable PC beep, disable DPMS, disable screen saver, mouse 5x accel 0 threshold
-- * Set root window color
myStartupHook :: X ()
myStartupHook = do
    spawnOnce "xrandr --output DP-1 --mode 2560x1440 --rate 144 &"
    spawnOnce "xset -b -dpms s off m 5 0 &"
    spawnOnce $ "xsetroot -solid '" ++ draculaGray ++ "' &"


------------------------------------------------------------------------
-- My ManageHook
------------------------------------------------------------------------

-- * Float Gimp
--
-- https://hackage.haskell.org/package/xmonad-0.15/docs/XMonad-ManageHook.html
myManageHook = composeAll [
                className =? "Gimp" --> doFloat
                ]

------------------------------------------------------------------------
-- Main
------------------------------------------------------------------------

main :: IO ()
main = do
    xmonad . ewmhFullscreen . ewmh $ def -- ewmh is used for fullscreen games
      {
        -- Basic stuff
        terminal            = myTerminal
      , borderWidth         = myBorderWidth
      , normalBorderColor   = myNormalBorderColor
      , focusedBorderColor  = myFocusedBorderColor
      , focusFollowsMouse   = myFocusFollowsMouse
      , clickJustFocuses    = myClickJustFocuses

        -- Hooks, Layouts
      , layoutHook          = myLayout
      , startupHook         = myStartupHook
        -- From docs: You should you put the manageHooks that use doShift to take
        -- effect before insertPosition, so that the window order will be consistent.
        -- Because ManageHooks compose from right to left (like function composition .),
        -- this means that insertPosition should be the leftmost ManageHook.
      , manageHook          = insertPosition Below Newer <+> myManageHook
      }

