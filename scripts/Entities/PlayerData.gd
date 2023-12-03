class PlayerData:
	var nutrition: int
	var temperature: int
	var umidity: int

	var last_hydration: int
	var last_temperature_change: int
	
	var save_datetime: int
	
	func _init(
		_nutrition: int,
		_temperature: int,
		_umidity: int,
		_last_hydration: int,
		_last_temperature_change: int,
		_save_datetime: int
	):
		nutrition = _nutrition
		temperature = _temperature
		umidity = _umidity
		last_hydration = _last_hydration
		last_temperature_change = _last_temperature_change
		save_datetime = _save_datetime
