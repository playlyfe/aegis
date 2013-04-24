(function() {
  var root;

  root = typeof window !== "undefined" && window !== null ? window : global;

  describe('chainability', function() {
    return describe('$("ul").sidewinder()', function() {
      return it('should return the element so that other methods could be chained to it', function() {
        var $el;

        $el = $('<ul></ul>');
        return expect($el.sidewinder()).to.match($el);
      });
    });
  });

  describe('options', function() {
    describe('$.fn.sidewinder.defaults', function() {
      return it('should contain the default options', function() {
        return expect($.fn.sidewinder.defaults).to.eql({
          start: 'collapsed',
          open: 'all',
          dummyL1: false
        });
      });
    });
    describe('passing all options while init', function() {
      return it('should override the defaults', function() {
        var sidewinder;

        sidewinder = new root.Sidewinder();
        sidewinder.init({
          start: 'expanded',
          open: 'selected',
          dummyL1: true
        });
        return expect(sidewinder.options).to.eql({
          start: 'expanded',
          open: 'selected',
          dummyL1: true
        });
      });
    });
    return describe('passing some options while init', function() {
      return it('should override the supplied arguments, but keep the rest intact', function() {
        var sidewinder;

        sidewinder = new root.Sidewinder();
        sidewinder.init({
          open: 'selected'
        });
        return expect(sidewinder.options).to.eql({
          start: 'collapsed',
          open: 'selected',
          dummyL1: false
        });
      });
    });
  });

  describe('init', function() {
    describe('when the class is initialized independently', function() {
      return it('should have no attached element', function() {
        var sidewinder;

        sidewinder = new root.Sidewinder();
        sidewinder.init();
        return expect(sidewinder.el).to.be.undefined;
      });
    });
    return describe('when applied to an element', function() {
      it('should not apply on hidden elements', function() {
        var $el;

        $el = $('<ul style="display:none"></ul>"').sidewinder();
        return expect($el).not.to.have["class"]('sidewinder');
      });
      return it('should add a sidewinder class to a visible element', function() {
        var $el;

        $el = $('<ul></ul>');
        $('#testing').append($el);
        expect($el.sidewinder()).to.have["class"]('sidewinder');
        return $el.remove();
      });
    });
  });

  describe('setup', function() {
    return describe('building the DOM', function() {
      beforeEach(function() {
        this.$el = $('<ul>\n  <li>\n    <a>Game <span class=\'arrow\'></span></a>\n  </li>\n  <li>\n    <a>of <span class=\'arrow\'></span></a>\n    <ul>\n      <li><a>wait</a></li>\n      <li><a>for</a></li>\n      <li>it</li>\n    </ul>\n  </li>\n  <li><a>Thrones <span class=\'arrow\'></span></a>\n    <ul>\n      <li><a>Self</a></li>\n      <li><a>High</a></li>\n      <li><a>Five</a></li>\n    </ul>\n  </li>\n  <li>Winter is coming</li>\n  <li class=\'dummy\'>My Sons\n    <ul>\n      <li><a>Rob</a></li>\n      <li><a>Jon</a></li>\n      <li><a>Bran</a></li>\n    </ul>\n  </li>\n</ul>');
        return $('#testing').append(this.$el);
      });
      afterEach(function() {
        return this.$el.remove();
      });
      it('should add sw-l1 class to L1 items', function() {
        var count;

        this.$el.sidewinder();
        count = this.$el.children('.sw-l1').length;
        return expect(count).to.equal(5);
      });
      it('should add a sw-l2 to the sub-menu root', function() {
        var sub;

        this.$el.sidewinder();
        sub = this.$el.children('.sw-l1').children('ul');
        return expect(sub).to.have["class"]('sw-l2');
      });
      it('should collapse all L1 items if start option "collapsed"', function() {
        this.$el.sidewinder();
        return expect(this.$el.find('.sw-l2')).to.be.hidden;
      });
      return it('should show all L1 items if start option "expanded"', function() {
        this.$el.sidewinder({
          start: 'expanded'
        });
        return expect(this.$el.find('.sw-l2')).to.be.visible;
      });
    });
  });

  describe('mechanics', function() {
    beforeEach(function() {
      this.$el = $('<ul>\n  <li>\n    <a>Game <span class=\'arrow\'></span></a>\n  </li>\n  <li>\n    <a>of <span class=\'arrow\'></span></a>\n    <ul>\n      <li><a>wait</a></li>\n      <li><a>for</a></li>\n      <li>it</li>\n    </ul>\n  </li>\n  <li><a>Thrones <span class=\'arrow\'></span></a>\n    <ul>\n      <li><a>Self</a></li>\n      <li><a>High</a></li>\n      <li><a>Five</a></li>\n    </ul>\n  </li>\n  <li>Winter is coming</li>\n  <li class=\'dummy\'>My Sons\n    <ul>\n      <li><a>Rob</a></li>\n      <li><a>Jon</a></li>\n      <li><a>Bran</a></li>\n    </ul>\n  </li>\n</ul>');
      return $('#testing').append(this.$el);
    });
    afterEach(function() {});
    describe('L1 items', function() {
      it('should mark the clicked L1 item as "unwound"', function() {
        var $elem;

        $elem = this.$el.sidewinder().children('.sw-l1').eq(1).click();
        return expect($elem).to.have["class"]('unwound');
      });
      it('should mark the clicked L1 item as "active" if it is not "dummy"', function() {
        var $elem;

        $elem = this.$el.sidewinder().children('.sw-l1').eq(1).click();
        return expect($elem).to.have["class"]('active');
      });
      it('should not remove "unwound" class from other L1 items if open: "all"', function() {
        var $elem;

        $elem = this.$el.sidewinder({
          open: 'all'
        }).children('.sw-l1').eq(1).click();
        $elem.next().click();
        return expect($elem).to.have["class"]('unwound');
      });
      it('should remove "unwound" class from all sibling L1 items if open: "selected"', function() {
        var $elem;

        $elem = this.$el.sidewinder({
          open: 'selected'
        }).children('.sw-l1').eq(2).click();
        $elem.prev().click();
        return expect($elem).not.to.have["class"]('unwound');
      });
      return it('should remove "unwound" class from itself if clicked again', function() {
        var $elem;

        $elem = this.$el.sidewinder().children('.sw-l1').eq(1).click().click();
        return expect($elem).not.to.have["class"]('unwound');
      });
    });
    describe('L1 items (childless)', function() {
      beforeEach(function() {
        return this.$el.sidewinder();
      });
      it('should not be marked "unwound" if clicked and no sub-menu exists', function() {
        var $elem;

        $elem = this.$el.children('.sw-l1').first().click();
        return expect($elem).not.to.have["class"]('unwound');
      });
      it('should be marked "active" if clicked and no sub-menu exists', function() {
        var $elem;

        $elem = this.$el.children('.sw-l1').first().click();
        return expect($elem).to.have["class"]('active');
      });
      it('should remove "active" class from other childless L1 items when itself marked "active"', function() {
        var $elem;

        ($elem = this.$el.children('.sw-l1').first().click()).siblings().eq(2).click();
        return expect($elem).not.to.have["class"]('active');
      });
      return it('should remove "active" class from previously active L2 items too', function() {
        var $elem;

        $elem = this.$el.children('.sw-l1').eq(1).click().find('.sw-l2 li').eq(1).click();
        this.$el.children('.sw-l1').eq(0).click();
        return expect($elem).not.to.have["class"]('active');
      });
    });
    describe('dummy L1 items', function() {
      beforeEach(function() {
        return this.$el.sidewinder();
      });
      it('should not mark dummy L1 items as "active" when clicked', function() {
        var $elem;

        $elem = this.$el.children('.dummy').click();
        return expect($elem).not.to.have["class"]('active');
      });
      it('should become "active" when a submenu is clicked', function() {
        var $elem;

        ($elem = this.$el.children('.dummy').click()).find('.sw-l2 li').first().click();
        return expect($elem).to.have["class"]('active');
      });
      return it('should remove "active" class from all other L1 items when activated', function() {
        var $elem;

        ($elem = this.$el.children('.sw-l1').eq(1).click()).find('.sw-l2 li').first().click();
        $elem.siblings('.dummy').click().find('.sw-l2 li').first().click();
        return expect($elem).not.to.have["class"]('active');
      });
    });
    describe('hiding/showing sub-menu', function() {
      it('should hide the sub-menu when L1 item is wound up', function() {
        var $elem;

        $elem = this.$el.sidewinder().children('.sw-l1').eq(1).click().click();
        return expect($elem.find('.sw-l2')).to.be.hidden;
      });
      it('should show the sub-menu when L1 item is unwound', function() {
        var $elem;

        $elem = this.$el.sidewinder().children('.sw-l1').eq(1).click();
        return expect($elem.find('.sw-l2')).to.be.visible;
      });
      return it('should hide the sub-menu if open:selected and another sub-menu is opened', function() {
        var $elem;

        $elem = this.$el.sidewinder({
          open: "selected"
        }).children('.sw-l1').eq(1).click();
        $elem.next().click();
        return expect($elem.find('.sw-l2')).to.be.hidden;
      });
    });
    return describe('activating individual sub-links', function() {
      beforeEach(function() {
        return this.$item = this.$el.sidewinder().children('.sw-l1').eq(1).click().find('.sw-l2 li').first().click();
      });
      it('should mark clicked L2 link as "active"', function() {
        return expect(this.$item).to.have["class"]('active');
      });
      it('should remove "active" class from old L2 link in the same menu', function() {
        this.$item.next().click();
        return expect(this.$item).not.to.have["class"]('active');
      });
      it('should remove "active" class from old L2 links in any L1 menu', function() {
        var $new;

        $new = this.$el.children('.sw-l1').eq(2).click().find('.sw-l2 li').eq(2).click();
        return expect(this.$item).not.to.have["class"]('active');
      });
      it('should add "active" class on its parent L1 menu', function() {
        return expect(this.$item.closest('.sw-l1')).to.have["class"]('active');
      });
      return it('should remove "active" from parent L1 menu if a link from an uncle L1 menu is clicked', function() {
        var $uncles;

        $uncles = this.$item.closest('.sw-l1').siblings('.sw-l1');
        $uncles.eq(1).click().find('.sw-l2 li').first().click();
        return expect(this.$item.closest('.sw-l1')).not.to.have["class"]('active');
      });
    });
  });

}).call(this);
