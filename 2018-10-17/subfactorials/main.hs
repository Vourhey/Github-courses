{-# LANGUAGE OverloadedStrings #-}
import Data.Text (Text)
import Data.Text.Read (decimal)
import qualified Data.Text as T
import qualified Data.Text.IO

subfactor :: Int -> Int
subfactor 0 = 1
subfactor 1 = 0
subfactor n = (n - 1) * ( subfactor (n - 1) + subfactor (n - 2) )

subfact :: Text -> Text
subfact str = T.pack $ show $ subfactor n
    where
        Right r = decimal str 
        (n, _) = r

main :: IO ()
main = Data.Text.IO.interact subfact
