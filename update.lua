-- Contains the update methods

-- Detects if the player has the window focused and keeps their score at 0 if it is 
function is_focused(dt)
    if not love.window.hasFocus() then
        score = score + (1 * multiplier* dt)
    else 
        score = 0
    end
    print(dt)
end 

-- Increase multiplier by multiplier_amt when click
function love.mousepressed(x, y, button, istouch, presses)
    multiplier = multiplier + multiplier_amt
    set_highscore()
end 

-- Updates the high score and best mutliplier 
function set_highscore()
    -- no need to update the score since tha ish STAYS at 0
    if multiplier > multiplier_highscore then
        multiplier_highscore = multiplier
    end
end 

-- Sets the floor amount to decay to and increase the multiplier amt when new checkpoint is reached
function set_checkpoint()
    if multiplier >= checkpoints[checkpoint_index+1] then
        checkpoint_index = checkpoint_index + 1
        checkpoint = checkpoints[checkpoint_index]
        multiplier_index = multiplier_index + 1
        multiplier_amt = multipliers[multiplier_index]
    end 
end 

-- Decays the multiplier when the user is not building multiplier
function multiplier_decay(dt)
    if multiplier >= checkpoint + decay_amt then
        multiplier = multiplier - decay_amt * dt
    end
end 

-- If the mouse is farther than $radius away, then move the mouse towards the center,
--  then just wiggle the mouse around a bunch
--  Implement smooth movement https://love2d.org/forums/viewtopic.php?t=33140 
function move_cursor(dt) 
    local move_amt = 100*dt
    local curr_x, curr_y = love.mouse.getPosition()

    local new_x, new_y

    -- Q4
    if curr_x >= WIDTH/2 and curr_y >= HEIGHT/2 then
        new_x = curr_x - move_amt
        new_y = curr_y - move_amt
    end 

    -- Q2
    if curr_x < WIDTH/2 and curr_y < HEIGHT/2 then
        new_x = curr_x + move_amt
        new_y = curr_y + move_amt
    end 

    -- Q1
    if curr_x >= WIDTH/2 and curr_y < HEIGHT/2 then
        new_x = curr_x - move_amt
        new_y = curr_y + move_amt
    end 

    -- Q3
    if curr_x < WIDTH/2 and curr_y >= HEIGHT/2 then
        new_x = curr_x + move_amt
        new_y = curr_y - move_amt

    end 

    love.mouse.setPosition(new_x, new_y)
end 

function update_achievement(dt)
    animation.currentTime = animation.currentTime + dt
    if animation.currentTime >= animation.duration then
        animation.currentTime = animation.currentTime - animation.duration
    end
end 