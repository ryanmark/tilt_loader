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
      'testing ' + template
    end

    assert_equal 'testing foo.html', loader.get_source('foo.html')
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
  end
end
