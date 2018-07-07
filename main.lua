--[[
Note: As the WoW API is intended for HUD, I can only change whatever happens in
the HUD.
It has therefore come to my attention that I cannot see whether an
emote is running or not. This plugin will therefore only be able to initiate
dancing, not check if the player is dancing or not. And as initiating dancing
when the player already is dancing cancels the dancing, this AddOn will only
work when the player isn't dancing.
]]--

--[[
"dance" starts at 5 if you are dancing with someone,
and at 16 if you are dancing alone.
]]

local function DanceCheck(emoteMessage)
    if (emoteMessage:find("dance")) then
        return true
    else
        return false
    end
end

local function IsSelf(target)
    if (target == UnitName("Player")) then
        return true
    else
        return false
    end
end

local function DancesWithYou(emoteMessage)
    if (emoteMessage:find(UnitName("Player")) or emoteMessage:find("you")) then
        return true
    else
        return false
    end
end

local function EmoteEvent(args)
    if (DanceCheck(args[1]) and not IsSelf(args[2]) and DancesWithYou(args[1])) then
        DoEmote("dance", args[2])
        print("You magically start to dance!")
    end
end


local danceHandler = CreateFrame("Frame")
danceHandler:RegisterEvent("CHAT_MSG_TEXT_EMOTE")
danceHandler:SetScript("OnEvent",
    function(self, event, ...)
        -- local args = {...}
        --[[
        local arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12 = ...
        local argumentList = {arg1, arg2}
        ]]
        EmoteEvent({...})
    end)
