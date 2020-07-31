(
{
	var x = SinOsc.ar(MouseX.kr(1, 100));
	SinOsc.ar(440 * x + 0, 0, 0.1)
}.play
)

(
{
	var x = SinOsc.ar(MouseY.kr(1, 100));
	SinOsc.ar(220 * x + 0, 0, 0.1)
}.play
)
