SCRUMORGANIZER.cable.story = ->
  obj = $('#projects-show')
  return unless obj.length > 0

  id = $('#project-boards').data('project-id')

  App.stories = App.cable.subscriptions.create { channel: "StoriesChannel", project_id: id },
    connected: ->
      # Called when the subscription is ready for use on the server
      console.log("connected")

    disconnected: ->
      # Called when the subscription has been terminated by the server
      console.log("disconnected")

    received: (data) ->
      # Called when there's incoming data on the websocket for this channel
      console.log("received")
      console.log(data)
      
      if data.action is 'create'
        @createStory(data)
      else if data.action is 'update'
        @updateStory(data)
      else
        @deleteStory(data)
      
    createStory: (data) ->
      #console.log(data)
      div = $("#board-#{data.board_id}")
      console.log(div)

      p = $("<p>")
      p.attr("id", "#story-#{data.story.id}")

      p.html(data.story.name)
      div.append(p)

    updateStory: (data) ->
      p = $("#story-#{data.story.id}-name")
      p.empty()

      p.append(data.story.name)

    deleteStory: (data) ->
      div = $("#story-#{data.story}")
      div.remove()

