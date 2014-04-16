
1.cloning this repo into your project as template

    git clone --depth 1 --origin source git@git.syncidlabs.com:syncidlabs/phonegap-template.git <new-project-name>

  and remove the git history

    rm -rf <new-project-name>/.git

2.create new project with phonegap

    phonegap create <new-project-name>

3.go into the new project's directory

    cd <new-project-name>

4.reinit the git project

    git init

5.create the necessary `.ruby-version` and `.ruby-gemset` files:

  for `.ruby-version`

    1.9.3

  or

    2.1.0

  for `.ruby-gemset`

    <new-project-name>

6.install the necessary gems first

    bundle install

7.install the thor commands in the thor.rb

    thor install ./thor.rb

  follow the instruction and give it a custom name as you wish

8. install the coffeescript command line bin file.

    sudo npm install -g coffee-script

9.use

    observr converter.rb

  to monitor and convert haml/coffeescript/scss to html/js/css on save
