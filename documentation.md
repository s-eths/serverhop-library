# Serverhop Libary Documentation

## Getting started.
```lua
local Serverhop = loadstring(game:HttpGet("https://raw.githubusercontent.com/socialsuicide/lua-scripts/main/serverhop-library/src.lua"))();
```

## Using functions.

### Serverhop:Normal()
```lua
local Serverhop = loadstring(game:HttpGet("https://raw.githubusercontent.com/socialsuicide/lua-scripts/main/serverhop-library/src.lua"))();

Serverhop:Normal(true, nil);
```
```text
Usage of Serverhop:Normal() - Scrapes JobIDs and saves them into a JSON file before selecting a random JobID to teleport too.

1) Logs:
    Usage: {true, false},
    Action: Outputs logs using rconsoleprint.
2) Amount:
    Usage: {int, nil},
    Action: Scrapes a certain amount of JobIDs (nil = inf).
```

### Serverhop:Dynamic()
```lua
local Serverhop = loadstring(game:HttpGet("https://raw.githubusercontent.com/socialsuicide/lua-scripts/main/serverhop-library/src.lua"))();

Serverhop:Dynamic(true, nil)
```
```text
Usage of Serverhop:Dynamic() - Scrapes JobIDs which havent been used in the past hour into a JSON file before selecting a random JobID to teleport too.

1) Logs:
    Usage: {true, false},
    Action: Outputs logs using rconsoleprint.
2) Amount:
    Usage: {int, nil},
    Action: Scrapes a certain amount of JobIDs (nil = inf).
```

### Serverhop:Rejoin()
```lua
local Serverhop = loadstring(game:HttpGet("https://raw.githubusercontent.com/socialsuicide/lua-scripts/main/serverhop-library/src.lua"))();

Serverhop:Rejoin(true)
```
```text
Usage of Serverhop:Rejoin() - Rejoins the exact same JobID.

1) Logs:
    Usage: {true, false},
    Action: Outputs logs using rconsoleprint.
```

### Serverhop:LowPing()
```lua
local Serverhop = loadstring(game:HttpGet("https://raw.githubusercontent.com/socialsuicide/lua-scripts/main/serverhop-library/src.lua"))();

Serverhop:LowPing(true, nil, 250)
```
```text
Usage of Serverhop:LowPing() - Scrapes JobIDs of servers with below or the inputed ping into a JSON file before selecting a random JobID to teleport too.

1) Logs:
    Usage: {true, false},
    Action: Outputs logs using rconsoleprint.
2) Amount:
    Usage: {int, nil},
    Action: Scrapes a certain amount of JobIDs (nil = inf).
3) Ping:
    Usage: {int, nil},
    Action: Scrapes JobIDs with servers with below or inputed ping (nil = 100).
```

### Serverhop:LowPlayers()
```lua
local Serverhop = loadstring(game:HttpGet("https://raw.githubusercontent.com/socialsuicide/lua-scripts/main/serverhop-library/src.lua"))();

Serverhop:LowPlayers(true, nil, 10)
```
```text
Usage of Serverhop:LowPlayers() - Scrapes JobIDs of servers with below or the inputed amount of players.

1) Logs:
    Usage: {true, false},
    Action: Outputs logs using rconsoleprint.
2) Amount:
    Usage: {int, nil},
    Action: Scrapes a certain amount of JobIDs (nil = inf).
3) Players:
    Usage: {int, nil},
    Action: Scrapes JobIDs of servers with below or the inputed amount of players (nil = Half of maxPlayers).
```

### Serverhop:Instant()
```lua
local Serverhop = loadstring(game:HttpGet("https://raw.githubusercontent.com/socialsuicide/lua-scripts/main/serverhop-library/src.lua"))();

Serverhop:Instant(true)
```
```text
Usage of Serverhop:Instant() - Instantly joins another JobID without using JSON.

1) Logs:
    Usage: {true, false},
    Action: Outputs logs using rconsoleprint.
```

### Serverhop:JoinJobID()
```lua
local Serverhop = loadstring(game:HttpGet("https://raw.githubusercontent.com/socialsuicide/lua-scripts/main/serverhop-library/src.lua"))();

Serverhop:JoinJobID(true)
```
```text
Usage of Serverhop:JoinJobID() - Joins the inputed JobID.

1) Logs:
    Usage: {true, false},
    Action: Outputs logs using rconsoleprint.
2) JobID:
    Usage: {str},
    Action: Joins a inputed JobID.
```

## Examples
> https://github.com/s-eths/serverhop-library/tree/main/examples
