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
        liftIO $ putStrLn $ "Sending Request to: "++ i
        initialRequest <- parseRequest i
        response <- liftIO $ httpLbs initialRequest manager  
        pushstring $ C8.pack $ L8.unpack $ responseBody response
        return 1