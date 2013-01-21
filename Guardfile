# A sample Guardfile
# More info at https://github.com/guard/guard#readme

guard 'spork', :cucumber_env => { 'RAILS_ENV' => 'test' }, :rspec_env => { 'RAILS_ENV' => 'test' } do
  watch('config/application.rb')
  watch('config/environment.rb')
  watch('config/environments/test.rb')
  watch(%r{^config/initializers/.+\.rb$})
  watch('Gemfile')
  watch('Gemfile.lock')
  watch('spec/spec_helper.rb') { :rspec }
  watch('test/test_helper.rb') { :test_unit }
  watch(%r{features/support/}) { :cucumber }
  watch('config/routes.rb') { "spec/routing" }
  # FactoryGirl factories
  watch(%r{^spec/factories\.rb$}) { "spec" }
  watch(%r{^spec/factories/(.+)_factory\.rb$}) { |m| ["spec/models/#{m[1]}_spec.rb", "spec/controllers/#{m[1].pluralize}_controller_spec.rb", "spec/requests/#{m[1].pluralize}_spec.rb"] }

end
