//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
	
	vec4 sampled_color = texture2D( gm_BaseTexture, v_vTexcoord );
	
	sampled_color.rgb *= 0.5;
	
	gl_FragColor = sampled_color;
	
	/*sampled_color.x
	sampled_color.y
	sampled_color.z
	sampled_color.w*/
}
