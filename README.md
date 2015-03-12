lrc4
=====

[![travis-ci status](https://travis-ci.org/CheyiLin/lrc4.svg?branch=master)](https://travis-ci.org/CheyiLin/lrc4)

Native Lua 5.2/LuaJIT RC4 stream cipher library

## Lua Compatibility



## Usage

```lua
local rc4 = require("rc4")
local key = "my_secret"

-- generate keystream
local rc4_ks_server = rc4(key)
local rc4_ks_client = rc4(key)

-- server encrypts messages
local msg_from_server_1 = "Hello"
local msg_from_server_2 = "This is SERVER"
local encrypted_msg_1 = rc4_ks_server(msg_from_server_1)
local encrypted_msg_2 = rc4_ks_server(msg_from_server_2) 

-- client decrypts messages one after another
local decrypted_msg_1 = rc4_ks_client(encrypted_msg_1)
assert(msg_from_server_1 == decrypted_msg_1)
local decrypted_msg_2 = rc4_ks_client(encrypted_msg_2)
assert(msg_from_server_2 == decrypted_msg_2)
```

## Test and Benchmark

```bash
# Lua 5.2
$ lua rc4.lua 200000
RC4 keygen test    25.420 sec (200000 times, #key 8)
RC4 crypt test    180.720 sec (200000 times, #key 8, #input 512)

# LuaJIT 2.1 alpha
$ luajit-2.1.0-alpha rc4.lua 200000
RC4 keygen test     0.780 sec (200000 times, #key 8)
RC4 crypt test      1.700 sec (200000 times, #key 8, #input 512)
```

## License

Copyright (c) 2015 Cheyi Lin.
MIT licensed. See LICENSE for details.
