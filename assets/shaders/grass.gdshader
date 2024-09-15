shader_type canvas_item;

uniform vec3 replacement_color:source_color;

void vertex() {
	if(VERTEX.y < 0.0){
		VERTEX += vec2(sin(TIME*0.5) * 100.0, 0.0);
	}
}

void fragment() {
	vec3 color_wo_green = COLOR.rgb * vec3(1,0,1);
	float amount_of_rb = length(color_wo_green);
	float mask_rb = step(1.0, amount_of_rb);
	vec3 retained_color = COLOR.rgb * mask_rb;
	float mask_g = (1.0 - mask_rb) * COLOR.g;
	vec3 masked_replacement = replacement_color * mask_g;
	vec3 final_color = masked_replacement + retained_color;
	
	COLOR.rgb = final_color;
}
