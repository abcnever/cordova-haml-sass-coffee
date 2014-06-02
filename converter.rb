watch 'src/haml/.*\.haml' do |md| system("thor convert:haml #{md[0]}") end
watch 'src/sass/.*\.scss' do |md| system("thor convert:sass #{md[0]}") end
watch 'src/sass/.*\.sass' do |md| system("thor convert:sass #{md[0]}") end
watch 'src/coffeescript/.*\.coffee' do |md| system("thor convert:coffee #{md[0]}") end
