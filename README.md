# Aegis UI

## Usage
To use the css styles as-is, just copy the aegis.css file from `docs/assets/css` folder
to your project and serve it hot with your html files with this line:

    <link rel="stylesheet" href="css/aegis.css">


If you want to modify the theme by directly editing the sass files,
you'll need the `sass` gem installed along with the `compass` framework.

Install these with:

    gem install sass
    gem install compass

Then, tell sass to watch your `aegis/sass` folder:

    sass --compass --watch sass:<output_dir>

and hack away!

###### FROM PLAYLYFE
