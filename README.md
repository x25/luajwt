luajwt
===========

JSON Web Tokens for Lua

```bash
$ luarocks install --server=http://rocks.moonscript.org luajwt
```

## Usage

```lua
local luajwt = require "luajwt"

local key = "example_key"

local claim = {
        iss = "12345678",
        nbf = 1405108000,
	exp = os.time() + 3600,
}

local alg = "HS256" -- (default: HS256)
local token, err = luajwt.encode(claim, key, alg)

-- Token: (linebreaks added for readability)
--[[ eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiIxMjM0NTY3OC
IsIm5iZiI6MTQwNTEwODAwMCwiZXhwIjoxNDA1MTgxOTE2fQ._Gvr99eMoi0mWxI
xWOIAexN7UXO06GbpnEgkxdQkeXQ ]]--

local validate = true -- validate exp and nbf (default: true)
local decoded, err = luajwt.decode(token, key, validate)

-- Decoded: { ["iss"] = 12345678, ["nbf"] = 1405108000, ["exp"] = 1405181916 }
```

## Algorithms

HS256, HS384, HS512

## License
MIT
