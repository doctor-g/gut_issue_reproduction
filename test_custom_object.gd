extends GutTest

const _REDUNDANT_AWAIT := "debug/gdscript/warnings/redundant_await"

var _original_redundant_await = ProjectSettings.get_setting(_REDUNDANT_AWAIT)

func before_all():
	# This is a way to get around the problem documented as issue 482 in GUT.
	# See https://github.com/bitwes/Gut/issues/482#issuecomment-1543223550
	set_double_strategy(DOUBLE_STRATEGY.SCRIPT_ONLY)
	
	# Similarly, we can turn off the redundant await warning during this run
	# and then set it back to whatever it was afterward.
	# See https://github.com/bitwes/Gut/issues/482#issuecomment-1543265634
	ProjectSettings.set_setting(_REDUNDANT_AWAIT, 0)
	
	
func after_all():
	ProjectSettings.set_setting(_REDUNDANT_AWAIT, _original_redundant_await)


func test_bar():
	var obj :CustomObject = double(CustomObject).new()
	assert_not_null(obj)
