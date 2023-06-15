**←** [Back to Main](main.md)

## sleep
`sleep(ms)`

Sleep and wait for n milliseconds (1000ms = 1s)

Example:
```lua
say("Hello world")
sleep(4000)
```

the example above gives a sleep of 4 seconds after saying Hello world

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

The example above is how to forcibly stop the script

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

The example above will say the words according to the conditions

## move
`move(rel_x,rel_y,bool solid)`

Send move packet on relative position

Example:
```lua
move(5,0)
sleep(500)
```

The example above bot will move 5 tile from last position

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

The example above bot will find path to position x 86 and y 30 if value fg return 12|Door

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

the example above is when the bot does findItem on itemid 4585 and the number is 190 or more the bot will drop as much as 100

## findClothes
`findClothes(int_itemid)`

Checks whether the bot is wearing the item or not

Example:
```lua
if findClothes(98) then
    print("I used Pickaxe")
end
```

The example above is checking if bot wearing a pickaxe or not

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

The example above is when the bot detects the fg value is not 0 in certain x and y positions the bot will destroy until the fg value is 0

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

The example above is when the fg value in the current position x and y is not 3 the bot will place it until the fg value is 3

## wrench
`wrench(rel_x,rel_y)`

Send a wrench packet on relative position.

Example:
```lua
wrench(x,y)
sendPacket("action|dialog_return\ndialog_name|door_edit\ntilex|" ..x .. "|\ntiley|" .. y .. "|\ndoor_name|imoets\ndoor_target|\ndoor_id|Olympus",2)
```

In the example above the bot changes the id door after doing the wrench

## drop
`drop(int_itemid,int_amount|nil)`

Send a drop packet to drop an item id with custom amount if there is any

Example:
```lua
drop(4585,100) --- bot dropping 100 Pepper seed
drop(4585) --- bot dropping all pepper seed in backpack
```

The example above bot will drops with 100 amount and drop all item on backpack
