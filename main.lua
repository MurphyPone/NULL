function love.load()
    animation = new_animation(love.graphics.newImage("achievement.png"), 654, 74, 2.5)
end
 
function love.update(dt)
    animation.currentTime = animation.currentTime + dt
    if animation.currentTime >= animation.duration then
        animation.currentTime = animation.currentTime - animation.duration
    end
end
 
function love.draw()
    love.graphics.setBackgroundColor(255,255,255)
    local spriteNum = math.floor(animation.currentTime / animation.duration * #animation.quads) + 1 
    love.graphics.draw(animation.spriteSheet, animation.quads[spriteNum])
end
 
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
