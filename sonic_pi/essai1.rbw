use_debug false
use_bpm 80

# drums

live_loop :kick do
  sample :bd_klub, amp: 1.5 if (spread  4, 4).tick
  sleep 0.5
end

live_loop :snare do
  sync :kick
  with_fx :reverb, mix: 0.3, room: 0.8 do
    sample :drum_snare_soft, amp: 1 if (spread 1, 4).tick
  end
  sleep 0.5
end

live_loop :noise_hats do
  sync :kick
  with_fx :slicer, mix: 1, phase: 0.25, pulse_width: 0.2 do
    with_fx :hpf, cutoff: 130 do
      with_synth :noise do
        play :d1, decay: 1, amp: 3 if (spread 1, 8).tick
      end
    end
  end
  sleep 1
end


# bass

bassline_rhythm = (ring 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 05, 0, 1, 0, 0.5, 0)
bassline_notes = (stretch [:d2] * 12 + [:f2, :f2, :a2, :f2], 8)
live_loop :bassline do
  sync :kick
  with_synth :fm do
    play bassline_notes.look, amp: 3, attack: 0.03, divisor: 1, depht: 2.5
  end
  sleep 0.5
end
