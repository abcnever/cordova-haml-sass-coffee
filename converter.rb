#!/usr/bin/env ruby

require 'listen'

haml_listener = Listen.to('src/haml', only: /\.haml$/) do |modified, added, removed|

  if !modified.empty?
    modified.each do |path|
      system("thor convert:haml #{path}")
    end
  end

  if !added.empty?
    added.each do |path|
      system("thor convert:new_haml #{path}")
    end
  end

  if !removed.empty?
    removed.each do |path|
      system("thor convert:remove_haml #{path}")
    end
  end
end

sass_listener = Listen.to('src/sass', only: /(\.scss$)|(\.sass$)/) do |modified, added, removed|
  paths = []

  if !modified.empty?
    paths = modified
  end

  if !added.empty?
    paths = added
  end

  if !removed.empty?
    removed.each do |rm|
      system("thor convert:remove_sass #{rm}")
    end
  end

  return if paths == []

  paths.each do |path|
    system("thor convert:sass #{path}")
  end
end

coffee_listener = Listen.to('src/coffeescript', only: /\.coffee$/) do |modified, added, removed|
  paths = []

  if !modified.empty?
    paths = modified
  end

  if !added.empty?
    paths = added
  end

  if !removed.empty?
    removed.each do |rm|
      system("thor convert:remove_coffee #{rm}")
    end
  end

  return if paths == []

  paths.each do |path|
    system("thor convert:coffee #{path}")
  end
end

haml_listener.start
coffee_listener.start
sass_listener.start

sleep
