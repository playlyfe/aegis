# Aegis UI
[![CDNJS](https://img.shields.io/cdnjs/v/aegis.svg)](https://cdnjs.com/libraries/aegis)
## Usage

### Bower
To use aegis as a bower package, write:

    bower install aegis --save

### Download
Download aegis using this link:
[Download Aegis](https://raw.github.com/playlyfe/aegis/master/aegis.min.css)

To use Aegis as-is, use the minified file `aegis.min.css`.
For development, you'd be better off using the unminified `aegis.css` file.

Add the css to your project and serve it hot with your html files with this line:

    <link rel="stylesheet" href="css/aegis.min.css">

We also recommend you to use a CSS reset stylesheet such as [normalize](http://necolas.github.io/normalize.css/).


## Contributing

If you want to modify Aegis to suit your needs, or want to contribute to the project,
fork this repo.

You'll need the `sass` gem installed along with `compass` `v0.13-alpha`.
Install these with:

    gem install sass
    gem install compass --pre

_note: install version 0.13 (alpha) or greater of compass, as compass 0.12 doesn't have
some mixins being used here_

Then, run:

    grunt

which will watch changes to your scss files, and automatically compile a development
version of aegis into the root folder.

When you are done with your changes, submit a pull request to us.
Also, you can compile the production version of the styles with

    grunt build


## Authors

##### Kumar Harsh ([Github](https://github.com/kumarharsh))
##### Johny Jose  ([Github](https://github.com/atrniv))


## License

Copyright 2013 Playlyfe Technologies, LLP

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

  http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

---



###### <kbd>FROM PLAYLYFE</kbd>

![Playlyfe](http://www.playlyfe.com/favicon.ico)
