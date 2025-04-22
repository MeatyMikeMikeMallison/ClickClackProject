//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
	vec4 sampled_color = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	
	sampled_color.rg += 0.3;
	sampled_color.b -= 0.2;
	
	gl_FragColor = sampled_color;
	
	/*sampled_color.x
	sampled_color.y
	sampled_color.z
	sampled_color.w*/
}
