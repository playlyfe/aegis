root = if window? then window else global

describe 'chainability', () ->
  describe '$("ul").sidewinder()', () ->
    it 'should return the element so that other methods could be chained to it', () ->
      $el = $('<ul></ul>')
      expect($el.sidewinder()).to.match $el

describe 'options', () ->
  describe '$.fn.sidewinder.defaults', () ->
    it 'should contain the default options', () ->
      expect($.fn.sidewinder.defaults).to.eql
        start: 'collapsed'
        open: 'all'
        dummyL1: false

  describe 'passing all options while init', () ->
    it 'should override the defaults', () ->
      sidewinder = new root.Sidewinder()
      sidewinder.init
        start: 'expanded'
        open: 'selected'
        dummyL1: true
      expect(sidewinder.options).to.eql
        start: 'expanded'
        open: 'selected'
        dummyL1: true

  describe 'passing some options while init', () ->
    it 'should override the supplied arguments, but keep the rest intact', () ->
      sidewinder = new root.Sidewinder()
      sidewinder.init
        open: 'selected'
      expect(sidewinder.options).to.eql
        start: 'collapsed'
        open: 'selected'
        dummyL1: false

describe 'init', () ->
  describe 'when the class is initialized independently', () ->
    it 'should have no attached element', () ->
      sidewinder = new root.Sidewinder()
      sidewinder.init()
      expect(sidewinder.el).to.be.undefined

  describe 'when applied to an element', () ->
    it 'should not apply on hidden elements', () ->
      $el = $('<ul style="display:none"></ul>"').sidewinder()
      expect($el).not.to.have.class('sidewinder')

    it 'should add a sidewinder class to a visible element', () ->
      $el = $('<ul></ul>')
      $('#testing').append $el
      expect($el.sidewinder()).to.have.class('sidewinder')
      $el.remove()

describe 'setup', () ->
  describe 'building the DOM', () ->
    beforeEach () ->
      @$el = $('''
        <ul>
          <li>
            <a>Game <span class='arrow'></span></a>
          </li>
          <li>
            <a>of <span class='arrow'></span></a>
            <ul>
              <li><a>wait</a></li>
              <li><a>for</a></li>
              <li>it</li>
            </ul>
          </li>
          <li><a>Thrones <span class='arrow'></span></a>
            <ul>
              <li><a>Self</a></li>
              <li><a>High</a></li>
              <li><a>Five</a></li>
            </ul>
          </li>
          <li>Winter is coming</li>
          <li class='dummy'>My Sons
            <ul>
              <li><a>Rob</a></li>
              <li><a>Jon</a></li>
              <li><a>Bran</a></li>
            </ul>
          </li>
        </ul>
      ''')
      $('#testing').append @$el

    afterEach () ->
      @$el.remove()

    it 'should add sw-l1 class to L1 items', () ->
      @$el.sidewinder()
      count = @$el.children('.sw-l1').length
      expect(count).to.equal 5

    it 'should add a sw-l2 to the sub-menu root', () ->
      @$el.sidewinder()
      sub = @$el.children('.sw-l1').children('ul')
      expect(sub).to.have.class('sw-l2')

    it 'should collapse all L1 items if start option "collapsed"', () ->
      @$el.sidewinder()
      expect(@$el.find('.sw-l2')).to.be.hidden

    it 'should show all L1 items if start option "expanded"', () ->
      @$el.sidewinder({start: 'expanded'})
      expect(@$el.find('.sw-l2')).to.be.visible



