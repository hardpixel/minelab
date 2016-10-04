## What is Minelab?

Minelab is a free Redmine 2.5.x theme inspired by Gitlab, written in Sass. It uses Bourbon for cross browser compatibility, Neat for responsive grids and Font Awesome to replace all the stock icons. It also mimics Gitlab's page loading effect using PACE and CSS animations.

## What plugins are supported?

Minlab supports all the free and lite plugins from RedmineCRM. Support for more plugins is coming in later versions.

## How to install it

To install Minelab, you need to unzip it and copy it's contents in `Redmine/public/themes`. Then visit `Redmine>Administration>Settings>Display` and select Minelab theme.

## To do

Make it responsive!

## How it looks?

Screenshots are available at [Minlab's page](http://hardpixel.github.io/minelab/)

## Contribution

It appears that a few people are using Minelab, even though it has issues. Our time is very limited, so it would be great if those who have made changes/fixes could create a pull request.

*When making changes, please make sure you are editing the application.sass file, otherwise changes will be lost.*

### Create CSS from SASS

You can use `guard` and `build.sh` to build sass files or you can do it manually.

#### Use guard

Use guard to convert sass to css files as you make changes.

```
bundle install

guard start
```

#### Use build script

Run the build script with the command below to create css files.

```
./build.sh
```

Using the build script you can also override any variable definition by providing a custom override scss file like this:

```
./build.sh path-to-override.scss
```

in effect, build.sh will replace the file sass/override.scss with the content of the provided file in argument. To reset the override simply run ./build.sh without any override argument

```
./build.sh
```

#### Manually

Run sass with the command below to create css files.

```
bundle install

sass --load-path bourbon --load-path neat --sourcemap=none sass/application.sass stylesheets/application.css
```

## Credits

[Bourbon](http://bourbon.io/) | [Neat](http://neat.bourbon.io/) | [Font Awesome](http://fontawesome.io/) | [PACE](http://github.hubspot.com/pace/)
