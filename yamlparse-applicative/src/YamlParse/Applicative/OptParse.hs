{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE GADTs #-}
{-# LANGUAGE RankNTypes #-}
{-# LANGUAGE ScopedTypeVariables #-}

module YamlParse.Applicative.OptParse where

import qualified Data.Text as T
import qualified Options.Applicative as OptParse
import qualified Options.Applicative.Help as OptParse
import YamlParse.Applicative.Explain
import YamlParse.Applicative.Parser
import YamlParse.Applicative.Pretty

-- | Helper function to add the schema documentation to the optparse applicative help output
confDesc :: Parser i o -> OptParse.InfoMod a
confDesc p = OptParse.footerDoc $ Just $ OptParse.string . T.unpack . prettySchema $ explainParser p
