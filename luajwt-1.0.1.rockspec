package = "luajwt"
version = "1.0.1"
source = {
  url = "https://github.com/x25/jwt-lua/archive/v1.0.1.tar.gz",
  dir = "lua-jwt-1.0.1"
}
description = {
  summary = "JSON Web Tokens for Lua",
  detailed = [[
  ]],
  homepage = "https://github.com/x25/jwt-lua",
  license = "MIT <http://opensource.org/licenses/MIT>"
}
dependencies = {
  "lua >= 5.1",
  "luacrypto >= 0.3.2-1",
  "lua-cjson >= 2.1.0",
  "lbase64 >= 20120820-1"
}
build = {
  type = "builtin",
  modules = {
    ["luajwt"] = "src/jwt.lua",
  }
}
