module LuaHttp where
    import Foreign.Lua

    -- luaHttp="Module to Request request"

    luaHttp :: Lua NumResults
    luaHttp = do
        liftIO $ putStrLn $ "Executing from haskell"
        return 0