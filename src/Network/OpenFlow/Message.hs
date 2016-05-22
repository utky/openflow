module Network.OpenFlow.Message
    ( OfpMessage
    , OfpHeader(..)
    , OfpPayload(..)
    , module Network.OpenFlow.Message.OfpHello
    , module Network.OpenFlow.Message.OfpEcho
    ) where

import           Data.Word
import qualified Data.ByteString as B
import           Network.OpenFlow.Message.OfpHello (OfpHello(..), OfpHelloElement(..))
import           Network.OpenFlow.Message.OfpEcho (OfpEchoRequest(..), OfpEchoReply(..))


type OfpMessage = OfpHeader

type Xid = Word32

data OfpHeader
    = OfpHeader 
    { version :: Word8
    , length :: Word16
    , xid :: Xid
    , payload :: OfpPayload
    } deriving (Show)

data OfpPayload
    = Unknown B.ByteString
    | Hello OfpHello
    -- | Error
    | EchoRequest OfpEchoRequest
    | EchoReply OfpEchoReply
    -- | Experimenter
    -- Switch configuration messages
    -- | FeaturesRequest
    -- | FeaturesReply
    -- | GetConfigRequest
    -- | GetConfigReply
    -- | SetConfig
    -- -- Asynchronous messages
    -- | PacketIn
    -- | FlowRemoved
    -- | PortStatus
    -- -- Controller command messages
    -- | PacketOut
    -- | FlowMod
    -- | GroupMod
    -- | PortMod
    -- | TableMod
    -- -- Multipart messages
    -- | MultipartRequest
    -- | MultipartReply
    -- -- Barrier messages
    -- | BarrierRequest
    -- | BarrierReply
    -- -- Queue configuraiton messages
    -- | QueueGetConfigRequest
    -- | QueueGetConfigReply
    -- -- Controller role change request messages
    -- | RoleRequest
    -- | RoleReply
    -- -- Asynchronous message configuration
    -- | GetAsyncRequest
    -- | GetAsyncReply
    -- | SetAsync
    -- -- Metrics and rate limiters configuration messages
    -- | MeterMod
    deriving (Show)
