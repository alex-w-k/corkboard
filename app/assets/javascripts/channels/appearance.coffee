App.appearance = App.cable.subscriptions.create "AppearanceChannel",
  connected: ->
    @install()

  disconnected: ->
    @uninstall()

  rejected: ->
    @uninstall()

  received: (arr) ->
    $('.online-list').append("<option id=" + arr[0] + ">" + arr[1] + "</option>")

  away: ->
    @perform("away")
    $('#stuff').data("appearing-on", "offline")

  install: ->
    $(document).on "load.appearance", =>
      @received()

    $(document).on "click.appearance", buttonSelector, =>
      @away()
      false

    $(buttonSelector).show()

  uninstall: ->
    $(document).off(".appearance")
    $(buttonSelector).hide()

buttonSelector = "[data-behavior~=appear_away]"
