1.Pull from this repository for a fresh cordova / phonegap app

    git pull --rebase git@github.com:NeverAgain/phonegap-haml-sass-coffee.git master

2.if you don't use RVM, skip this step.

  create the necessary `.ruby-version` and `.ruby-gemset` files:

  for `.ruby-version`

    1.9.3

  or

    2.1.0

  for `.ruby-gemset`

    <new-project-name>

3.install the necessary gems first

    bundle install

4.install the necessary tools to monitor directories

    sudo apt-get install inotify-tools

5.install the thor commands in the thor.rb

    thor install ./thor.rb

  follow the instruction and give it a custom name as you wish.

  whenever this repository is updated it's recommended to do

    thor update <custom name>

6.use

    ./converter.rb

  to monitor and convert haml/coffeescript/scss to html/js/css on save