describe 'mechanics', () ->

  beforeEach () ->
    @$el = $('''
      <ul>
        <li>
          <a>Game <span class='arrow'></span></a>
        </li>
        <li>
          <a>of <span class='arrow'></span></a>
          <ul>
            <li><a>wait</a></li>
            <li><a>for</a></li>
            <li>it</li>
          </ul>
        </li>
        <li><a>Thrones <span class='arrow'></span></a>
          <ul>
            <li><a>Self</a></li>
            <li><a>High</a></li>
            <li><a>Five</a></li>
          </ul>
        </li>
        <li>Winter is coming</li>
        <li class='dummy'>My Sons
          <ul>
            <li><a>Rob</a></li>
            <li><a>Jon</a></li>
            <li><a>Bran</a></li>
          </ul>
        </li>
      </ul>
    ''')
    $('#testing').append @$el

  afterEach () ->
    # @$el.remove()



  describe 'L1 items', () ->

    it 'should mark the clicked L1 item as "unwound"', () ->
      $elem = @$el.sidewinder()
                .children('.sw-l1').eq(1).click()
      expect($elem).to.have.class('unwound')

    it 'should mark the clicked L1 item as "active" if it is not "dummy"', () ->
      $elem = @$el.sidewinder()
                .children('.sw-l1').eq(1).click()
      expect($elem).to.have.class('active')

    it 'should not remove "unwound" class from other L1 items if open: "all"', () ->
      $elem = @$el.sidewinder({ open: 'all' })
                .children('.sw-l1').eq(1).click()
      $elem.next().click()
      expect($elem).to.have.class('unwound')

    it 'should remove "unwound" class from all sibling L1 items if open: "selected"', () ->
      $elem = @$el.sidewinder({ open: 'selected' })
                .children('.sw-l1').eq(2).click()
      $elem.prev().click()
      expect($elem).not.to.have.class('unwound')

    it 'should remove "unwound" class from itself if clicked again', () ->
      $elem = @$el.sidewinder()
                .children('.sw-l1').eq(1).click().click()
      expect($elem).not.to.have.class('unwound')



  describe 'L1 items (childless)', () ->
    beforeEach () ->
      @$el.sidewinder()

    it 'should not be marked "unwound" if clicked and no sub-menu exists', () ->
      $elem = @$el.children('.sw-l1').first().click()
      expect($elem).not.to.have.class('unwound')

    it 'should be marked "active" if clicked and no sub-menu exists', () ->
      $elem = @$el.children('.sw-l1').first().click()
      expect($elem).to.have.class('active')

    it 'should remove "active" class from other childless L1 items when itself marked "active"', () ->
      ($elem = @$el.children('.sw-l1').first().click()).siblings().eq(2).click()
      expect($elem).not.to.have.class('active')

    it 'should remove "active" class from previously active L2 items too', () ->
      $elem = @$el.children('.sw-l1').eq(1).click()
                .find('.sw-l2 li').eq(1).click()
      @$el.children('.sw-l1').eq(0).click()
      expect($elem).not.to.have.class('active')


  describe 'dummy L1 items', () ->
    beforeEach () ->
      @$el.sidewinder()

    it 'should not mark dummy L1 items as "active" when clicked', () ->
      $elem = @$el.children('.dummy').click()
      expect($elem).not.to.have.class('active')

    it 'should become "active" when a submenu is clicked', () ->
      ($elem = @$el.children('.dummy').click()).find('.sw-l2 li').first().click()
      expect($elem).to.have.class('active')

    it 'should remove "active" class from all other L1 items when activated', () ->
      ($elem = @$el.children('.sw-l1').eq(1).click()).find('.sw-l2 li').first().click()
      $elem.siblings('.dummy').click().find('.sw-l2 li').first().click()
      expect($elem).not.to.have.class('active')







  describe 'hiding/showing sub-menu', () ->

    it 'should hide the sub-menu when L1 item is wound up', () ->
      $elem = @$el.sidewinder()
                .children('.sw-l1').eq(1).click().click()
      expect($elem.find('.sw-l2')).to.be.hidden

    it 'should show the sub-menu when L1 item is unwound', () ->
      $elem = @$el.sidewinder()
                .children('.sw-l1').eq(1).click()
      expect($elem.find('.sw-l2')).to.be.visible

    it 'should hide the sub-menu if open:selected and another sub-menu is opened', () ->
      $elem = @$el.sidewinder({open:"selected"})
                .children('.sw-l1').eq(1).click()
      $elem.next().click()
      expect($elem.find('.sw-l2')).to.be.hidden


  describe 'activating individual sub-links', () ->
    beforeEach () ->
      @$item = @$el.sidewinder()
                .children('.sw-l1').eq(1).click()
                .find('.sw-l2 li').first().click()

    it 'should mark clicked L2 link as "active"', () ->
      expect(@$item).to.have.class('active')

    it 'should remove "active" class from old L2 link in the same menu', () ->
      @$item.next().click()
      expect(@$item).not.to.have.class('active')

    it 'should remove "active" class from old L2 links in any L1 menu', () ->
      $new = @$el.children('.sw-l1').eq(2).click()
                .find('.sw-l2 li').eq(2).click()
      expect(@$item).not.to.have.class('active')

    it 'should add "active" class on its parent L1 menu', () ->
      expect(@$item.closest('.sw-l1')).to.have.class('active')

    it 'should remove "active" from parent L1 menu if a link from an uncle L1 menu is clicked', () ->
      $uncles = @$item.closest('.sw-l1').siblings('.sw-l1')
      $uncles.eq(1).click().find('.sw-l2 li').first().click()
      expect(@$item.closest('.sw-l1')).not.to.have.class('active')


    # TODO: add tests for position, and add a scroll-bar
    # if sidebar goes beyond viewport height
