extends Node

var now_cat: String = "black"

var catTypes = {
	"black": {
		"idle": "black_idle",
		"jump": "black_jump",
		"fall": "black_jump",
		"stretch": "black_stretch",
		"walk": "black_walk"
	},
	"orange": {
		"idle": "orange_idle",
		"jump": "orange_jump",
		"fall": "orange_jump",
		"stretch": "orange_stretch",
		"walk": "orange_walk"
	},
	"skinned": {
		"idle": "skinned_idle",
		"jump": "skinned_jump",
		"fall": "skinned_jump",
		"stretch": "skinned_stretch",
		"walk": "skinned_walk"
	}
}
