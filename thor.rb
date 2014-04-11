ROOT_DIR = Dir.getwd

class Convert < Thor
  Dir.chdir(ROOT_DIR)

  desc "haml", "converts and puts haml in www"
  def haml
    `haml -r ./src/haml/helpers.rb ./src/haml/index.html.haml ./www/index.html`
  end

  desc "sass", "converts and puts sass in www"
  def sass
    `sass --update ./src/sass/:./www/css/`
  end

  desc "coffee", "converts and puts coffeescript in www"
  def coffee
    `coffee -o ./www/js -c ./src/coffeescript/`
  end

  desc "all", "Convert haml, sass and coffee"
  def all
    invoke :haml
    invoke :sass
    invoke :coffee
  end

  # desc "watch", "Start watchr to convert haml, sass and coffee source as it is modified"
  # def watch
  #   invoke :all
  #   system "cd #{ROOT_DIR} && watchr converter.rb"
  # end
end
