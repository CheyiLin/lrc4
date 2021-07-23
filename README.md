# lrc4

[![ci-dev](https://github.com/CheyiLin/lrc4/actions/workflows/ci-dev.yml/badge.svg)](https://github.com/CheyiLin/lrc4/actions/workflows/ci-dev.yml)

Native Lua/LuaJIT RC4 stream cipher library

## Lua Compatibility

| Version | Module Dependencies | Remark |
| ------- | ------------------- | ------ |
| [Lua 5.2 (PUC)](https://www.lua.org/versions.html#5.2) | `bit32` |  |
| [Lua 5.3 (PUC)](https://www.lua.org/versions.html#5.3) |  | Native bitwise op |
| [Lua 5.4 (PUC)](https://www.lua.org/versions.html#5.4) |  | Native bitwise op |
| [LuaJIT 2.0](https://luajit.org/luajit.html) | `ffi`, `bit` | `ffi` C struct optimized |
| [LuaJIT 2.1 (OpenResty)](https://github.com/openresty/luajit2) | `ffi`, `bit` | `ffi` C struct optimized |

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
$ lua52 rc4.lua
RC4 keygen test    10.250 sec (100000 times, #key 8)
RC4 crypt test     68.980 sec (100000 times, #key 8, #input 512)

# Lua 5.3.1
$ lua53 rc4.lua
RC4 keygen test    10.280 sec (100000 times, #key 8)
RC4 crypt test     72.310 sec (100000 times, #key 8, #input 512)

# LuaJIT 2.0.4
$ luajit-2.0.4 rc4.lua
RC4 keygen test     0.310 sec (100000 times, #key 8)
RC4 crypt test      0.800 sec (100000 times, #key 8, #input 512)

# LuaJIT 2.1.0 beta1
$ luajit-2.1.0-beta1 rc4.lua
RC4 keygen test     0.280 sec (100000 times, #key 8)
RC4 crypt test      0.740 sec (100000 times, #key 8, #input 512)
```

## License

Copyright (c) 2021 Cheyi Lin.
MIT licensed. See LICENSE for details.
