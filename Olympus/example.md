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
