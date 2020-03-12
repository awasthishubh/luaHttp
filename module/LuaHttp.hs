{-# LANGUAGE OverloadedStrings #-}
module LuaHttp where
    import Foreign.Lua
    import Foreign.Lua as Lua
    import qualified Data.ByteString.Char8 as C8
    import qualified Data.ByteString.Lazy.Char8 as L8
    import           Network.HTTP.Simple

    luaHttp :: Lua NumResults
    luaHttp = do
        i <- peek 1 :: Lua String
        liftIO $ putStrLn $ "Sending Request to: "++ i
        initialRequest <- parseRequest i
        response <- httpLBS initialRequest
        pushstring $ C8.pack $ L8.unpack $ getResponseBody response
        return 1