function sceneInfo()
  state = emu.getState()

  bgColor = 0x302060FF
  fgColor = 0x30FF4040

  --Draw some rectangles and print some text
  emu.drawRectangle(8, 8, 86, 16, bgColor, true, 1)
  emu.drawRectangle(8, 8, 86, 16, fgColor, false, 1)
  emu.drawString(12, 12, "Dialogue ID: " ..  string.format('%02d', emu.read(0x64, emu.memType.cpu)), 0xFFFFFF, 0xFF000000, 1)
end

emu.addEventCallback(sceneInfo, emu.eventType.endFrame)

