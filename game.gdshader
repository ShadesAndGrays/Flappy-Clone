shader_type canvas_item;
uniform sampler2D SCREEN_TEXTURE: hint_screen_texture,filter_linear_mipmap;


void fragment() {
	vec4 col = vec4(0,0,0,1);
	float center = distance(UV,vec2(0.5));
	col.a = smoothstep(col.a,0,1.2-center);
	COLOR = mix(col,texture(SCREEN_TEXTURE,SCREEN_UV),0.1);
	// Called for every pixel the material is visible on.
}

void light() {
	// Called for every pixel for every light affecting the CanvasItem.
}
