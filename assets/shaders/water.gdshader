shader_type canvas_item;

uniform vec2 tiled_factor = vec2(5.0, 5.0);
uniform float aspect_ratio = 0.5;
uniform vec2 amplitude = vec2(0.05, 0.1);
uniform vec2 offset_factor = vec2(2.0, 2.0);
uniform vec2 time_scale = vec2(1.0, 1.0);

void fragment() {
	vec2 tiled_uvs = UV * tiled_factor;
	vec2 waves_uv;
	waves_uv.x = sin(TIME * time_scale.x + atan(tiled_uvs.y + tiled_uvs.x) * offset_factor.x);
	waves_uv.y = cos(TIME * time_scale.y + sin(tiled_uvs.y + tiled_uvs.x) * offset_factor.y);

	tiled_uvs.y *= aspect_ratio;
	//COLOR = vec4(tiled_uvs,0.0,1.0);
	//COLOR = vec4(waves_uv, 0.0, 1.0);
	COLOR = texture(TEXTURE, tiled_uvs + waves_uv * amplitude);
}
