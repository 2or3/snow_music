local physics = require "physics"
physics.start()

local field = display.newImage("field.jpeg")
field.x = display.contentWidth / 2
field.y = display.contentHeight / 2

field.width = display.contentWidth
field.height = display.contentHeight

local piano = display.newImage("piano.jpeg")
piano.width = piano.width * 2
piano.height = piano.height * 2

piano.x = display.contentWidth / 2
piano.y = display.contentHeight - piano.height / 2
physics.addBody( piano, "static", { friction=3 } )

local onTouch = function( event )
  if event.phase == "began" then
    local yuki = display.newImage("yuki.jpeg")
    yuki.x, yuki.y = event.x, event.y
    yuki.width, yuki.height = yuki.width / 15, yuki.height / 15
    yuki.rotation = 50
    physics.addBody( yuki, { bounce=0.3 } )
    return true
  end
end
Runtime:addEventListener( "touch", onTouch )
