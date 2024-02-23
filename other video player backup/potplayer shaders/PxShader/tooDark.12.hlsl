// $MinimumShaderProfile: ps_2_0
#define Screen 0.12

/* --- tooDark (dx9) small adjustment, ex: 0.12 --- */
/* v1.41 (2023-11) released by butterw under GPLv3
(1 texture, 3 arithmetic)
These parameters provide a small brightness increase to boost a clip that could maybe be brighter.
If clipping highlights isn't an issue, alternatives would be: brightenD.03
or for a brightness+contrast increase: exposure.04.
---

Apply when the picture is too dark.
Increases brightness without clipping (Black point and White point aren't changed).

Photoshop Screen Blend, brightness/contrast curve:
out = f(x, S: Screen) = -S*x*x + (1+S)*x = -S*x^2 +S*x +x
    with x, out: pixel.rgb in [0, 1.0]
    and Screen >=0
f(x:0)=0; f(0.5)=0.5; f(1)=1.

parameter Screen [-1, 1.0], 0: no effect.
>> Positive: (Screen Blend) increases brightness, increases constrast in shadows, ex: 0.24
    - Brightness increase is maximum at the mid-point (S/4).
    - Contrast = 1+S -2*S*x
    Contrast is maximum at the Black point (1+S) and decreases linearly with input level.
    Contrast:1 at the midpoint.

negative: (Multiply Blend) decreases brightness, increases contrast in highlights.

*/
sampler s0: register(s0);
#define Multiply -Screen //to ensure a positive user parameter.

float4 main(float2 tex: TEXCOORD0): COLOR {
    float4 c0 = tex2D(s0, tex);

    c0.rgb = lerp(c0, c0*c0, Multiply).rgb;
    return c0;
}