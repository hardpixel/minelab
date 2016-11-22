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
./build.sh path-to-override-directory
```

in effect, build.sh will replace the files _overrides.scss, _variables_overrides.scss, and _variables_usage_overrides.scss files in the sass directory with the content of the provided file in argument. To reset the override simply run ./build.sh -c to ignore the overrides (clear)

```
./build.sh -c
```

By default build.sh looks in the overrides directory to find these files, and use them if present.

#### Manually

Run sass with the command below to create css files.

```
bundle install

sass --load-path bourbon --load-path neat --sourcemap=none sass/application.sass stylesheets/application.css
```

## Customization

Minelab theme is built to allow you to create your theme colors based on the layout provided. For this you will need some CSS knowledge and basic SASS knowledge (really that one is easy).

To do so, you will also need to be able to run the build.sh script.

To create your own variation of this theme, you simply need to create and fill one of these files in the overrides directory:

overrides/_variables.scss               :       used to overrides the color early in the definition
overrides/_variables_usage_overrides    :       fine tune overrides on each color usage
overrides/_overrides.scss               :       included at the very end of the application.scss inclusion (to change each module needed)

By default, build.sh will look into the root folder of the theme for directory but you can specify your own location with ./build.sh -c path-to-your-override-directory

## Credits

[Bourbon](http://bourbon.io/) | [Neat](http://neat.bourbon.io/) | [Font Awesome](http://fontawesome.io/) | [PACE](http://github.hubspot.com/pace/)
