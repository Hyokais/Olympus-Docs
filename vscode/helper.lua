---@meta _

---@alias captchas
---| '"Solved(Answer)"'
---| '"Wrong Answer"'
---| '"Couldn\'t Solve"'

---@alias statusBot
---| '"online"'
---| '"initialize"'
---| '"guest error"'
---| '"wrong password"'
---| '"maintenance"'
---| '"suspended"'
---| '"banned(time)"'
---| '"temporary ban"'
---| '"version update"'
---| '"aap detected"'
---| '"invalid email"'
---| '"login fail"'

---@alias proxyStatusBot
---| '"connected"'
---| '"disconnected"'
---| '"null"'

---@alias fnames
---| '"onvariant"'
---| '"onrawpacket"'
---| '"ontrackpacket"'
---| '"onpacket"'

---@alias request_type
---| '"GET"'
---| '"POST"'
---| '"PATCH"'

---@alias valueBool
---| '"Auto Access"'
---| '"Auto Reconnect"'
---| '"Ignore Gems"'

---@class bot
---@field name string The bot name
---@field world string The bot current world
---@field level number The bot level
---@field x number The bot position x
---@field y number The bot position y
---@field slots number The bot slot backpack
---@field proxy string The bot current proxy
---@field status statusBot The bot current status
---@field captcha captchas The bot current captcha status
---@field proxyStatus proxyStatusBot The bot current status proxy

---@class object
---@field id number The object item Id
---@field count number The object dropped count
---@field x number The object position x
---@field y number The object position y
---@field oid number The object oid to collect via packet

---@class tile
---@field fg number The tile foreground
---@field bg number The tile background
---@field ready boolean The tile ready to harvest if boolean return true
---@field flags number The tile flags
---@field x number The tile position x
---@field y number The tile position y

---@class player
---@field name string The player name
---@field netid number The player netid
---@field userid number the player uid
---@field country string The player country
---@field x number The player position x
---@field y number The player position y

---@class inventory
---@field name string The inventory item name
---@field id number The inventory item id
---@field count number The inventory item count

---@class clothes
---@field name string The clothes item name
---@field id number The clothes item id

---@class rawpacket
---@field type number Raw packet type
---@field netid? number Raw packet net id data
---@field flags? number Raw packet flags data
---@field int_data? number Raw packet int_data
---@field pos_x? number Raw packet position x data
---@field pos_y? number Raw packet position y data
---@field pos2_x? number Raw packet position 2 x data
---@field pos2_y? number Raw packet position 2 y data
---@field int_x? number Raw packet position x data
---@field int_y? number Raw packet position y data


---
---Sleep and wait for n milliseconds.
---@param ms number
function sleep(ms) end

--- Function to stopped script
function error() end

--- send chat pakcet with custom text
---@param text string
function say(text) end

--- send move packet on relative position
---@param rel_x number
---@param rel_y number
function move(rel_x, rel_y) end

--- Find path position
---@param x number
---@param y number
function findPath(x,y) end

--- Count the number of items in inventory
---@param itemId number
function findItem(itemId) end

--- check clothes wearing or not
---@param itemId number --- item_id to check
function findClothes(itemId) end

---
--- send a punch packet with relative position
---@param x number
---@param y number
function punch(x,y) end

--- send a place packet with relative position example
---@vararg any place(3,0,0) Place dirt seed at position 0,0 from bot position
---@param item_id number
---@param x number
---@param y number
function place(item_id, x, y) end

--- send a wrench packet with relative position
---@param x number
---@param y number
function wrench(x,y) end

---Send a drop packet to drop an item id with custom count if there is any.
---@param item number
---@param amount? number
function drop(item,amount) end

---
--- entering door worlds
---
function enter() end 

--- wearing clothes item to bot
---@param item_id number
function wear(item_id) end

--- Send collect floating packet
---@param range number -- The range within which floating items should be collected
---@param ignore number|nil -- Optional. The specific collecting ID to ignore
function collect(range, ignore) end

--- Toogle auto collect items with range
---@param toogle boolean 
---@param range number
function collectSet(toogle, range) end

---
---Send a server packet from the bot.
---
---@param packet string
---@param packet_type number
function sendPacket(packet, packet_type) end


---
--- Add a bot
---
---@param name string
---@param pass? string|nil|boolean if return nil or true added Guest account
---@param socks? string|nil if not return nil added bot with SOCKS5 Proxy
function addBot(name,pass,socks) end

--- Removing added bot
---@param name string
function removeBot(name) end

--- Send connecting packet to bot
function connect() end

--- Send disconnecting packet to bot
function disconnect() end

---
--- Add hook to bot
---
---@param fname fnames
---@param hname string
---@param callback fun(var: string) : boolean?
function addHook(fname, hname, callback) end


---
--- Removing all hooks on bot
---
function removeHooks() end


--- 
--- return ms ping connection
---
function getPing() end



--- Make https request
---
---@param requests request_type
---@param requrl string
function request(requests, requrl) end

--- Set a boolean value inside a Olympus.
---@param int_type valueBool
---@param int_bool boolean
function setBool(int_type, int_bool) end

--- Set proxy SOCKS5 ip and port
---@param int_ip string
---@param int_port number
function setProxy(int_ip, int_port) end

--- Set proxy authentication SOCKS5
---@param user string
---@param password string
function setProxyAuth(user, password) end

--- Eat buff food like Arroz,Berry or etc
---@param itemId number
function eat(itemId) end

---
--- Get current selected bot.
---
---@overload fun(name: string|nil): bot
---@return bot
---@nodiscard
function getBot() end

---
--- Get all added bots
---
---@return bot
---@nodiscard
function getBots() end

---
--- Get specific tile data
---
---@param x number
---@param y number
---@return tile
---@nodiscard
function getTile(x,y) end

---
--- Get all tile data inside worlds
---
---@return tile
---@nodiscard
function getTiles() end

---
--- Get all dropped objects inside worlds
---
---@return object
---@nodiscard
function getObjects() end

---
--- Get all inventory bot data
---
---@return inventory
---@nodiscard
function getInventory() end

--- Get all players inside worlds data
---@return player
---@nodiscard
function getPlayers() end

---
--- Get all clothes bot data
---
---@return clothes
---@nodiscard
function getClothes() end


---
--- Send raw packet from the bot.
---
---@param packet rawpacket
---@param flags number
function sendPacketRaw(packet,flags) end