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
    if (emoteMessage:find(UnitName("Player"))) then
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


local danceFrame = CreateFrame("Frame")
danceFrame:RegisterEvent("CHAT_MSG_TEXT_EMOTE")
danceFrame:SetScript("OnEvent",
    function(self, event, ...)
        --[[
        local arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12 = ...
        local argumentList = {arg1, arg2}
        ]]
        EmoteEvent({...})
    end)
