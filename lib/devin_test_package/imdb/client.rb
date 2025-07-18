# frozen_string_literal: true
require_relative "../../requests"
require_relative "types/create_movie_request"
require "json"
require_relative "types/movie"
require "async"
require "async"
require_relative "../../requests"

module DevinClassNameTest
  class ImdbClient
  # @return [DevinClassNameTest::RequestClient] 
    attr_reader :request_client


    # @param request_client [DevinClassNameTest::RequestClient] 
    # @return [DevinClassNameTest::ImdbClient]
    def initialize(request_client:)
      @request_client = request_client
    end
# Add a movie to the database
    #
    # @param request [Hash] Request of type DevinClassNameTest::Imdb::CreateMovieRequest, as a Hash
    #   * :title (String) 
    #   * :rating (Float) 
    # @param request_options [DevinClassNameTest::RequestOptions] 
    # @return [String]
    # @example
#  api = DevinClassNameTest::Client.new(base_url: "https://api.example.com")
#  api.imdb.create_movie(request: { title: "title", rating: 1.1 })
    def create_movie(request:, request_options: nil)
      response = @request_client.conn.post do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/movies/create-movie"
end
      parsed_json = JSON.parse(response.body)
      parsed_json
    end
# Retrieve a movie from the database based on the ID
    #
    # @param id [String] 
    # @param request_options [DevinClassNameTest::RequestOptions] 
    # @return [DevinClassNameTest::Imdb::Movie]
    # @example
#  api = DevinClassNameTest::Client.new(base_url: "https://api.example.com")
#  api.imdb.get_movie(id: "tt0111161")
    def get_movie(id:, request_options: nil)
      response = @request_client.conn.get do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/movies/#{id}"
end
      DevinClassNameTest::Imdb::Movie.from_json(json_object: response.body)
    end
  end
  class AsyncImdbClient
  # @return [DevinClassNameTest::AsyncRequestClient] 
    attr_reader :request_client


    # @param request_client [DevinClassNameTest::RequestClient] 
    # @return [DevinClassNameTest::AsyncImdbClient]
    def initialize(request_client:)
      @request_client = request_client
    end
# Add a movie to the database
    #
    # @param request [Hash] Request of type DevinClassNameTest::Imdb::CreateMovieRequest, as a Hash
    #   * :title (String) 
    #   * :rating (Float) 
    # @param request_options [DevinClassNameTest::RequestOptions] 
    # @return [String]
    # @example
#  api = DevinClassNameTest::Client.new(base_url: "https://api.example.com")
#  api.imdb.create_movie(request: { title: "title", rating: 1.1 })
    def create_movie(request:, request_options: nil)
      Async do
        response = @request_client.conn.post do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/movies/create-movie"
end
        parsed_json = JSON.parse(response.body)
        parsed_json
      end
    end
# Retrieve a movie from the database based on the ID
    #
    # @param id [String] 
    # @param request_options [DevinClassNameTest::RequestOptions] 
    # @return [DevinClassNameTest::Imdb::Movie]
    # @example
#  api = DevinClassNameTest::Client.new(base_url: "https://api.example.com")
#  api.imdb.get_movie(id: "tt0111161")
    def get_movie(id:, request_options: nil)
      Async do
        response = @request_client.conn.get do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/movies/#{id}"
end
        DevinClassNameTest::Imdb::Movie.from_json(json_object: response.body)
      end
    end
  end
end