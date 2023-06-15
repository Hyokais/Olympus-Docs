## WorldTile

| Type | Name | Description |
|:-----|:----:|:-----------|
| Number | `x` | Position x |
| Number | `y` | Position y |
| Number | `fg` | Foreground id |
| Number | `bg` | Background id |
| Number | `flags` | Tile's flags |
| Boolean | `ready` | Is ready to harvest |

## HookList
| Type | Name | Description |
|:-----|:----:|:-----------|
| String | fname | onvariant,onrawpacket,ontrackpacket,onpacket |
| String | hookname | any |
| function | any | onvariant structure[varlist](#Varlist) |

## Varlist
| Type | Name | Description |
|:-----|:----:|:-----------|
| String | [0] | Variant function name |
| any | [1] | Param1 |
| any | [2] | Param2 |
| any | [3] | Param3 |
| any | [4] | Param4 |
| any | [5] | Param5 |
