module InvisibleBarrier

using ..Ahorn, Maple

placements = Dict{String, Ahorn.EntityPlacement}(
    "Invisible Barrier" => Ahorn.EntityPlacement(
        Maple.Barrier,
        "rectangle"
    ),
)

function minimumSize(entity::Maple.Entity)
    if entity.name == "invisibleBarrier"
        return true, 8, 8
    end
end

function resizable(entity::Maple.Entity)
    if entity.name == "invisibleBarrier"
        return true, true, true
    end
end

function selection(entity::Maple.Entity)
    if entity.name == "invisibleBarrier"
        x, y = Ahorn.entityTranslation(entity)

        width = Int(get(entity.data, "width", 8))
        height = Int(get(entity.data, "height", 8))

        return true, Ahorn.Rectangle(x, y, width, height)
    end
end

function render(ctx::Ahorn.Cairo.CairoContext, entity::Maple.Entity, room::Maple.Room)
    if entity.name == "invisibleBarrier"
        width = Int(get(entity.data, "width", 32))
        height = Int(get(entity.data, "height", 32))

        Ahorn.drawRectangle(ctx, 0, 0, width, height, (0.4, 0.4, 0.4, 0.8), (0.0, 0.0, 0.0, 0.0))

        return true
    end

    return false
end

end