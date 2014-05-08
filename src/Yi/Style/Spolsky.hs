-- |
-- Module      :  Yi.Style.Spolsky
-- Copyright   :  (c) Mario Pastorelli 2014
-- License     :  BSD3
--
-- Maintainer  :  pastorelli.mario@gmail.com
-- Stability   :  experimental
-- Portability :  portable

module Yi.Style.Spolsky
       ( spolskyTheme

         -- Colours
       , spolskyNormal
       , spolskyBackground
       , spolskyVisualSelection
       , spolskyCurrentLine
       , spolskyOperators
       , spolskyComments
       , spolskyKeywords
       , spolskyString
       , spolskyTypeFace
       , spolskyWarning
       )
       where

import Data.Monoid (mappend, mempty)
import Yi

-- | The main theme specification. An example use in your @yi.hs@ might
-- look something like
--
-- @
-- main :: IO ()
-- main = yi $ myConfig {
--   defaultKm = defaultKm myConfig
--   , startFrontEnd = start
--   , configUI = (configUI defaultConfig) { configTheme = spolskyTheme }
--   }
-- @
spolskyTheme :: Proto UIStyle
spolskyTheme = defaultTheme `override` \sets _ -> sets
  { baseAttributes     = emptyAttributes { foreground = spolskyNormal
                                         , background = spolskyBackground
                                         , reverseAttr = False}
  , modelineAttributes = emptyAttributes { foreground = spolskyBackground
                                         , background = spolskyNormal
                                         , reverseAttr = False }
  , selectedStyle      = withBg spolskyVisualSelection
  , hintStyle          = withBg spolskyCurrentLine
  , strongHintStyle    = withBg spolskyCurrentLine
  , builtinStyle       = withFg spolskyOperators
  , commentStyle       = withFg spolskyComments
  , keywordStyle       = withFg spolskyKeywords
  , stringStyle        = withFg spolskyString
  , typeStyle          = withFg spolskyTypeFace
  , errorStyle         = withFg spolskyWarning
  , operatorStyle      = withFg spolskyOperators
  , importStyle        = withFg spolskyKeywords
  , numberStyle        = withFg spolskyNumber
  , preprocessorStyle  = withFg spolskyKeywords
  --, variableStyle      = withFg spolskyMethodDeclaration

  }

spolskyBackground        = RGB  22  26  31
spolskyComments          = RGB 140 140 140
spolskyConstant          = RGB 255 128 244
spolskyCurrentLine       = RGB  21  21  21
spolskyCursorUnderscore  = RGB 238 220 130
spolskyKeywords          = RGB 249  38 114
spolskyLineNumber        = RGB  22  26  31
spolskyLineFg            = RGB 102 102 102
spolskyTypeFace          = RGB 102 217 239
spolskyMethodDeclaration = RGB 166 226  46
spolskyModeLineBg        = RGB  51  51  51
spolskyModeInactiveBg    = RGB  34  34  34
spolskyModeLineFg        = RGB 238 220 130
spolskyModeInactiveFg    = RGB  85  85  85
spolskyNormal            = RGB 222 222 222
spolskyNumber            = RGB 252  88  12
spolskyOperators         = RGB 255 140   0
spolskyWarning           = RGB 255 108  96
spolskyRegexp            = RGB 166  58  98
spolskyString            = RGB 238 220 130
spolskyVariable          = RGB 253 151  31
spolskyVisualSelection   = RGB  85  85  85