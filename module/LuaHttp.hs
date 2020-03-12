{-# LANGUAGE OverloadedStrings #-}
module LuaHttp where
    import Foreign.Lua
    import Foreign.Lua as Lua
    import qualified Data.ByteString.Char8 as C8
    import qualified Data.ByteString.Lazy.Char8 as L8
    import           Network.HTTP.Client
    import           Network.HTTP.Client.TLS

    luaHttp :: Lua NumResults
    luaHttp = do
        manager <- liftIO $ newManager tlsManagerSettings
        i <- peek 1 :: Lua String
        j <- peek 2 :: Lua String
        liftIO $ putStrLn $ "Sending Request to: "++ i
        initialRequest <- parseRequest i
        let request = initialRequest { method = C8.pack j}
        response <- liftIO $ httpLbs request manager  
        pushstring $ C8.pack $ L8.unpack $ responseBody response
        return 1