lrc4
=====

[![travis-ci status](https://travis-ci.org/CheyiLin/lrc4.svg?branch=master)](https://travis-ci.org/CheyiLin/lrc4)

Pure Lua/LuaJIT RC4 stream cipher library

## Usage

### Overview

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

License
-------

Copyright (c) 2015 Cheyi Lin.
MIT licensed. See LICENSE for details.
