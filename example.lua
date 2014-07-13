#!/usr/bin/env lua

local function t2s(o)
        if type(o) == 'table' then
                local s = '{ '
                for k,v in pairs(o) do
                        if type(k) ~= 'number' then k = '"'..k..'"' end
                        s = s .. '['..k..'] = ' .. t2s(v) .. ','
                end

                return s .. '} '
        else
                return tostring(o)
        end
end

-- 
local luajwt = require "luajwt"

local key = "example_key"

local claim = {
	iss = "12345678",
	nbf = 1405108000,
	exp = os.time() + 3600,
}

local alg = "HS256" -- default alg
local token, err = luajwt.encode(claim, key, alg)

print("Token:")
print(token, err, "\n")

local validate = true -- validate exp and nbf (default: true)
local decoded, err = luajwt.decode(token, key, validate)

print("Claim:")
print(t2s(decoded), err)
