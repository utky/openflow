module Network.OpenFlow.Message.OfpExperimenter where

import qualified Data.ByteString as BS
import Data.Word (Word32, Word16, Word8)

type ExperimenterId = Word32
type ExperimenterType = Word32

data OfpExperimenter
    = OfpExperimenter 
    { ofpExperimenterId :: ExperimenterId
    , ofpExperimenterType :: ExperimenterType
    , ofpExperimenterPayload :: BS.ByteString
    }

