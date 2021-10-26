[[group(0), binding(0)]] var myTexture: texture_2d<f32>;
[[group(0), binding(1)]] var mySampler: sampler;

struct VertexOutput {
  [[builtin(position)]] Position : vec4<f32>;
  [[location(0)]] fragUV : vec2<f32>;
};
/*
[[stage(fragment)]]
fn main(data: VertexOutput) -> [[location(0)]] vec4<f32> {
    return textureSample(myTexture, mySampler, data.fragUV);
}
*/

[[stage(fragment)]]
fn main(data: VertexOutput) -> [[location(0)]] vec4<f32> {
    var d: vec2<f32> = vec2<f32>(textureDimensions(myTexture, 0));
    return vec4<f32>(textureLoad(myTexture, vec2<i32>(data.fragUV*d), 0).rgb, 1.);
}

/*
[[stage(fragment)]]
fn main([[location(0)]] fragUV: vec2<f32>) -> [[location(0)]] vec4<f32> {
    return vec4<f32>(fragUV.x, 0.0, 0.0, 1.0);
}
*/