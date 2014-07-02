ROOT_DIR = Dir.getwd

require 'coffee-script'
require 'fileutils'

class Convert < Thor
  Dir.chdir(ROOT_DIR)

  desc "haml", "converts and puts haml in www"
  def haml(file)
    file_basename = basename(file)

    if file_basename.include?('.html') && file_basename.include?('.haml')
      o_file = file_basename.gsub /.haml/, ''
    elsif !file_basename.include?('.html') && file_basename.include?('.haml')
      o_file = file_basename.gsub /.haml/, '.html'
    else
      return
    end

    `./haml_convert.rb #{file} www/#{o_file}`
  end

  desc "new_haml", "handle the addition of haml differently"
  def new_haml(file)
    file_basename = basename_without_ext(file)
    invoke :haml, [file]

    if !(file.include?("/layout/") || file.include?("/partials/") )
      if file_basename.include? ".html"
        file_basename = file_basename.sub ".html", ""
      end

      f = File.new File.join("src/coffeescript", "#{file_basename}.js.coffee"), "w"
      f.close
      f = File.new File.join("src/sass", "#{file_basename}.css.scss"), "w"
      f.close
    end
  end

  desc "remove_haml", "remove the compiled html file in www"
  def remove_haml(file)
    file_basename = basename_without_ext(file)

    if !file_basename.include? ".html"
      file_basename += ".html"
    end

    `rm www/#{file_basename}`
  end

  desc "sass", "converts and puts sass in www"
  def sass(file)
    file_basename = basename(file)
    sub_dir = get_dir(file).sub "src/sass", "www/css"

    if (file_basename.include?('.sass') || file_basename.include?('.scss')) && file_basename.include?('.css')
      o_file = file_basename.gsub /.sass/, ''
      o_file = file_basename.gsub /.scss/, ''
    elsif (file_basename.include?('.sass') || file_basename.include?('.scss')) && !file_basename.include?('.css')
      o_file = file_basename.gsub /.sass/, '.css'
      o_file = file_basename.gsub /.scss/, '.css'
    else
      return
    end

    `sass #{file}:#{sub_dir}/#{o_file}`
  end

  desc "remove_sass", "remove the compiled sass file in www"
  def remove_sass(file)
    file_basename = basename_without_ext(file)
    sub_dir = get_dir(file).sub "src/sass", "www/css"

    if !file_basename.include? ".css"
      file_basename += ".css"
    end

    `rm #{sub_dir}/#{file_basename}`
  end

  desc "coffee", "converts and puts coffeescript in www"
  def coffee(file)
    file_basename = basename_without_ext(file)
    sub_dir = get_dir(file).sub "src/coffeescript", "www/js"
    js = CoffeeScript.compile File.read(file), {bare: true}

    if !file_basename.include? ".js"
      file_basename += ".js"
    end

    unless File.exist? sub_dir
      FileUtils.mkdir_p sub_dir
    end

    File.write("#{sub_dir}/#{file_basename}", js)
  end

  desc "remove_coffee", "remove the compiled coffee file in www"
  def remove_coffee(file)
    file_basename = basename_without_ext(file)
    sub_dir = get_dir(file).sub "src/coffeescript", "www/js"

    if !file_basename.include? ".js"
      file_basename += ".js"
    end

    `rm #{sub_dir}/#{file_basename}`
  end

  private

  def basename(file_path)
    File.basename(file_path)
  end

  def basename_without_ext(file_path)
    File.basename file_path, ".*"
  end

  def get_dir(file_path)
    File.dirname(file_path)
  end

  # desc "all", "Convert haml, sass and coffee"
  # def all
  #   invoke :haml
  #   invoke :sass
  #   invoke :coffee
  # end

  # desc "watch", "Start watchr to convert haml, sass and coffee source as it is modified"
  # def watch
  #   invoke :all
  #   system "cd #{ROOT_DIR} && watchr converter.rb"
  # end
end
