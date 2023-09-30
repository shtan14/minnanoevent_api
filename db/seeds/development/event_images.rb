Event.all.each do |event|
  3.times do |i|
    event.event_images.create(
      event_image: "https://s3.ap-northeast-1.amazonaws.com/minnanoevent.com/demoeventimages/event#{event.id}-#{i + 1}.jpg"
    )
  end
end
