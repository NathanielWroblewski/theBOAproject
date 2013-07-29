# Major Categories

categories = ['Sweep', 'Submission', 'Guard Pass', 'Reversal', '']

categories.each do |category|
  MajorCategory.create(name: category)
end

# Major Positions

positions       = ['Standing', 'Leglock', 'One Up, One Down', 'Guard', 'Half Guard', 'Side Control', 'Mount', 'Turtle', 'Back Control']

# Sub Positions

standing        = []
leglock         = ['One-Leg X-Guard', 'Knee Knot', '50/50']
one_up_one_down = ['De La Riva', 'X-Guard', 'Sitting Guard', 'One-Leg X-Guard', '50/50']
guard           = ['Closed Guard', 'Butterfly', 'Open Guard']
half_guard      = ['Traditional', 'Half Butterfly', 'Deep Half', 'Lockdown', 'Facing Legs', 'Z-Guard']
side_control    = ['Scarf Hold', 'Chest-to-Chest', 'Facing the Legs', 'Knee-on-Belly', 'North South']
mount           = ['High Mount', 'Low Mount', 'Neutral']
turtle          = ['Sprawl', 'Side Ride']
back_control    = ['Seatbelt', 'Double Unders', 'Judo Back Control', 'Crucifix']

sub_positions   = [standing, leglock, one_up_one_down, guard, half_guard, side_control, mount, turtle, back_control]

# Seed Major Positions

def neutral?(position)
  neutral_positions = ['Standing', 'Leglock']
  neutral_positions.include?(position)
end

positions.each do |position|
  if neutral?(position)
    Position.create(name: position)
  else
    Position.create(name: position, top: true)
    Position.create(name: position, top: false)
  end
end

# Seed Sub-Positions

pairs = positions.zip(sub_positions)

def associate_sub_positions_to_major_positions(major_position, sub_positions)
  Position.where(name: major_position).each do |position|
    sub_positions.each do |sub_position|
      position.sub_positions << SubPosition.create(name: sub_position)
    end
  end
end

pairs.each do |pair|
  associate_sub_positions_to_major_positions(pair[0], pair[1])
end

# Grips

sub_positions_with_grips = ['One-Leg X-Guard', 'De La Riva', 'X-Guard', 'Sitting Guard', 'Butterfly', 'Scarf Hold', 'Chest-to-Chest']

olxg      = ['Overhook', 'Underhook', 'Reaping']
dlr       = ['Same-side Grip on Far Arm', 'Same-side Grip on Near Arm', 'Both Sleeves', 'Cross-grip on Near Arm', 'Cross-grip on Far Arm']
x_guard   = ['No Grips', 'Near Arm', 'Far Arm']
sitting   = ['Near Arm Outside Lace', 'Near Arm Inside Lace', 'Far Arm Inside Lace']
butterfly = ['Double Underhooks', 'Over-Under', 'No Grips']
scarf     = ['Under Head', 'Under Arm']
side      = ['Head and Arm', 'Checking the Hip', 'Near Side', 'Far Side']

grips = [olxg, dlr, x_guard, sitting, butterfly, scarf, side]
pairs = sub_positions_with_grips.zip(grips)

# Seeding of grips

def associate_grips_to_sub_positions(sub_position, all_grips)
  SubPosition.where(name: sub_position).each do |position|
    all_grips.each do |grip|
      position.grips << Grip.create(name: grip)
    end
  end
end

pairs.each do |pair|
  associate_grips_to_sub_positions(pair[0], pair[1])
end

Position.where(name: 'Guard', top: false).each do |pos|
  pos.sub_positions.each do |sub_position|
    if sub_position.name == 'Closed Guard'
      ['Broken Down', 'Posturing', 'Postured, Same-side Sleeve, Cross-Lapel', 'Postured,   Both Sleeves', 'Knee Posted, Same-side Sleeve, Cross-Lapel', 'Knee Posted, Both   Sleeves'].each do |grip|
        sub_position.grips << Grip.create(name: grip)
      end
    end
  end
end

Position.where(name: 'Guard', top: true).each do |pos|
  pos.sub_positions.each do |sub_position|
    if sub_position.name == 'Closed Guard'
      sub_position.grips << Grip.create(name: 'Broken Down')
      sub_position.grips << Grip.create(name: 'Postured')
      sub_position.grips << Grip.create(name: 'Over-Under')
      sub_position.grips << Grip.create(name: 'Leg on Shoulder')
    end
  end
end

# First Video

video = InstructionalVideo.create(url: '71230093', title: 'Far Leg Calf Slicer')

Position.find_by_name_and_top('One Up, One Down', false).sub_positions.find_by_name('X-Guard').grips.find_by_name('No Grips').instructional_videos << video
MajorCategory.find_by_name('Submission').instructional_videos << video
