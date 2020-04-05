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
multipliers = {0.1, 0.25, 0.5, 0.75, 1}           -- Multiplier amt increases with each checkpoint
multiplier_amt = multipliers[multiplier_index]    
multiplier_highscore = multiplier

decay_amt = 0.05                                  -- Rate at which the multiplier decays

-- Checkpoint variables 
checkpoint_index = 1                              -- lua arrays start at 1 
checkpoints = {0, 10, 25, 50, 100}                -- Checkpoints at which the mult cannot go down
                                                  -- TODO get_checkpoints -> increments the multiplier, does achievements, etc. 
checkpoint = checkpoints[checkpoint_index] 


function love.load() 
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

function check_quit()
    if love.keyboard.isDown("q") and love.keyboard.isDown("`") then
        love.event.quit()
    end 
end 