#!/usr/bin/env ruby

require 'haml'

@layout_file = File.expand_path './src/haml/layout/layout.html.haml'
@partials = Dir[File.expand_path './src/haml/partials/*']
@@css_files = Dir[File.expand_path './www/css/*']

@@js_files = Dir[File.expand_path './www/js/*']

@convert_filter = [@layout_file] + @partials

@all_pages = Dir[File.expand_path './src/haml/*.haml']

@@request_domain = "kingslistapp.com"

def render_partial(partial, locals = {})
  Haml::Engine.new(File.read("./src/haml/partials/_#{partial}.html.haml")).render(Object.new, locals)
end

def render_layout(input_file)
  if File.expand_path(input_file) != @layout_file
    Haml::Engine.new(File.read(@layout_file)).render do
      Haml::Engine.new(File.read(input_file)).render
    end
  end
end

def file_basename_without_ext
  barename = ARGV[0]

  file_basename_without_ext_str barename
end

def file_basename_without_ext_str(file_name)
  barename = file_name

  while !File.extname(barename).empty?
    barename = File.basename(barename, ".*")
  end

  return barename
end

if @convert_filter.include? File.expand_path(ARGV[0])
  @all_pages.each do |p|
    `thor convert:haml #{p}`
  end
else
  File.open(ARGV[1], 'w') do |f|
    f.write render_layout(ARGV[0])
  end
end
