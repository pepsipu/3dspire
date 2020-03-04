fieldOfView = 90
aspectRatio = platform.window:width()/platform.window:height()
sideScalar = 1/math.atan(fieldOfView/0)

Vec3 = {x = 0, y = 0, z = 0}
function Vec3:new(vector3)
    vector3.parent = self
    return vector3
end

Vec2 = {x = 0, y = 0}
function Vec2:new(vector2)
    vector2.parent = self
    return vector2
end

mapping = {}
--- maps 3d points onto 2d plane
mapping.projection = function(x, y, z)
    return Vec2{x = (aspectRatio * sideScalar * x) / z, y = (aspectRatio * y) / z}
end

mapping.drawTriangle = function(triangle, gc)
    gc:drawLine(triangle[1].x, triangle[1].y, triangle[2].x, triangle[2].y)
    gc:drawLine(triangle[2].x, triangle[2].y, triangle[3].x, triangle[3].y)
    gc:drawLine(triangle[3].x, triangle[3].y, triangle[1].x, triangle[1].y)
end

function on.paint(gc)
    gc:drawString("test", 10, 10)
    mapping.drawTriangle({
        {x = 0, y = 0},
        {x = 10, y = 2},
        {x = 17, y = 19},
    }, gc)
end

function on.activate()
end