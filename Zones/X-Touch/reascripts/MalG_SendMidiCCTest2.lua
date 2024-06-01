--[[
  Reaper Script to send a MIDI Note On and Off on channel 1 value 0


  Author : Malcolm Groves
  Repo : github.com/malcolmgroves/reaper_csi

    8 = Note Off 
    9 = Note On 
    10 = AfterTouch (ie, key pressure) 
    11 = Control Change 
    12 = Program (patch) change 
    13 = Channel Pressure 
    14 = Pitch Wheel


]]

channel = 1
defer_count = 0
pitch = 36;


function WaitToSendNoteOffs()
  if defer_count > 30*0.5 then -- wait ~0.5s before sending the "noteoff" -event
      reaper.StuffMIDIMessage(0, 0x80 + channel -1, pitch, 96)
    else
      reaper.defer(WaitToSendNoteOffs)
      defer_count = defer_count+1
  end
end;


function main ()
    reaper.StuffMIDIMessage(0, 0x90 + channel -1, pitch, 96)
    WaitToSendNoteOffs()
end

main ()

