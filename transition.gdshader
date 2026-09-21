shader_type canvas_item;

uniform float radius : hint_range(0.0, 1.5) = 1.5;
uniform vec2 center = vec2(0.5, 0.5);
uniform float aspect = 1.0;

void fragment() {
	vec2 uv = UV - center;
	uv.x *= aspect;
	float dist = length(uv);
	float edge = smoothstep(radius - 0.02, radius, dist);
	COLOR = vec4(0.0, 0.0, 0.0, edge);
}