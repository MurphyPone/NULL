require("draw")
require("update")

-- Define Globals to be used throughout project
WIDTH = love.graphics.getWidth()
HEIGHT = love.graphics.getHeight()
def_font = love.graphics.newFont("font.ttf", 18)
score = 0
score_highscore = 0

-- Multiplier variables 
multiplier = 0.0
multiplier_index = 1
multipliers = {1, 0.25, 0.5, 0.75, 1}           -- Multiplier amt increases with each checkpoint
multiplier_amt = multipliers[multiplier_index]    
multiplier_highscore = multiplier

decay_amt = 0.05                                  -- Rate at which the multiplier decays

-- Checkpoint variables 
checkpoint_index = 1                              -- lua arrays start at 1 
checkpoints = {0, 10, 25, 50, 100}                -- Checkpoints at which the mult cannot go down
                                                  -- TODO get_checkpoints -> increments the multiplier, does achievements, etc. 
checkpoint = checkpoints[checkpoint_index] 


function love.load() 
    animation = new_animation(love.graphics.newImage("achievement.png"), 654, 74, 2.5)
end 

-- Used to display things
function love.draw()
    love.graphics.setBackgroundColor(255, 255, 255)
    draw_player()
    draw_stats()
end

-- Used to calculate things each game loop
function love.update(dt)
    multiplier_decay(dt)
    set_checkpoint()  
    is_focused(dt)                  -- check if the window is focused  
    move_cursor(dt)                 -- move the cursor towards the center of the screen
    check_quit()                    -- check to safely quit
end 

-- Used to safely quit
function check_quit()
    if love.keyboard.isDown("q") and love.keyboard.isDown("CTRL") then
        love.event.quit()
    end 
end 

-- Creates a new animation from sprite sheet
function new_animation(image, width, height, duration)
    local animation = {}
    animation.spriteSheet = image;
    animation.quads = {};
 
    for y = 0, image:getHeight() - height, height do
        for x = 0, image:getWidth() - width, width do
            table.insert(animation.quads, love.graphics.newQuad(x, y, width, height, image:getDimensions()))
        end
    end
 
    animation.duration = duration or 1
    animation.currentTime = 0
 
    return animation
end
