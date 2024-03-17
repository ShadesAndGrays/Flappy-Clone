shader_type canvas_item;

uniform sampler2D SCREEN_TEXTURE: hint_screen_texture,filter_linear_mipmap;
void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	vec2 ps = SCREEN_PIXEL_SIZE;
	vec4 col0 = texture(SCREEN_TEXTURE, SCREEN_UV + vec2(-ps.x, 0));
	vec4 col1 = texture(SCREEN_TEXTURE, SCREEN_UV + vec2(ps.x, 0));
	vec4 col2 = texture(SCREEN_TEXTURE, SCREEN_UV + vec2(0, -ps.y));
	vec4 col3 = texture(SCREEN_TEXTURE, SCREEN_UV + vec2(0, ps.y));
	COLOR = 0.3 * (col0 + col1 + col2 + col3);
	// Called for every pixel the material is visible on.
}

void light() {
	// Called for every pixel for every light affecting the CanvasItem.
}
