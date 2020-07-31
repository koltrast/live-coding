# riders on the storm

use_bpm 90

live_loop :bassline do
  use_synth :fm
  # stop # remove me if you want bassline
  play_pattern_timed [:e2, :b2, :g2, :b2, :e2, :a2, :cs3, :a2], [0.5],
    attack: 0.01, sustain: 0.5, release: 0.2
  sleep 0.05
end

puts 'Introduction'

1.times do
  sync :bassline
  play_chord [:e4, :e3], sustain: 3.5, release: 3
  sleep 7
  play_pattern_timed [:e5, :a5, :b5, :e6], [0.25]
  play :b5, sustain: 2, release: 4.5
  sleep 6.5
  play_pattern_timed [:g5, :a5, :g5, :fs5, :e5, :fs5], [0.25]
  play_pattern_timed [:g5, :fs5], [0.5]
  sleep 0.5
  play :d5
  sleep 1
  play :d5
  sleep 0.125
  play :e5
  sleep 5.225
  play_pattern_timed [
    :b6, :g6, :a6, :fs6, :g6, :e6, :fs6, :d6, :e6, :cs6, :d6, :b5, :cs6, :a5,
    :b5, :g5, :a5, :fs5, :g5, :e5, :fs5, :d5, :e5, :cs5, :d5, :b4, :cs5, :a4,
    :b4, :g4, :a4, :fs4, :g4, :e4, :fs4, :d4, :e4, :cs4, :d4, :b3, :cs4, :a3,
  :b3, :g3], [0.25]
  play :a3, sustain: 0.5
  sleep 0.5
  play_chord [:d4, :a3, :fs3], sustain: 0.6, amp: 1.5
  sleep 0.7
  play_chord [:e4, :b3 , :g3], sustain: 0.6, amp: 1.5
  sleep 1.5
end

3.times do
  play_chord [:d4, :a3, :fs3]
  sleep 1
end