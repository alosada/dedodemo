require 'test_helper'
require 'generators/de_do_drop/de_do_drop_generator'

class DeDoDropGeneratorTest < Rails::Generators::TestCase
  tests DeDoDropGenerator
  destination Rails.root.join('tmp/generators')
  setup :prepare_destination

  # test "generator runs without errors" do
  #   assert_nothing_raised do
  #     run_generator ["arguments"]
  #   end
  # end
end
