**←** [Back to Main](main.md)

## sleep
`sleep(ms)`

Sleep and wait for n milliseconds (1000ms = 1s)

Example:
```lua
say("Hello world")
sleep(4000)
```

## error
`error()`

Terminate the script via executor

Example:
```lua
if findItem(98) == 0 then
    print("can't find pickaxe in backpack,stop script")
    return error()
end
```

## say
`say(string text)`

Sending chat packets from bots

Example:
```lua
if findPath(73,23) then
    say("did findPath successfully")
else
    say("failed to do findPath")
end
```

## move
`move(rel_x,rel_y,bool solid)`

Send move packet on relative position

Example:
```lua
move(5,0)
sleep(500)
```

## findPath
`findPath(int_x,int_y)`

Find path to specific tile in worlds

Example:
```lua
if getTile(86,30).fg == 12 then
    findPath(86,30)
    sleep(200)
end
```

## findItem
`findItem(int_itemid)`

Count the number of items in inventory

Example:
```lua
if findItem(4585) >= 190 then
    drop(4585,100)
    sleep(1000)
end
```

## findClothes
`findClothes(int_itemid)`

Checks whether the bot is wearing the item or not

Example:
```lua
if findClothes(98) then
    print("I used Pickaxe")
end
```

## punch
`punch(rel_x,rel_y)`

Send a punch packet on relative position.

Example:
```lua
while getTile(x,y).fg ~= 0 do
    punch(x,y)
    sleep(120)
end
```

## place
`place(int_itemid,rel_x,rel_y)`

Send a place packet on relative position with item id.

Example:
```lua
while getTile(math.floor(getBot().x / 32),math.floor(getBot().y / 32)).fg ~= 3 do
    place(3,0,0)
    sleep(120)
end
```

## wrench
`wrench(rel_x,rel_y)`

Send a wrench packet on relative position.

Example:
```lua
wrench(x,y)
sendPacket("action|dialog_return\ndialog_name|door_edit\ntilex|" ..x .. "|\ntiley|" .. y .. "|\ndoor_name|imoets\ndoor_target|\ndoor_id|Olympus",2)
```

## drop
`drop(int_itemid,int_amount|nil)`

Send a drop packet to drop an item id with custom amount if there is any

Example:
```lua
drop(4585,100) --- bot dropping 100 Pepper seed
drop(4585) --- bot dropping all pepper seed in backpack
```

## enter
`enter()`

Send a enter door packet on local bot position

Example:
```lua
if getTile(math.floor(getBot().x / 32),math.floor(getBot().y / 32)).fg == 12 then
    enter()
    sleep(100)
end
```

## wear
`wear(int_itemid)`

Send a wear packet to wear an clothing item id.

Example:
```lua
if not findClothes(98) then
    wear(98)
    sleep(500)
end
```

## collect

`collect(int_radius,int_itemid|nil)`

Send a collect packet and ignore item id if there is any.

Example:
```lua
for _,object in pairs(getObjects()) do
    if object.id == 98 then
        findPath(math.floor(object.y / 32),math.floor(object.y / 32))
        sleep(500)
        collect(3)
        sleep(500)
    end
    if findItem(98) > 0 then
        break
    end
end
```

## collectSet
`collectSet(bool,int_radius)`

Toggle auto collect items with range.

Example:
```lua
for _,object in pairs(getObjects()) do
    if object.id == 98 then
        findPath(math.floor(object.y / 32),math.floor(object.y / 32))
        sleep(500)
        collectSet(true,3)
        sleep(500)
    end
    if findItem(98) > 0 then
        break
    end
end
```

## sendPacket
`sendPacket(string_packet,int_type)`

Send a server packet from the bot.

Example:
```lua
sendPacket("action|join_request\nname|Olympus\ninvitedWorld|0",3)
sleep(10000)
```

## addBot
`addBot(string_name,string_pass|bol|nil,string_proxy|nil)`

Adding bots to the olympus application
Example:
```lua
---Add Guest Without Proxy
addBot("Olympus")
---Add Guest With Proxy
addBot("Olympus",true,"123:444:olmypus:olym1")
---Normal add without proxy
addBot("Olympus","password")
---Normal add with proxy
addBot("Olympus","password","123:444:olmypus:olym1")
```

## removeBot
`removeBot(string_name)`

Removing bot from Olympus list table

Example:
```lua
removeBot(getBot().name)
sleep(100)
```

## connect
`connect()`

Send a connect packet

Example:
```lua
--- looping until bot status online
while getBot().status ~= 'online' do
    connect() --- send a connect packet
    sleep(10000) --- sleep 10s
end
```

## disconnect
`disconnect()`

send a disconnect packet

Example:
```lua
--- looping until bot status offline
while getBot().status ~= 'offline' do
    disconnect() --- send a disconnect packet
    sleep(10000) --- sleep 10s
end
```

## addHook
`addHook(string_fname,string_name,fun)`

available fname: `onvariant,onrawpacket,ontrackpacket,onpacket`

structure onvariant: [VarList](structure.md#VarList)

Added hook to bot, here param structure function 

Example:
```lua
addHook("onvariant","nuked",function(var)
    if var[0] == "OnConsoleMessage" then
        if string.find(var[1],"That world is inaccessible.") then
            nuked = true
        end
    end
end)
```

## removeHooks
`removeHooks()`

Removing all hooks in bot

Example:
```lua
addHook("onvariant","nuked",function(var)
    if var[0] == "OnConsoleMessage" then
        if string.find(var[1],"That world is inaccessible.") then
            nuked = true
        end
    end
end)
sleep(10000)
removeHooks()
```

## getPing
`getPing()`

Return ping speed connection

Example:
```lua
print(tostring(getPing()))
```

## request
`request(string_type,string_url)`

available type: `GET,PATCH,POST`

Make https request

Example:
```lua
local text = request("GET","example.com/raw")
print(text)
```

## setBool
`setBool(string_type,bool_status)`

available type : `Auto Access, Auto Reconnect, Ignore Gems`

set toogle value inside a Olympus

Example:
```lua
setBool("Auto Access",true)
```

## setProxy
`setProxy(string_ip,int_port)`

Example:
```lua
setProxy('123.456.789',4444)
```

## setProxyAuth
`setProxyAuth(string_user,string_pass)`


set proxy authentication,setProxy  $\textcolor{red}{\textsf{Required}}$ 

Example:
```lua
setProxy('123.456.789',4444)
sleep(100)
setProxyAuth('Olympus','OlympusPass')
sleep(100)
```

## eat
`eat(int_itemid)`

Place in local bot position

```Example:
eat(4604)
```

## getBot
`getBot(string_name|nil)`

Get selected bot, return the bot's [BotClient](structure.md#BotClient)

Example:
```lua
print(getBot().name)
```
