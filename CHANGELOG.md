# CHANGELOG

### 28Apr
* _navigation.scss:
  + add a `nav-link` class to `a` inside `.nav`
  + add a `navbar-item` class to `li` inside `.navbar`
  + add a `navbar-link` class to `a` inside `.navbar`

### v1.0.3 / 19 Dec
* Fixed some buttons not having a proper active state
* Fixed diverging focus styles for webkit and other browsers
* Removed font size from tables

### v1.0.2 / 21 Nov
* Improved the default tooltip's border colours
* Removed unnecessary max-widths from tooltip and table

### v1.0.1 / 27 Oct
* Fixed display of some elements when used with grid col-* classes
* Fixed button's disabled styles when combined with other button classes

### v1.0.0 / 20 Oct
* Feels like its mature enough for v1.
* Minor fixes

### v0.9.3 / 5 Oct
* Added new icons to the font
* Improved hinting and design of old icons

### v0.9.2 / 29 Sept
* Fixed minor bugs in tooltip, modals
* Added an 'ellipsis' class in typography for dealing with common text-overflow problems.

### v0.9.1 / 19 Sept
* Removed default support for old browsers
* Made all utility classes !important, due to their atomic nature

### v0.9.0 / 12 Sept
* Getting ready for major realease 1.0.0
* Mostly minor tweaks, removal of some classes and debugs

### v0.4.0 / 25 Aug
* Minor brushups and bug-fixes

### v0.3.5 / 16 Aug
* Tooltips added

### v0.3.2 / 6-Aug
* Removed docs and plugins folders. Docs is completely moved to gh-pages branch
* Fixed typography mixing and the @font-face declarations.
* Added an active state to navbars.
* Removed user-select() mixin, replaced with manual styles (a problem in Docpad compilation forced my hand)

### v0.3.1 / 1-Aug
* Fixed semver incompatible version number for aegis

### v0.3 / 31-Jul-2013
-----
* Expanded icon-set
* Removed IE7 support
* Added tooltip classes
* Updated modal and tabs
* Added range of fade classes (0.9 to 0.1) opacity
* Added a button-group
* Field error's margins rejigged to be closer to the sibling input
* Gray-shift: added a new shade -> gray-darker to balance the shades

    b     dr dk    gr         lt         lr    ls lut w  <-- old gray shades (d=dark, l=light)
    .0 -- .2 .3 -- .5 -- --   .8   -9 -- .b -- .d .e .f  <-- hex strength
    .0 -- .2 .3 -- .5 -- .7   --   .9 -- .b -- .d .e .f
    b     ds dr    dk    gr        lt    lr    ls lut w  <-- new gray shades (s=-est, r=-er, k,t -> DarK, LighT)

### v0.2
-----
* Redid all forms
* Added a media object class for general usage
* Homogenized modal styles
* and much more...

#### INTEGRATED GRID SYSTEM
---

* hr.dotted.big --> hr.dotted.fat
* modal's default position fixed --> absolute
* modal.profiler --> modal.wider

#### TYPOGRAPHY
---
* modified body & wrapper classes
* modified splash class, increased height
* added an hl class
* removed .no-bottom and .no-margin from h1,...,h6 defs

#### FORMS
---
* Removed left-padding in horizontal form's radio buttons
* input-height changed: 31px --> 2.38em (check)
* moved out PARSLEY-ERROR-LIST

    .parsley-error-list {
      @extend .no-list;
      @extend .no-space;
      color: $red;
    }

* moved out CodeMirror-focused

    .CodeMirror-focused ~ .field-tip {
      display: block;
    }

* renamed strength-meter classes
    pass-strong --> strong
    pass-med    --> medium
    pass-weak   --> feeble

* removed `.label-list`

#### BUTTONS
---
* changed .crystal to .accent
* slightly changed top-padding
* inline-buttons have changed a bit. Taken care in forms
* passive changed to disabled

#### SIDEBAR
---
* Changes to sidebar markup classnames
* Uninav renamed to tabbar, classes changed a bit

`not using Tabbar yet`

#### UTILITIES
---
* added a fade class


#### TABLES
---
* Removed cell-ops from table partial. Add it back to a specific stylesheet
* changed bordered class to non-bordered,
* nearly changed all style classes & added new spatial classes.

#### TIDBITS
---
* Added a *example* class for demonstrations.
