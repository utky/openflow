module SpecResource where

import           System.FilePath (FilePath, (</>))
import qualified Data.ByteString as B
import           Test.Hspec

withRaw :: FilePath -> (B.ByteString -> IO a) -> IO a
withRaw path action =
  let readB = B.readFile ("test" </> path)
  in  readB >>= action
