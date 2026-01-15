extends Node2D

var nav_grid: AStarGrid2D = AStarGrid2D.new()
@onready var terrain: TileMapLayer = $terrain

const CITY_SOURCE = 0 # index of the tile set
const TILE_SIZE = 16 # pixels per side of a tile

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_init_nav_grid()

func _init_nav_grid() -> void:
	# current color area is 71 * 40, but we want space below the screen
	nav_grid.region = Rect2i(0, 0, 80, 80)
	nav_grid.cell_size = Vector2i(TILE_SIZE, TILE_SIZE)

	for cell in terrain.get_used_cells():
		var tile_data = terrain.get_cell_tile_data(cell)
		var blocking = tile_data.get_custom_data("blocking")
		if blocking:
			nav_grid.set_point_solid(cell)
		else:
			var cost = tile_data.get_custom_data("cost")
			if cost != 1.0:
				nav_grid.set_point_weight_scale(cell, cost)

	nav_grid.update()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
