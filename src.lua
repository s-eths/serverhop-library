local SERVER_HOP = {};

local API, SERVER_PAGES;

repeat task.wait(); until game:IsLoaded();

local function CREATE_FILE(FILE_NAME, FILE)
    pcall(function()
        makefolder("ServerHopper");
        makefolder("ServerHopper//" .. game.PlaceId);
        writefile("ServerHopper//" .. game.PlaceId .. "//" .. FILE_NAME .. ".json", FILE);
    end);
end;

local function FETCH_JOB_IDS(AMOUNT, FILTER_FUNCTION)
    local JOB_IDS = {os.date("*t").hour};
    SERVER_PAGES = nil;

    repeat
        task.wait();

        API = game:GetService("HttpService"):JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100" .. (SERVER_PAGES and "&cursor=".. SERVER_PAGES or "")));

        for i, v in next, API["data"] do
            if v["id"] ~= game.JobId and v["playing"] ~= v["maxPlayers"] and (not FILTER_FUNCTION or FILTER_FUNCTION(v)) then
                if #JOB_IDS < AMOUNT + 1 then
                    table.insert(JOB_IDS, v["id"]);
                end;
            end;
        end;

        SERVER_PAGES = API.nextPageCursor;

    until not SERVER_PAGES or #JOB_IDS >= AMOUNT + 1;

    return JOB_IDS;
end;

local function GET_RANDOM_JOD_ID(TABLE)
    return TABLE[math.random(1, #TABLE)];
end;

local function TELEPORT_TO_JOB(JOB_IDS)
    local SELECTED_JOB_ID = GET_RANDOM_JOD_ID(JOB_IDS);

    game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, SELECTED_JOB_ID);

    game:GetService("Players").LocalPlayer.OnTeleport:Connect(function(STATUS)
        if STATUS == Enum.TeleportState.Failed then
            SELECTED_JOB_ID = GET_RANDOM_JOD_ID(JOB_IDS);
            game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, SELECTED_JOB_ID);
        end;
    end);
end;

function SERVER_HOP:Normal(AMOUNT)
    if AMOUNT == nil then AMOUNT = tonumber(math.huge); end;

    local JOB_IDS = FETCH_JOB_IDS(AMOUNT);

    TELEPORT_TO_JOB(JOB_IDS);
end;

function SERVER_HOP:Instant()
    local JOB_IDS = {};

    for i, v in next, game:GetService("HttpService"):JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/".. game.PlaceId .."/servers/Public?sortOrder=Asc&limit=100"))["data"] do
        if v["id"] ~= game.JobId and v["playing"] ~= v["maxPlayers"] then
            table.insert(JOB_IDS, v["id"]);
        end;
    end;

    TELEPORT_TO_JOB(JOB_IDS);
end;

function SERVER_HOP:LowPing(AMOUNT, PING)
    if PING == nil then PING = 100; end;
    if AMOUNT == nil then AMOUNT = tonumber(math.huge); end;

    local JOB_IDS = FETCH_JOB_IDS(AMOUNT, function(v)
        return v["ping"] ~= nil and v["ping"] <= PING;
    end);

    TELEPORT_TO_JOB(JOB_IDS);
end;

function SERVER_HOP:LowPlayers(AMOUNT, PLAYERS)
    if PLAYERS == nil then
        for i, v in next, game:GetService("HttpService"):JSONDecode(game:HttpGet("https://games.roblox.com/v1/games?universeIds=".. game.GameId))["data"] do
            PLAYERS = tonumber(v["maxPlayers"]) / 2;
        end;
    end;

    if AMOUNT == nil then AMOUNT = tonumber(math.huge); end;

    local JOB_IDS = FETCH_JOB_IDS(AMOUNT, function(v)
        return v["playing"] <= PLAYERS;
    end);

    TELEPORT_TO_JOB(JOB_IDS);
end;

function SERVER_HOP:Dynamic(AMOUNT)
    if AMOUNT == nil then AMOUNT = tonumber(math.huge); end;

    local OLD_JOB_IDS = {os.date("*t").hour};

    if not isfile("ServerHopper//".. game.PlaceId .."//old_dynamic-jobids.json") then
        CREATE_FILE("old_dynamic-jobids", game:GetService("HttpService"):JSONEncode(OLD_JOB_IDS));
    end;

    OLD_JOB_IDS = game:GetService("HttpService"):JSONDecode(readfile("ServerHopper//".. game.PlaceId .."//old_dynamic-jobids.json"));

    local JOB_IDS = FETCH_JOB_IDS(AMOUNT, function(v)
        return not table.find(OLD_JOB_IDS, v["id"]);
    end);

    local SELECTED_JOB_ID = GET_RANDOM_JOD_ID(JOB_IDS);

    table.insert(OLD_JOB_IDS, SELECTED_JOB_ID);

    writefile("ServerHopper//".. game.PlaceId .."//old_dynamic-jobids.json", game:GetService("HttpService"):JSONEncode(OLD_JOB_IDS));

    TELEPORT_TO_JOB(JOB_IDS);
end;

function SERVER_HOP:JoinJobID(JOB_ID)
    game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, JOB_ID);

    game:GetService("Players").LocalPlayer.OnTeleport:Connect(function(STATUS)
        if STATUS == Enum.TeleportState.Failed then
            print("[!] Failed to join " .. JOB_ID);
        end;
    end);
end;

function SERVER_HOP:Rejoin()
    game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId);

    game:GetService("Players").LocalPlayer.OnTeleport:Connect(function(STATUS)
        if STATUS == Enum.TeleportState.Failed then
            print("[!] Failed to rejoin");
        end;
    end);
end;

return SERVER_HOP;