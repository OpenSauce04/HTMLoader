# HTMLoader

## Install

1. Download or clone the the repo, then enter the folder.

2. If it is not already installed, install Ruby (https://tinyurl.com/y5nfbk9z for Windows, `apt install ruby-full` for Linux)

3. If bundle is not installed, type `gem install bundler:1.17.3` into the terminal

4. In the terminal type `bundle install`

5. Run `update.rb`. This will download all of the apps for the loader.

6. Run `server.rb`

7. Open an internet browser and go to `localhost:8000`

To connect to the menu on a game console (may or may not work propperly depending on what you are using), follow steps 1-6, then go to the console's internet browser and enter `<computer's ipv4>:8000`

If you have any problems, please file an issue.
## Themes
To pick a theme, first look in the `menu/theme` folder.

When you want to try out a theme, copy the name of the theme's folder, and paste it into `theme.txt` in the `menu` folder, for example "cherry".
