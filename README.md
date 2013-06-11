# Aegis UI

## Usage
To use the css styles as-is, just copy the aegis.css file from `docs/assets/css` folder
to your project and serve it hot with your html files with this line:

    <link rel="stylesheet" href="css/aegis.css">

We also recommend you to use a CSS reset stylesheet such as [normalize](http://necolas.github.io/normalize.css/). Include this stylesheet before aegis:

    <link rel="stylesheet" href="css/normalize.css">
    <link rel="stylesheet" href="css/aegis.css">


## Contributing

If you want to modify Aegis for yourself, or want to contribute to the project,
you'll need the `sass` gem installed along with the `compass` framework.
Install these with:

    gem install sass
    gem install compass --pre

_note: install version 0.13 (alpha) or greater of compass, as compass 0.12 doesn't have
some mixins being used here_

Then, run:

    grunt

which will watch changes to your scss files, and automatically compile a development
version of aegis into the root folder.

When you are done, run

    grunt build

to compile the production versions of aegis, and push.

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



###### FROM PLAYLYFE
