use_bpm 100

2.times do
  3.times do
    play :b3
    sleep 0.5
    play :b3
    sleep 0.5
    play :d4
    sleep 0.5
    play :d4
    sleep 1
    # play :g3
    # sleep 0.5
    # play :fs4
    # sleep 0.5
    # play :g3
    # sleep 0.5
    # play :d4
    # sleep 1
  end

  play :g4
  sleep 1
end