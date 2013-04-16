# CHANGELOG

* hr.dotted.big --> hr.dotted.fat
* modal's default position fixed --> absolute
* modal.profiler --> modal.wider

### TYPOGRAPHY
---
* removed .no-bottom and .no-margin from h1,...,h6 defs

### FORMS
---
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

### SIDEBAR
---
* Changes to sidebar markup classnames
* Uninav renamed to tabbar, classes changed a bit

`not using Tabbar yet`
