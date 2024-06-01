--[[
  Simple Reaper Script to debug get_action_context values midi values. 

  Author : Malcolm Groves
  Repo : github.com/malcolmgroves/reaper_scripts
]]
function Main()
    is_new_value, filename, sectionID, cmdID, mode, resolution, val, contextstr = reaper.get_action_context()
    if is_new_value then
        DebugMsg("cmdID = " .. cmdID)
        DebugMsg("mode = " .. mode)
        DebugMsg("resolution = " .. resolution)
        DebugMsg("val = " .. val)
        DebugMsg("contextStr = " .. contextstr)
    end
end

function DebugMsg(msg)
    reaper.ShowConsoleMsg("MalGMIDILog : " .. msg .. "\n")
end

Main()
