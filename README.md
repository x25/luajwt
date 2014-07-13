luajwt
===========

JSON Web Tokens for Lua

```bash
# luarocks install --server=http://rocks.moonscript.org luajwt
```

## Usage

Basic usage:

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

An openresty/ngx_lua example:

```
location /auth {
	content_by_lua '
		local luajwt = require "luajwt"

		local args = ngx.req.get_uri_args(1)

		if not args.jwt then
		        ngx.say("Undefined token")
        		return
		end

		local key = "SECRET_PASSWORD"

		local ok, err = luajwt.decode(args.jwt, key)

		if not ok then
		        ngx.say("Error: ", err)
        		return
		end

		ngx.say("Welcome!")
	';
}
```

Generate token and try:

```bash
curl your.server/auth?jwt=TOKEN
```

## Algorithms

**HMAC**

* HS256	- HMAC using SHA-256 hash algorithm (default)
* HS384	- HMAC using SHA-384 hash algorithm
* HS512 - HMAC using SHA-512 hash algorithm

## License
MIT
