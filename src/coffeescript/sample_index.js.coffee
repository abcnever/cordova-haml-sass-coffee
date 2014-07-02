window.app =

  # Application Constructor
  initialize: ->
    @bindEvents()
    return


  # Bind Event Listeners
  #
  # Bind any events that are required on startup. Common events are:
  # 'load', 'deviceready', 'offline', and 'online'.
  bindEvents: ->
    document.addEventListener "deviceready", @onDeviceReady, false
    return


  # deviceready Event Handler
  #
  # The scope of 'this' is the event. In order to call the 'receivedEvent'
  # function, we must explicitly call 'app.receivedEvent(...);'
  onDeviceReady: ->
    app.receivedEvent "deviceready"
    return


  # Update DOM on a Received Event
  receivedEvent: (id) ->
    parentElement = document.getElementById(id)
    listeningElement = parentElement.querySelector(".listening")
    receivedElement = parentElement.querySelector(".received")
    listeningElement.setAttribute "style", "display:none;"
    receivedElement.setAttribute "style", "display:block;"
    console.log "Received Event: " + id
    return
