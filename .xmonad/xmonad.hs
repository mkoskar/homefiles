import System.Exit
import qualified Data.Map as M
import Data.Monoid (mempty, All(..), appEndo)

import XMonad hiding ((|||))
import XMonad.StackSet (screenDetail, current)
import qualified XMonad.StackSet as W

import XMonad.Actions.CycleWS
import XMonad.Actions.FloatKeys
import XMonad.Actions.MouseResize
import XMonad.Actions.PhysicalScreens
import XMonad.Actions.UpdatePointer
import XMonad.Actions.Warp

import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.Minimize
import XMonad.Hooks.PositionStoreHooks
import XMonad.Hooks.SetWMName
import XMonad.Hooks.ToggleHook
import XMonad.Hooks.UrgencyHook

import XMonad.Layout.BoringWindows
import XMonad.Layout.LayoutCombinators
import XMonad.Layout.LayoutHints
import XMonad.Layout.Maximize
import XMonad.Layout.Minimize
import XMonad.Layout.MultiToggle
import XMonad.Layout.MultiToggle.Instances
import XMonad.Layout.NoFrillsDecoration
import XMonad.Layout.PerWorkspace
import XMonad.Layout.PositionStoreFloat
import XMonad.Layout.ResizableTile
import XMonad.Layout.Tabbed
import XMonad.Layout.TrackFloating
import XMonad.Layout.WindowArranger
import XMonad.Layout.WindowNavigation

import XMonad.Util.EZConfig
import XMonad.Util.NamedScratchpad
import XMonad.Util.WorkspaceCompare

myStatusBar conf = statusBar "xmobar" myXmobarPP myToggleStrutsKey conf
  where
    myXmobarPP = defaultPP
        { ppCurrent = xmobarColor "#55FF55" "" . wrap "[" "]"
        , ppVisible = xmobarColor "#FEED6A" "" . wrap "(" ")"
        , ppUrgent = xmobarColor "#FF5555" "#FEEF6A" . pad
        , ppSep = " "
        , ppTitle = xmobarColor "#EFEFEF" "" . shorten 100
        , ppOrder = \(workspaces : layout : title : extras) -> [workspaces, title]
        , ppSort = getSortByXineramaPhysicalRule
        }
    myToggleStrutsKey XConfig{modMask = modm} = (modm, xK_b)

