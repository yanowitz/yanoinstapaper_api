require 'yanoinstapaper_api/version'
require 'faraday'
require 'faraday/oauth'

module YanoInstapaper
  class APINamespaceProxy
    def initialize( namespace, instapaper )
      @namespace = namespace
      @instapaper = instapaper
    end

    def method_missing( *args )
      api_end_point = args.shift
      self.class.send(:define_method, api_end_point) do |*api_args|
        @instapaper.access( "#{@namespace}/#{api_end_point}", api_args.shift )
      end
      self.send api_end_point, args.shift
    end
  end

  class API
    attr_accessor :options
    def initialize(options={})
      @options = {
        :ssl => {:verify => false}, # why false?!
        :url => 'https://www.instapaper.com/api/1/'
      }.merge(options)
      @namespace_proxy_cache = {}
    end

    # invoked like: instapaper.bookmarks.list
    #  instapaper (this class) gets "bookmarks" and returns a meta object, which then gets "list"
    def method_missing( *args )
      namespace = args.shift
      @namespace_proxy_cache[namespace] ||= APINamespaceProxy.new(namespace.to_s, self)
    end

    def authenticate( options )
      if @options[:consumer_key] && @options[:consumer_secret]
        # in full mode
        result = connection.post 'oauth/access_token' do |post| 
          post.body = { 
            :x_auth_username => options[:username], 
            :x_auth_password => options[:password], 
            :x_auth_mode => "client_auth" 
          }
        end
      else
        # in simple mode, validate these are good and then just store them internally for future requests
        connection.post 'authenticate', options
      end
    end

    def access(method, body = nil)
      result = connection.post(method) do |post|
        post.body = body if body
      end
      
      return result.body
    end

    def connection
      
    end
  end
end
