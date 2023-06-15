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

The example above bot will find path to position x 86 and position y 30 if value fg return 12|Door
