

config = {
    fieldOfView = 90,
    aspectRatio = platform.window:width() / platform.window:height()
}

matrices = {}
matrices.projection = {
    { config.aspectRatio * (1 / math.atan(config.fieldOfView / 2)), 0, 0 },
    { 0, 1 / math.atan(config.fieldOfView / 2), 0 },
    { 0, 0, 0 },
}
matrices.cross = function(a, b, size)
    result = {}
    for i = 1, table.getn(a), 1 do
        accumulator = 0
        for k = 1, table.getn(b), 1 do
            accumulator = accumulator + a[i] * b[k][i]
        end
        result[i] = accumulator
    end
    return result
end

meshes = {}
meshes.cube = {
    { 0, 0, 0, 0, 1, 0, 1, 1, 0 },
    { 0, 0, 0, 1, 1, 0, 1, 0, 0 },

    { 1, 0, 0, 1, 1, 0, 1, 1, 1 },
    { 1, 0, 0, 1, 1, 1, 1, 0, 1 },

    { 1, 0, 1, 1, 1, 1, 0, 1, 1 },
    { 1, 0, 1, 0, 1, 1, 0, 0, 1 },

    { 0, 0, 1, 0, 1, 1, 0, 1, 0 },
    { 0, 0, 1, 0, 1, 0, 0, 0, 0 },

    { 0, 1, 0, 0, 1, 1, 1, 1, 1 },
    { 0, 1, 0, 1, 1, 1, 1, 1, 0 },

    { 1, 0, 1, 0, 0, 1, 0, 0, 0 },
    { 1, 0, 1, 0, 0, 0, 1, 0, 0 },
}

function on.paint(gc)
    for i, v in ipairs(meshes.cube) do
    end
end
function on.activate()
    print(dump(matrices.cross({ 6, 2, 1 }, {
        { 1, 0, 0 },
        { 1, 6, 2 },
        { 0, 2, 0 }
    })))
end

function dump(o)
    if type(o) == 'table' then
        local s = '{ '
        for k, v in pairs(o) do
            if type(k) ~= 'number' then
                k = '"' .. k .. '"'
            end
            s = s .. '[' .. k .. '] = ' .. dump(v) .. ','
        end
        return s .. '} '
    else
        return tostring(o)
    end
end