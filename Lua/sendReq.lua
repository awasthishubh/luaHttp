print("Starting Lua Script...")

res=httpSimple("https://httpbin.org/get", "GET")
print(res)