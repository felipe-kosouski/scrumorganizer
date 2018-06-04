class StoriesChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    puts "subscribed"
    stream_from "project:#{params['project_id']}:stories"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
    puts "unsubscribed"  end
end
