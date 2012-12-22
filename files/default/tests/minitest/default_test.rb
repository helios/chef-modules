require File.expand_path('../support/helpers', __FILE__)

module MiniTest::Chef::Assertions
  resource_exists :modules_modulefile, field: :name
  alias_method :assert_modulefile_exists, :assert_modules_modulefile_exists
end

module MiniTest::Chef::Resources
  register_resource :modules_modulefile
  alias_method :modulefile, :modules_modulefile
end

class ModulefileResourceTest < MiniTest::Chef::TestCase
  def test_lwrp_exercising_recipe_should_be_in_the_runlist
    assert_includes node['recipes'], 'modules::_default_test'
  end

  def test_modulefile_resource_is_available
    assert_modulefile_exists modulefile("test")
  end
end
