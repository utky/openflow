module Network.OpenFlow.Parser.TLV where

import           Prelude hiding (take)
import           Data.Attoparsec.ByteString

-- | fixedLength i p
-- read i octets and use them as input for running parser p.
fixedLength :: Int -> Parser a -> Parser a
fixedLength len parser = do
  bytes <- take len
  case parseOnly (parser <* endOfInput) bytes of
    Left err     -> parser <?> err
    Right parsed -> return parsed
