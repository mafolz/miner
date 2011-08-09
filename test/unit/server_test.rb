require 'test_helper'

class ServerTest < ActiveSupport::TestCase

  context "with valid server" do
    setup do
      @attributes = {
        :title    => "the_server",
        :path     => "test/fixtures/minecraft/the_server",
        :map_path => "test/fixtures/www/the_server"
      }
    end

    should "get banned_ip" do
    end
  end
  # test "the truth" do
  #   assert true
  # end
end
