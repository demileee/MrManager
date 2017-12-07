require 'test_helper'

class UnsplashConcernTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  test "cache exists" do
    @cache = Rails.application.cache

    assert @cache.present?
  end

end
