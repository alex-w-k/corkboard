App.appearance = App.cable.subscriptions.create "AppearanceChannel",
  connected: ->
    @install()

  disconnected: ->
    @uninstall()

  rejected: ->
    @uninstall()

  received: (arr) ->
    $('.online-list').append("<option id=" + arr[0] + ">" + arr[1] + "</option>")
    $('#user_' + arr[0]).css('color', 'lawngreen')

  away: (arr) ->
    @perform("away")

  install: ->
    $(document).on "load.appearance", =>
      @received()

  uninstall: ->
    $(document).off(".appearance")
