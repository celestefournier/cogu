class_name PlayerData

var nutrition: int
var temperature: int
var umidity: int

var last_temperature_change: float
var last_hydration: float

var save_datetime: float

func _init(
	_nutrition: int,
	_temperature: int,
	_umidity: int,
	_last_temperature_change: float,
	_last_hydration: float,
	_save_datetime: float
):
	nutrition = _nutrition
	temperature = _temperature
	umidity = _umidity
	last_temperature_change = _last_temperature_change
	last_hydration = _last_hydration
	save_datetime = _save_datetime
