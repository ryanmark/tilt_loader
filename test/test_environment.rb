require 'minitest/autorun'
require 'tilt/environment'
require 'tilt/file_system_loader'
require 'tilt/loader'

class TestEnvironment < MiniTest::Unit::TestCase
  #def setup
  #def teardown

  def test_new_environment
    env = Tilt::Environment.new(
      Tilt::FileSystemLoader.new([
        'test/templates', 'test/other_templates']))
    template = env.get_template 'test.html'
    assert_equal '<p>templates</p>', template.render.strip
  end

  def test_loader
    assert_raises ArgumentError do
      Tilt::Loader.new
    end

    loader = Tilt::Loader.new do |template|
      return 'testing ' + template, template
    end

    source, filename = loader.get_source('foo.html')
    assert_equal 'testing foo.html', source
    assert_equal 'foo.html', filename.strip
  end

  def test_file_system_loader
    assert_raises ArgumentError do
      Tilt::FileSystemLoader.new
    end
    assert_raises ArgumentError do
      Tilt::FileSystemLoader.new do
        'foo'
      end
    end

    loader = Tilt::FileSystemLoader.new('test/templates')

    source, filename = loader.get_source('test', add_ext: true)
    assert_equal '<p>templates</p>', source.strip
    assert_equal File.expand_path("test/templates/test.html"), filename.strip

    source, filename = loader.get_source('header', add_ext: true, add_underscore: true)
    assert_equal "<h1>Hi I'm a <%= \"header\" %></h1>", source.strip
    assert_equal File.expand_path("test/templates/_header.html.erb"), filename.strip
  end
end
