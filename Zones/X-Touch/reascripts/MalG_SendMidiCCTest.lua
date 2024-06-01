--[[
  Reaper Script to send a MIDI CC message on channel 1 cc10 value 0


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



function main ()
    msg_type = 11 -- CC
    channel = 0

    reaper.StuffMIDIMessage(0, msg_type*16 + channel, 10, 0)
end

main ()
