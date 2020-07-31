## Unknown Radigue Transmission
## Coded by Dr Colt Flakes


##########################

load_samples [:ambi_drone, :ambi_haunted_hum, :ambi_lunar_land]
$global_clock = 0
use_bpm 60
set_volume! 5
set_sched_ahead_time! 2
SEED = Time.now.usec #get a different run every time
puts "seed : #{SEED}"
use_random_seed SEED


################ FUNCTIONS ################

define :stopwatch do |int, max, fade|
  ## interval in seconds
  ## max in minutes, fade in seconds
  count = 0
  set_mixer_control! amp: 1, amp_slide: 0.1
  with_bpm 60 do
    ctrl = true
    while count / 60.0 <= max
      if count % int == 0
        puts "Time: #{count / 60.0} Minutes"
      end
      count += 1
      sleep 1
      $global_clock = count / 60.0
      if count >= (max*60) - fade && ctrl == true
        set_mixer_control! amp: 0.01, amp_slide: fade
        puts "Stopping - #{fade} sec fadeout"
        ctrl = false # stops this block from running more than once
      end
    end
  end
end

define :autocue do |id, time|
  # send a cue after a specified time in decimal minutes, id must be a key
  # call in the loop you're syncing to
  return cue id if $global_clock >= time
end

define :autostop do |time|
  # same as :autocue but for stopping - call in the loop you want to stop
  return stop if $global_clock >= time
end

define :mk_rand_scale do |scale, len = 8|
  # random scale that may contain the same note more than once
  rand_s = []
  len.times do
    rand_s << scale.choose
  end
  return rand_s.ring
end


#############  CLOCK  #####################

##| in_thread do
##|   stopwatch(30, max_t, max_t*60*0.1)
##| end

############# BASS ########################

live_loop :pulsar, auto_cue: false do
  
  use_synth :growl
  autostop(rrand max_t*0.75, max_t)
  puts "Pulsar"
  notes = (knit :c3, 2, :ds3, 1, :c3, 1)
  
  with_fx :reverb, mix: 0.3, room: 0.3, amp: 1 do
    notes.size.times do
      cut = range(55, 90, step: 5).mirror.ring.tick(:cut)     # filter sweeps up & down
      play notes.tick, amp: 0.25, attack: 1.125,
        sustain: 1.25, release: 3, cutoff: cut, res: 0.2
      sleep 8
    end
  end
  if one_in 3 then sleep [8, 16, 24].choose end
end