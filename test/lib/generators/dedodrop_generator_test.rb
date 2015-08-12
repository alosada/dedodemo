require 'test_helper'
require 'generators/dedodrop/dedodrop_generator'

class DedodropGeneratorTest < Rails::Generators::TestCase
  tests DedodropGenerator
  destination Rails.root.join('tmp/generators')
  setup :prepare_destination

  # test "generator runs without errors" do
  #   assert_nothing_raised do
  #     run_generator ["arguments"]
  #   end
  # end
end
