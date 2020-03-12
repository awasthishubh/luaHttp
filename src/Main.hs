module Main where

import LuaHttp 
import Foreign.Lua
main :: IO ()
main = run $ do
  openlibs
  registerHaskellFunction "httpSimple" luaHttp
  loadfile "./Lua/sendReq.lua"
  call 0 0