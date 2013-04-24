(($) ->
  root = if window? then window else global
  root.Sidewinder = class Sidewinder
    constructor: () ->

    init: (options, el) ->
      @$el = $(el)
      @options = $.extend {}, $.fn.sidewinder.defaults, options

      @addClass()
      if @options.start is 'collapsed' then @$el.find('.sw-l2').hide()
      @$el.on 'click.sidewinder', { _opt: @options, _wind: @wind, _unwind: @unwind }, @process

    addClass: () ->
      return unless @$el.is(':visible')
      @$el.addClass 'sidewinder'
      @$el.children('li')
        .addClass('sw-l1')
        .find('ul')
        .addClass('sw-l2')

    wind: (item) ->
      if item?
        $(item).removeClass('unwound').find('.sw-l2').slideUp()
      else
        @$el.find('.sw-l1').removeClass('unwound').find('.sw-l2').slideUp()

    unwind: (item) ->
      return unless item?
      $(item).addClass('unwound').find('.sw-l2').slideDown()


    process: (e) ->
      $target = $(e.target)
      $parent = $target.closest('li')
      { _opt, _wind, _unwind } = e.data


      if $parent.hasClass('sw-l1')
        # if parent is already unwound, wind it down
        if $parent.hasClass('unwound')
          _wind $target.closest('.sw-l1')
        else
          # if not dummy, mark it active, and deactivate siblings
          if not $parent.hasClass('dummy')
            $siblings = $parent.addClass('active')
              .siblings('.active')
              .removeClass('active')

          if $parent.has('.sw-l2').length is 0
            $siblings.find('.active').removeClass('active')
          else _unwind $parent

          if _opt.open is 'selected'
            $parent.siblings('.sw-l1').each (idx, $item) ->
              _wind $item

      else if $parent.parent('ul').hasClass('sw-l2')
        $grand = $parent.closest('.sw-l1')
        $grand.addClass('active')
          .siblings()
          .removeClass('active')
          .addBack()
          .find('.active')
          .removeClass('active')
        $parent.addClass('active')

      return



  $.fn.sidewinder = (options) ->
    sidewinder = new Sidewinder()
    sidewinder.init options, @
    return @

  $.fn.sidewinder.defaults = {
    # start = [ collapsed|expanded ], if menu should start collapsed
    start: 'collapsed'
    # open = [ all|selected ], if all menu-items can be kept open together
    open: 'all'
    # dummy = bool, if L1 menu-entries for the whole menu are dummies
    dummyL1: false
  }

) jQuery
