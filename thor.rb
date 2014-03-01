ROOT_DIR = Dir.pwd

class Convert < Thor

  desc "haml", "converts and puts haml in www"
  def haml
    `haml -r #{ROOT_DIR}/src/haml/helpers.rb #{ROOT_DIR}/src/haml/index.html.haml #{ROOT_DIR}/www/index.html`
  end

  desc "sass", "converts and puts sass in www"
  def sass
    'sass --update #{ROOT_DIR}/src/sass:#{ROOT_DIR}/www/stylesheets'
  end

  desc "coffee", "converts and puts coffeescript in www"
  def coffee
    `coffee -o #{ROOT_DIR}/www/js -c #{ROOT_DIR}/src/coffeescript/`
  end

  desc "all", "Convert haml, sass and coffee"
  def all
    invoke :haml
    invoke :sass
    invoke :coffee
  end

  desc "watch", "Start watchr to convert haml, sass and coffee source as it is modified"
  def watch
    invoke :all
    system "cd #{ROOT_DIR} && watchr converter.rb"
  end
end
