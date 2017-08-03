App.appearance = App.cable.subscriptions.create "AppearanceChannel",
  connected: ->
    @install()
    # @appear()

  disconnected: ->
    @uninstall()

  rejected: ->
    @uninstall()

  received: (id) ->
    # var idString = String(id[0]:id[1])
    $('.online-list').append("<option>"+ id + "</option>")
    # $('.main').addClass("foo")
    # console.log [ids]

  # appear: ->
  #   @perform("appear", appearing_on: $(".main").data("appearing-on"))

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
