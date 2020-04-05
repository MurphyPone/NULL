-- Contains all the drawing methods
local right_align = 80 -- where the stat values are drawn TODO 

-- Draws the player at 0,0, duh
function draw_player()
    love.graphics.setColor(0, 0, 0)
    love.graphics.rectangle("fill", WIDTH/2, HEIGHT/2, 3, 3)
    love.graphics.setColor(255, 255, 255)
end 

-- Displays some frustrating stats
function draw_stats() 
    love.graphics.setColor(0, 0, 0)

    -- Score text boxes
    local str_score = string.format("Score:\t%.1d", score)
    local txt_score = love.graphics.newText(def_font, str_score)

    local str_score_highscore = string.format("High Score:\t%.1d", score_highscore)
    local txt_score_highscore = love.graphics.newText(def_font, str_score_highscore)

    -- Multiplier text boxes
    local str_mult = string.format("Multiplier:\t%.2f x", multiplier)
    local txt_mult = love.graphics.newText(def_font, str_mult)

    local str_mult_highscore = string.format("Best Multiplier:\t%.1f x", multiplier_highscore)
    local txt_mult_highscore = love.graphics.newText(def_font, str_mult_highscore)

    local str_mult_amt = string.format("Multiplier Amt:\t%.1f x", multiplier_amt)
    local txt_mult_amt = love.graphics.newText(def_font, str_mult_amt)


    love.graphics.draw(txt_score, 10, 10) 
    love.graphics.draw(txt_score_highscore, 10, 28) 

    love.graphics.draw(txt_mult, 10, 46) 
    love.graphics.draw(txt_mult_highscore, 10, 64) 
    love.graphics.draw(txt_mult_amt, 10, 82) 

    love.graphics.print(checkpoint, 10, HEIGHT-18) 

    love.graphics.setColor(255, 255, 255)
end