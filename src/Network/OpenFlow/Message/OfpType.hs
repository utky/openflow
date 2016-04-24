module Network.OpenFlow.Message.OfpType where

data OfpType =
    -- Immutable messages
      OfptHello
    | OfptError
    | OfptEchoRequest
    | OfptEchoReply
    | OfptExperimenter
    -- Switch configuration messages
    | OfptFeaturesRequest
    | OfptFeaturesReply
    | OfptGetConfigRequest
    | OfptGetConfigReply
    | OfptSetConfig
    -- Asynchronous messages
    | OfptPacketIn
    | OfptFlowRemoved
    | OfptPortStatus
    -- Controller command messages
    | OfptPacketOut
    | OfptFlowMod
    | OfptGroupMod
    | OfptPortMod
    | OfptTableMod
    -- Multipart messages
    | OfptMultipartRequest
    | OfptMultipartReply
    -- Barrier messages
    | OfptBarrierRequest
    | OfptBarrierReply
    -- Queue configuraiton messages
    | OfptQueueGetConfigRequest
    | OfptQueueGetConfigReply
    -- Controller role change request messages
    | OfptRoleRequest
    | OfptRoleReply
    -- Asynchronous message configuration
    | OfptGetAsyncRequest
    | OfptGetAsyncReply
    | OfptSetAsync
    -- Metrics and rate limiters configuration messages
    | OfptMeterMod deriving (Eq, Ord, Show)


ofpTypeCode :: (Num a) => OfpType -> a
ofpTypeCode t =
  case t of
    OfptHello                 -> 0
    OfptError                 -> 1
    OfptEchoRequest           -> 2
    OfptEchoReply             -> 3
    OfptExperimenter          -> 4
    OfptFeaturesRequest       -> 5
    OfptFeaturesReply         -> 6
    OfptGetConfigRequest      -> 7
    OfptGetConfigReply        -> 8
    OfptSetConfig             -> 9
    OfptPacketIn              -> 10
    OfptFlowRemoved           -> 11
    OfptPortStatus            -> 12
    OfptPacketOut             -> 13
    OfptFlowMod               -> 14
    OfptGroupMod              -> 15
    OfptPortMod               -> 16
    OfptTableMod              -> 17
    OfptMultipartRequest      -> 18
    OfptMultipartReply        -> 19
    OfptBarrierRequest        -> 20
    OfptBarrierReply          -> 21
    OfptQueueGetConfigRequest -> 22
    OfptQueueGetConfigReply   -> 23
    OfptRoleRequest           -> 24
    OfptRoleReply             -> 25
    OfptGetAsyncRequest       -> 26
    OfptGetAsyncReply         -> 27
    OfptSetAsync              -> 28
    OfptMeterMod              -> 29

ofpType :: Int -> Maybe OfpType
ofpType n =
  case n of
    0  -> Just OfptHello
    1  -> Just OfptError
    2  -> Just OfptEchoRequest
    3  -> Just OfptEchoReply
    4  -> Just OfptExperimenter
    5  -> Just OfptFeaturesRequest
    6  -> Just OfptFeaturesReply
    7  -> Just OfptGetConfigRequest
    8  -> Just OfptGetConfigReply
    9  -> Just OfptSetConfig
    10 -> Just OfptPacketIn
    11 -> Just OfptFlowRemoved
    12 -> Just OfptPortStatus
    13 -> Just OfptPacketOut
    14 -> Just OfptFlowMod
    15 -> Just OfptGroupMod
    16 -> Just OfptPortMod
    17 -> Just OfptTableMod
    18 -> Just OfptMultipartRequest
    19 -> Just OfptMultipartReply
    20 -> Just OfptBarrierRequest
    21 -> Just OfptBarrierReply
    22 -> Just OfptQueueGetConfigRequest
    23 -> Just OfptQueueGetConfigReply
    24 -> Just OfptRoleRequest
    25 -> Just OfptRoleReply
    26 -> Just OfptGetAsyncRequest
    27 -> Just OfptGetAsyncReply
    28 -> Just OfptSetAsync
    29 -> Just OfptMeterMod
    _  -> Nothing
