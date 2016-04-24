module Network.OpenFlow.Message.Internal where

import Prelude hiding (length)

{- | A product of type, length, value structure.
-}
newtype Tlv t l v = Tlv t l v

-- | This class indicates type @v@ has a length typed as @l@
class HasLength v l where
    length :: v -> l
