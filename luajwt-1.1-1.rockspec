package = "luajwt"
version = "1.1-1"
source = {
  url = "git://github.com/x25/luajwt",
  tag = "v1.1"
}
description = {
  summary = "JSON Web Tokens for Lua",
  detailed = [[
  ]],
  homepage = "https://github.com/x25/luajwt",
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
