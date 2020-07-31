# Steve Reich's Piano Phase

# fadein = (ramp *range(0, 1, 0.01))
# fadein = (ring 1)
# kick_cutoffs = range(50, 80, 0.5).mirror
# live_loop :kick do
#   sync :slow
#   sample :bd_tek, amp: fadein.look * 1, cutoff: kick_cutoffs.look
#   sleep 0.25
# end

notes = (ring :E4, :Fs4, :B4, :Cs5, :D5, :Fs4, :E4, :Cs5, :B4, :Fs4, :D5, :Cs5)

live_loop :slow do
  use_synth :beep
  play notes.tick attack: 0.05, sustain: 0.15, release: 0.15, pan: -1
  sleep 0.3
end

live_loop :faster do
  use_synth :beep
  play notes.tick attack: 0.05, sustain: 0.15, release: 0.15, pan: 1
  sleep 0.299
end