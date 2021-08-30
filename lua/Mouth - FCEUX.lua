function bitand(a, b)
    local result = 0
    local bitval = 1
    while a > 0 and b > 0 do
      if a % 2 == 1 and b % 2 == 1 then -- test the rightmost bits
          result = result + bitval      -- set the current bit
      end
      bitval = bitval * 2 -- shift left
      a = math.floor(a/2) -- shift right
      b = math.floor(b/2)
    end
    return result
end



while true do
local SceneAddress = 0x2
local Scene = bitand(memory.readword(SceneAddress), 0x03)
gui.text(20, 20, "Mouth AND: " .. Scene)
emu.frameadvance()
end

