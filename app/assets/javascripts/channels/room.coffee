App.room = App.cable.subscriptions.create "RoomChannel",
  received: (data) ->
    $('#messages').append(data.message)

  speak: (message) ->
    @perform 'speak', message: message

$(document).on 'keypress', 'input', (event) ->
  if event.keyCode is 13
    App.room.speak(event.target.value)
    event.target.value = ""
