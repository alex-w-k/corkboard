App.appearance = App.cable.subscriptions.create "AppearanceChannel",
  connected: ->
    @install()
    @appear()

  disconnected: ->
    @uninstall()

  rejected: ->
    @uninstall()

  received: (data) ->
    console.log data

  appear: ->
    @perform("appear", appearing_on: $(".main").data("appearing-on"))

  away: ->
    @perform("away")
    $('#stuff').data("appearing-on", "offline")

  install: ->
    $(document).on "load.appearance", =>
      @appear()

    $(document).on "click.appearance", buttonSelector, =>
      @away()
      false

    $(buttonSelector).show()

  uninstall: ->
    $(document).off(".appearance")
    $(buttonSelector).hide()

buttonSelector = "[data-behavior~=appear_away]"
