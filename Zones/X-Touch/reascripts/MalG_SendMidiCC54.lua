channel = 1
defer_count = 0
pitch = 54


function main ()
    reaper.StuffMIDIMessage(0, 0x90 + channel - 1, pitch, 96)
end

main ()

