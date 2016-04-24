module Network.OpenFlow.Message
    ( OfpMessage(..) ) where

import           Network.OpenFlow.Message.OfpHeader (OfpHeader)

import           Network.OpenFlow.Message.OfpHello (OfpHello)
import           Network.OpenFlow.Message.OfpEcho (OfpEcho, OfpEchoReply)

data OfpMessage
    = OfpMessage
    { header :: OfpHeader
    , payload :: OfpPayload
    }

data OfpPayload
    = Hello OfpHello
    -- | Error
    | EchoRequest OfpEcho
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
