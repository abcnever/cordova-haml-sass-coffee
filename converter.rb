watch 'src/haml/.*\.haml' do |md| system('thor convert:haml') end
watch 'src/haml/.*\.rb' do |md| system('thor convert:haml') end
watch 'src/sass/.*\.scss' do |md| system('thor convert:sass') end
watch 'src/sass/.*\.sass' do |md| system('thor convert:sass') end
watch 'src/coffeescript/.*\.coffee' do |md| system('thor convert:coffee') end
