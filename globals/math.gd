extends Node

# cant go negative
#                              Vector2(0/1, 1-x)
func vector2_one_unsigned() -> Vector2:
	# 0 or 1
	var r := randi() % 2
	return(Vector2(r, 1-r))

# cant go diagonal
#                     Vector2(-1/1, -x)
func vector2_one() -> Vector2:
	# -1 or 1
	var r := randi() % 2 * 2 - 1

	return(Vector2(r, -r))

func vector2_one() -> Vector2:
	# -1 or 1
	var r := randi() % 2 * 2 - 1
	# 0 or 1
	var z := randi() % 2

	return(Vector2(z*r, (1-z)*r))

func rand_bool() -> bool:
	return bool(randi() % 2)

func vector2_one_diagonal() -> Vector2:
	var rx := randi() % 2 * 2 - 1
	var ry := randi() % 2 * 2 - 1
	return(Vector2(rx, ry))

func vector2_cube(size: float) -> Vector2:
	return Vector2(size, size)

func closest_float(target: float, num1: float, num2: float) -> float:
	if abs(target - num1) <= abs(target - num2):
		return num1
	else:
		return num2

func randi_around(i: int) -> int:
	return randi_range(-i, i)

func randf_around(i: float) -> float:
	return randf_range(-i, i)

func modulate_nodes(nodes: Array[Node], modulate: Color) -> void:
	for n in nodes.filter(func(n): return "modulate" in n):
		n.modulate = modulate

func pv2_array_average(axis: 0, array: PackedVector2Array) -> float:
	var sum := 0.0
	
	for v in array:
		sum += v

	return (sum)/(array.size())

# axis 0 = x
#      1 = y
func pv2_array_average_xy(axis: 0, array: PackedVector2Array) -> float:
	var sum := 0.0
	
	match axis:
		0:
			for v in array:
				sum += v.x
		1:
			for v in array:
				sum += v.y

	return (sum)/(array.size())

func pv2_array_max(array: PackedVector2Array) -> Vector2:
	array.sort()
	return array[-1]

func pv2_array_min(array: PackedVector2Array) -> Vector2:
	array.sort()
	return array[-1]

func array_average(array: Array) -> float:
	var sum := 0.0

	for n in array:
		sum += n

	return (sum)/(array.size())

# axis 0 = x
#      1 = y
func array_average_xy(axis: 0, array: PackedVector2Array) -> float:
	var sum := 0.0
	
	match axis:
		0:
			for v in array:
				sum += v.x
		1:
			for v in array:
				sum += v.y

	return (sum)/(array.size())

func format_seconds(sec: float) -> String:
	var h := int(sec) / 60
	var m := int(sec) % 60

	return str(h,":",m)
