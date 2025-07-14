# frozen_string_literal: true
require_relative "types_export"
require_relative "requests"
require_relative "devin_test_package/imdb/client"
require_relative "requests"

module DevinClassNameTest
  class Client
  # @return [DevinClassNameTest::ImdbClient] 
    attr_reader :imdb


    # @param base_url [String] 
    # @param max_retries [Long] The number of times to retry a failed request, defaults to 2.
    # @param timeout_in_seconds [Long] 
    # @return [DevinClassNameTest::Client]
    def initialize(base_url: nil, max_retries: nil, timeout_in_seconds: nil)
      @request_client = DevinClassNameTest::RequestClient.new(
  base_url: base_url,
  max_retries: max_retries,
  timeout_in_seconds: timeout_in_seconds
)
      @imdb = DevinClassNameTest::ImdbClient.new(request_client: @request_client)
    end
  end
  class AsyncClient
  # @return [DevinClassNameTest::AsyncImdbClient] 
    attr_reader :imdb


    # @param base_url [String] 
    # @param max_retries [Long] The number of times to retry a failed request, defaults to 2.
    # @param timeout_in_seconds [Long] 
    # @return [DevinClassNameTest::AsyncClient]
    def initialize(base_url: nil, max_retries: nil, timeout_in_seconds: nil)
      @async_request_client = DevinClassNameTest::AsyncRequestClient.new(
  base_url: base_url,
  max_retries: max_retries,
  timeout_in_seconds: timeout_in_seconds
)
      @imdb = DevinClassNameTest::AsyncImdbClient.new(request_client: @async_request_client)
    end
  end
end