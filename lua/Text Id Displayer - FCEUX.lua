while true do
  local DialogueIdOffset = 0x64
  local DialogueId = memory.readword(DialogueIdOffset)
  gui.text(20, 20, "Dialogue Id: " .. DialogueId)
  emu.frameadvance()
end
