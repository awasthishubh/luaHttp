module LuaHttp where
    import Foreign.Lua
    import Foreign.Lua as Lua
    import qualified Data.ByteString.Char8 as C8

    luaHttp :: Lua NumResults
    luaHttp = do
        liftIO $ putStrLn $ "Haskell function called"
        i <- peek 1 :: Lua String
        liftIO $ putStrLn $ i
        pushstring $ C8.pack "Response"
        return 1