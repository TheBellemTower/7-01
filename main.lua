-----------------------------------------------------------------------------------------
--
-- main.lua
--
--created by Ethan Bellem
--created by April 2018
-----------------------------------------------------------------------------------------
display.setStatusBar(display.HiddenStatusBar)

local sun = display.newImageRect( "./assets/sprites/theSun.jpg", 900, 600)
sun.x = 700
sun.y = 700
sun.id = "left side object"

local ball =  display.newImageRect( "./assets/sprites/ball.png", 900, 600)
ball.x = 2000
ball.y = 700
ball.id = "right side object"

local function onObjectTouch( event )
    if ( event.phase == "began" ) then
        print( "Touch event began on: " .. event.target.id )
    elseif ( event.phase == "ended" ) then
        print( "Touch event ended on: " .. event.target.id )
    end
    return true
end

function ball:touch( event )
    if ( event.phase == "began" ) then
        print( "Touch event began on: " .. self.id )
 
        -- Set touch focus
        display.getCurrentStage():setFocus( self )
        self.isFocus = true
     
    elseif ( self.isFocus ) then
        if ( event.phase == "moved" ) then
            print( "Moved phase of touch event detected." )
 
        elseif ( event.phase == "ended" or event.phase == "cancelled" ) then
 
            -- Reset touch focus
            display.getCurrentStage():setFocus( nil )
            self.isFocus = nil
            print( "Touch event ended on: " .. self.id )
        end
    end

    return true
end

ball:addEventListener( "touch", ball )

sun:addEventListener( "touch", onObjectTouch)