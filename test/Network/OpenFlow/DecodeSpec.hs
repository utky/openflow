module Network.OpenFlow.DecodeSpec (spec) where

import qualified Data.ByteString as B
import           SpecResource
import           Test.Hspec
import           Network.OpenFlow.Message (OfpMessage, OfpHeader(..), OfpPayload(..))
import           Network.OpenFlow.Decode (decode)



misparsed :: Expectation
misparsed = expectationFailure "message misparsed"

match :: Either String OfpMessage -> (OfpMessage -> Expectation) -> Expectation
match (Left em) _ = expectationFailure em
match (Right m) f = f m

spec :: Spec
spec = do
  describe "OpenFlow decoder" $ do

    it "can decode EchoRequest" $ do
      withRaw "echo-request.raw" $ \bytes -> do
        match (decode bytes) $ \msg ->
          case msg of
            (OfpHeader v l x (EchoRequest _)) -> True `shouldBe` True
            _ -> misparsed