myConfig = defaultConfig
    { borderWidth = 1
    , normalBorderColor = "#000000"
    , focusedBorderColor = "#FF3333"
    , modMask = myModMask
    , terminal = myTerminal
    , workspaces = myWorkspaces
    , keys = \conf -> mkKeymap conf myKeymap
    , startupHook = setWMName "LG3D" <+>
                    checkKeymap myConfig myKeymap
    , logHook = updatePointer (Relative 0.5 0.5)
    , handleEventHook = docksEventHook <+>
                        minimizeEventHook <+>
                        positionStoreEventHook <+>
                        hintsEventHook
    , manageHook = myManageHook
    , layoutHook = myLayoutHook
    }
  where
    myModMask = mod4Mask
    myTerminal = "urxvtc"
    myWorkspaces = map show [1..9]
    myScratchpads =
        [ NS "term" (myTerminal ++ " -name sp_term") (resource =? "sp_term")
          (customFloating $ W.RationalRect 0.1 0.1 0.8 0.8)
        , NS "htop" (myTerminal ++ " -name sp_htop -e htop") (resource =? "sp_htop")
          (customFloating $ W.RationalRect 0.05 0.05 0.9 0.9)
        ]
    myManageHook = manageDocks <+>
                   positionStoreManageHook Nothing <+>
                   namedScratchpadManageHook myScratchpads <+>
                   toggleHook "doFloat" doFloat <+>
                   composeOne
                       [ isDialog -?> doFloat
                       , className =? "Skype" -?> doFloat
                       ]
    myLayoutHook = avoidStruts .
                   trackFloating .
                   boringWindows .
                   minimize .
                   maximize .
                   configurableNavigation noNavigateBorders .
                   mkToggle (single NOBORDERS) .
                   mkToggle (single FULL) .
                   mkToggle (single MIRROR) .
                   onWorkspace "9"
                       (
                           noFrillsDeco shrinkText myTheme $
                           mouseResize $ windowArrange positionStoreFloat
                       )
                   $
                   layoutHintsWithPlacement (0.5, 0.5)
                       (
                           myTabbed |||
                           myTall
                       )
      where
        myTheme = defaultTheme
            { inactiveBorderColor = inactiveColor myTheme
            , activeBorderColor = activeColor myTheme
            , urgentBorderColor = urgentColor myTheme

            , inactiveTextColor = "#888888"
            , activeTextColor = "#87CEFA"
            , urgentTextColor = activeTextColor myTheme

            , activeColor = "#000000"
            , inactiveColor = "#333333"
            , urgentColor = "#FDB436"

            , fontName = "xft:local_xmonad"
            , decoWidth = 500
            , decoHeight = 15
            }
        myTabbed = tabbedBottom shrinkText myTheme
        myTall = ResizableTall 1 0.05 0.5 []
    myKeymap =
        [
          -- M-[1..9] - switch to workspace N
          -- M-S-[1..9] - move client to workspace N
          ("M" ++ m ++ "-" ++ k, windows $ f i)
            | (i, k) <- zip myWorkspaces $ map show [1..9]
            , (f, m) <- [(W.greedyView, ""), (W.shift, "-S")]
        ]
        ++
        [ ("M-q", spawn "xmonad --recompile && xmonad --restart")
        , ("M-S-q", io (exitWith ExitSuccess))

          -- screens & workspaces
        , ("M-w", onPrevNeighbour W.view)
        , ("M-e", onNextNeighbour W.view)
        , ("M-S-w", onPrevNeighbour W.shift)
        , ("M-S-e", onNextNeighbour W.shift)

        , ("M-z", onPrevNeighbour W.greedyView)
        , ("M-x", onNextNeighbour W.greedyView)
        , ("M-s", moveTo Prev HiddenNonEmptyWS)
        , ("M-d", moveTo Next HiddenNonEmptyWS)

        , ("M-u", viewScreen 0)
        , ("M-i", viewScreen 1)
        , ("M-o", viewScreen 2)
        , ("M-S-u", sendToScreen 0)
        , ("M-S-i", sendToScreen 1)
        , ("M-S-o", sendToScreen 2)

        , ("M-a", toggleWS' ["NSP"])

          -- stack navigation
        , ("M-j", focusDown)
        , ("M-k", focusUp)
        , ("M-<Tab>", focusDown)
        , ("M-S-<Tab>", focusUp)
        , ("M-m", focusMaster)

        , ("M-S-j", windows W.swapDown) -- ! breaks BoringWindows
        , ("M-S-k", windows W.swapUp)   -- ! breaks BoringWindows
        , ("M-<Return>", windows W.swapMaster)

          -- spatial navigation
        , ("M-C-l", sendMessage $ Go R)
        , ("M-C-h", sendMessage $ Go L)
        , ("M-C-k", sendMessage $ Go U)
        , ("M-C-j", sendMessage $ Go D)

        , ("M-C-S-l", sendMessage $ Swap R)
        , ("M-C-S-h", sendMessage $ Swap L)
        , ("M-C-S-k", sendMessage $ Swap U)
        , ("M-C-S-j", sendMessage $ Swap D)

          -- windows & layouts
        , ("M-n", refresh)
        , ("M-S-c", kill)
        , ("M-<Backspace>", focusUrgent)
        , ("M-<Space>", sendMessage NextLayout)
        , ("M-S-<Space>", setLayout $ Layout myLayoutHook)
        , ("M-h", sendMessage Shrink)
        , ("M-l", sendMessage Expand)
        , ("M-S-h", sendMessage MirrorShrink)
        , ("M-S-l", sendMessage MirrorExpand)
        , ("M-,", sendMessage $ IncMasterN 1)
        , ("M-.", sendMessage $ IncMasterN (-1))

          -- floating layer
        , ("M-t", withFocused $ windows . W.sink)
        , ("M-; M-f", toggleHookNext "doFloat")
        , ("M-M1-k", withFocused $ keysMoveWindow (0, -50))
        , ("M-M1-j", withFocused $ keysMoveWindow (0, 50))
        , ("M-M1-h", withFocused $ keysMoveWindow (-50, 0))
        , ("M-M1-l", withFocused $ keysMoveWindow (50, 0))
        , ("M-M1-S-k", withFocused $ keysResizeWindow (0, -50) (0, 0))
        , ("M-M1-S-j", withFocused $ keysResizeWindow (0, 50) (0, 0))
        , ("M-M1-S-h", withFocused $ keysResizeWindow (-50, 0) (0, 0))
        , ("M-M1-S-l", withFocused $ keysResizeWindow (50, 0) (0, 0))

          -- layout modifiers
        , ("M-f M-b", sendMessage $ Toggle NOBORDERS)
        , ("M-f M-f", sendMessage $ Toggle FULL)
        , ("M-f M-r", sendMessage $ Toggle MIRROR)

          -- minimize, maximize
        , ("M-f M--", withFocused minimizeWindow)
        , ("M-f M-=", sendMessage RestoreNextMinimizedWin)
        , ("M-[", withFocused (sendMessage . maximizeRestore))

          -- other
        , ("M-S-y", warpToWindow 0.005 0.005)
        , ("M-S-p", warpToWindow 0.995 0.995)
        , ("M-c", spawn "xdotool getwindowfocus click --clearmodifiers 1")

          -- Launchers
          -- =========

        , ("M-p", spawn "dmenu_run")
        , ("M-S-<Return>", spawn myTerminal)

          -- scratchpads
        , ("M-S-;", namedScratchpadAction myScratchpads "term")
        , ("M-; M-;", namedScratchpadAction myScratchpads "htop")

          -- screenshots
        , ("M-<Print>", spawn "scrot -m ~/tmp/shot-%Y-%m-%d.%s.png -e 'feh -Z. $f'")
        , ("M-S-<Print>", spawn "sleep 0.5 && scrot -m -s ~/tmp/shot-%Y-%m-%d.%s.png -e 'feh -Z. $f'")

          -- audio
        , ("M-S-]", spawn "volup && status-notify audio")
        , ("M-S-[", spawn "voldown && status-notify audio")
        , ("M-S-m", spawn "voltoggle && status-notify audio")
        , ("M-S-n", spawn "voltoggle-dock && status-notify audio")

          -- setxkbmap
        , ("M-<F1>", spawn "setxkbmap us cz_sk_de && status-notify xkb")
        , ("M-<F2>", spawn "setxkbmap sk qwerty && status-notify xkb")
        , ("M-<F3>", spawn "setxkbmap cz qwerty && status-notify xkb")

          -- selections
        , ("M-<F5>", spawn "xsel | xsel -ib")
        , ("M-<F6>", spawn "xsel -b | xsel -i")
        , ("M-<F7>", spawn "xsel | xsel -i")
        , ("M-<F8>", spawn "xsel -b | xsel -ib")

          -- other
        , ("M-<F10>", spawn "xscreen && xmonad-session-repair")
        , ("M-<F12>", spawn "grabc 2>&1 | xsel -i")
        , ("M-S-<F12>", spawn "xmeasure | xsel -i")
        , ("M-S-<Home>", spawn "urxvtc -e pg ~/projects/meta.rst")
        , ("M-S-b", spawn "backlight-toggle")
        , ("M-; M-l", spawn "sudo lockx")
        , ("M-; M-d", spawn "dpms-toggle && status-notify dpms")
        , ("M-; M-r", spawn "rfkill-toggle && status-notify rfkill")
        ]

main = xmonad =<< myStatusBar (withUrgencyHook NoUrgencyHook myConfig)
