--[[
 * ReaScript Name: Increase selected items fade-in length (relative only)
 * Description: 
 * Author: Malcolm Groves
 * Author URI: 
 * Repository: GitHub > malcolmgroves > Reaper Scripts
--]]

function main(input1) 

    reaper.Undo_BeginBlock() -- Begining of the undo block. Leave it at the top of your main function.
    selected_items_count = reaper.CountSelectedMediaItems(0)
    
    -- INITIALIZE loop through selected items
    for i = 0, selected_items_count-1  do
      -- GET ITEMS
      item = reaper.GetSelectedMediaItem(0, i) -- Get selected item i
      
      item_pos = reaper.GetMediaItemInfo_Value(item, "D_POSITION")
      item_len = reaper.GetMediaItemInfo_Value(item, "D_LENGTH")
      item_end = item_pos + item_len
      
      fadeout_len_init = reaper.GetMediaItemInfo_Value(item, "D_FADEOUTLEN")
      
      -- GET FADES
      fadeout_len = fadeout_len_init + tonumber(input1)
 
      DebugMsg("fadeout_len_init = "..fadeout_len_init)
      DebugMsg("fadeout_len = "..fadeout_len)
    
      -- SET
          reaper.SetMediaItemInfo_Value(item, "D_FADEOUTLEN", fadeout_len)
     
    end -- ENDLOOP through selected items
      
    reaper.Undo_EndBlock("Set selected items fade-out length (seconds)", -1) -- End of the undo block. Leave it at the bottom of your main function.

end


  function DebugMsg(msg)
    -- reaper.ShowConsoleMsg("MalG_Debug : "..msg.."\n")
  end
  

  is_new_value,filename,sectionID,cmdID,mode,resolution,val = reaper.get_action_context()
  
  -- mode 0 is absolute mode
  -- if mode == 0 then
  --   DebugMsg("Can only handle relative midi messages.") 
  -- else
    DebugMsg("sectionID = "..sectionID)
    DebugMsg("cmdID = "..cmdID)

    DebugMsg("mode = "..mode)
    DebugMsg("val = "..val)
    DebugMsg("resolution = "..resolution)
    percent = val / resolution
 
    reaper.PreventUIRefresh(1) -- Prevent UI refreshing. Uncomment it only if the script works.

    main(-0.01) -- TODO: Replace with +/- amunt from val
    
    reaper.PreventUIRefresh(-1) -- Restore UI Refresh. Uncomment it only if the script works.
    reaper.UpdateArrange() -- Update the arrangement (often needed)

 -- end




