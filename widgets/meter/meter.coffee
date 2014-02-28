class Dashing.Meter extends Dashing.Widget

  @accessor 'value', Dashing.AnimatedValue
  @accessor 'bgColor', ->
    if @get('performance') == "good"
      "#96BF48"
    else if @get('performance') == "meh"
      "#ff9618"
    else if @get('performance') == "bad"
      "#C70015"
    else
      "#999"

  constructor: ->
    super
    @observe 'value', (value) ->
      $(@node).find(".meter").val(value).trigger('change')

  ready: ->
    meter = $(@node).find(".meter")
    $(@node).fadeOut().css('background-color', @get('bgColor')).fadeIn()
    meter.attr("data-bgcolor", meter.css("background-color"))
    meter.attr("data-fgcolor", meter.css("color"))
    meter.knob()

  onData: ->
    $(@node).fadeOut().css('background-color', @get('bgColor')).fadeIn()

