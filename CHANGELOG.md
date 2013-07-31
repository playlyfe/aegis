# CHANGELOG

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
