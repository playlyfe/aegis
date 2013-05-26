(function($) {
  var Sidewinder, root;

  root = typeof window !== "undefined" && window !== null ? window : global;
  root.Sidewinder = Sidewinder = (function() {
    function Sidewinder() {}

    Sidewinder.prototype.init = function(options, el) {
      this.$el = $(el);
      this.options = $.extend({}, $.fn.sidewinder.defaults, options);
      this.addClass();
      if (this.options.start === 'collapsed') {
        this.$el.find('.sw-l2').hide();
      }
      return this.$el.on('click.sidewinder', {
        _opt: this.options,
        _wind: this.wind,
        _unwind: this.unwind
      }, this.process);
    };

    Sidewinder.prototype.addClass = function() {
      if (!this.$el.is(':visible')) {
        return;
      }
      this.$el.addClass('sidewinder');
      return this.$el.children('li').addClass('sw-l1').find('ul').addClass('sw-l2');
    };

    Sidewinder.prototype.wind = function(item) {
      if (item != null) {
        return $(item).removeClass('unwound').find('.sw-l2').slideUp();
      } else {
        return this.$el.find('.sw-l1').removeClass('unwound').find('.sw-l2').slideUp();
      }
    };

    Sidewinder.prototype.unwind = function(item) {
      if (item == null) {
        return;
      }
      return $(item).addClass('unwound').find('.sw-l2').slideDown();
    };

    Sidewinder.prototype.process = function(e) {
      var $grand, $parent, $siblings, $target, _opt, _ref, _unwind, _wind;

      $target = $(e.target);
      $parent = $target.closest('li');
      _ref = e.data, _opt = _ref._opt, _wind = _ref._wind, _unwind = _ref._unwind;
      if ($parent.hasClass('sw-l1')) {
        if ($parent.hasClass('unwound')) {
          _wind($target.closest('.sw-l1'));
        } else {
          if (!$parent.hasClass('dummy')) {
            $siblings = $parent.addClass('active').siblings('.active').removeClass('active');
          }
          if ($parent.has('.sw-l2').length === 0) {
            $siblings.find('.active').removeClass('active');
          } else {
            _unwind($parent);
          }
          if (_opt.open === 'selected') {
            $parent.siblings('.sw-l1').each(function(idx, $item) {
              return _wind($item);
            });
          }
        }
      } else if ($parent.parent('ul').hasClass('sw-l2')) {
        $grand = $parent.closest('.sw-l1');
        $grand.addClass('active').siblings().removeClass('active').addBack().find('.active').removeClass('active');
        $parent.addClass('active');
      }
    };

    return Sidewinder;

  })();
  $.fn.sidewinder = function(options) {
    var sidewinder;

    sidewinder = new Sidewinder();
    sidewinder.init(options, this);
    return this;
  };
  return $.fn.sidewinder.defaults = {
    start: 'collapsed',
    open: 'all',
    dummyL1: false
  };
})(jQuery);
