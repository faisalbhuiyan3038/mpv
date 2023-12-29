#version 330

uniform sampler2D tex;
uniform vec2 texsize;

vec4 sharpen(sampler2D tex, vec2 texsize, vec2 coord) {
    vec4 c = texture(tex, coord);
    vec4 bl = texture(tex, coord + vec2(-1, -1) / texsize);
    vec4 tl = texture(tex, coord + vec2(-1, 1) / texsize);
    vec4 tr = texture(tex, coord + vec2(1, 1) / texsize);
    vec4 br = texture(tex, coord + vec2(1, -1) / texsize);
    return (c * 5.0 - (bl + tl + tr + br)) * 0.2;
}

void main() {
    gl_FragColor = sharpen(tex, texsize, gl_TexCoord[0].xy);
}
