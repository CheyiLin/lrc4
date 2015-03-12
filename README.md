lrc4
=====

[![travis-ci status](https://travis-ci.org/CheyiLin/lrc4.svg?branch=master)](https://travis-ci.org/CheyiLin/lrc4)

Native Lua/LuaJIT RC4 stream cipher library

## Lua Compatibility

| Version | Module Dependencies | Remark | 
| ------- | ------------------- | ------ |
| Lua 5.2 | `bit32` |  |
| Lua 5.3 | `bit32` | `bit32` has been deprecated |
| LuaJIT 2.0/2.1 | `ffi`, `bit` | ffi C struct optimized |

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
# Lua 5.2.4
$ lua rc4.lua
RC4 keygen test    10.250 sec (100000 times, #key 8)
RC4 crypt test     68.980 sec (100000 times, #key 8, #input 512)

# LuaJIT 2.0.3
$ luajit-2.0.3 rc4.lua
RC4 keygen test     0.310 sec (100000 times, #key 8)
RC4 crypt test      0.800 sec (100000 times, #key 8, #input 512)

# LuaJIT 2.1 alpha
$ luajit-2.1.0-alpha rc4.lua
RC4 keygen test     0.280 sec (100000 times, #key 8)
RC4 crypt test      0.740 sec (100000 times, #key 8, #input 512)
```

## License

Copyright (c) 2015 Cheyi Lin.
MIT licensed. See LICENSE for details.
