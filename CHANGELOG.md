# CHANGELOG

### INTEGRATED GRID SYSTEM
---

* hr.dotted.big --> hr.dotted.fat
* modal's default position fixed --> absolute
* modal.profiler --> modal.wider

### TYPOGRAPHY
---
* modified body & wrapper classes
* modified splash class, increased height
* added an hl class
* removed .no-bottom and .no-margin from h1,...,h6 defs

### FORMS
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

### BUTTONS
---
* changed .crystal to .accent
* slightly changed top-padding
* inline-buttons have changed a bit. Taken care in forms
* passive changed to disabled

### SIDEBAR
---
* Changes to sidebar markup classnames
* Uninav renamed to tabbar, classes changed a bit

`not using Tabbar yet`

### UTILITIES
---
* added a fade class


### TABLES
---
* Removed cell-ops from table partial. Add it back to a specific stylesheet
* changed bordered class to non-bordered,
* listing class is slightly changed.
