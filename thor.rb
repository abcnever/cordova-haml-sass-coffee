ROOT_DIR = Dir.getwd

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

    `haml -I ./src/haml/helpers/ ./#{file} ./www/#{o_file}`
  end

  desc "sass", "converts and puts sass in www"
  def sass(file)
    file_basename = basename(file)

    if (file_basename.include?('.sass') || file_basename.include?('.scss')) && file_basename.include?('.css')
      o_file = file_basename.gsub /.sass/, ''
      o_file = file_basename.gsub /.scss/, ''
    elsif (file_basename.include?('.sass') || file_basename.include?('.scss')) && !file_basename.include?('.css')
      o_file = file_basename.gsub /.sass/, '.css'
      o_file = file_basename.gsub /.scss/, '.css'
    else
      return
    end

    `sass ./#{file}:./www/css/#{o_file}`
  end

  desc "coffee", "converts and puts coffeescript in www"
  def coffee(file)
    `coffee -o ./www/js/ -c ./#{file}`
  end

  private

  def basename(filename)
    Pathname.new(filename).basename.to_s
  end
end
