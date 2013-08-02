local physics = require "physics"
physics.start()

local field = display.newImage("img/field.jpeg")
field.x = display.contentWidth / 2
field.y = display.contentHeight / 2

field.width = display.contentWidth
field.height = display.contentHeight

local piano = display.newImage("img/piano.jpeg")
piano.width = piano.width * 2
piano.height = piano.height * 2

piano.x = display.contentWidth / 2
piano.y = display.contentHeight - piano.height / 2
physics.addBody( piano, "static", { isSensor=true } )

local land = display.newRect( 0, display.contentHeight, display.contentWidth, 1 )
physics.addBody( land, "static", { friction=0.2 } )

local doSound = audio.loadSound("sound/do.mp3")

local onTouch = function( event )
  if event.phase == "began" then
    local yuki = display.newImage("img/snow.jpeg")
    yuki.x, yuki.y = event.x, event.y
    yuki.width, yuki.height = yuki.width / 15, yuki.height / 15
    yuki.rotation = 50
    physics.addBody( yuki, { bounce=0.2 } )
    return true
  end
end
Runtime:addEventListener( "touch", onTouch )

local onCollision = function()
  audio.play( doSound )
end
piano:addEventListener( "collision", onCollision )
