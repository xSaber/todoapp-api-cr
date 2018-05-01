module Kemal
  class InitHandler
    def call(context : HTTP::Server::Context)
      context.response.content_type = "text/html" unless context.response.headers.has_key?("Content-Type")
      call_next context
    end

    # def call(context : HTTP::Server::Context)
    #   context.response.headers.add "X-Powered-By", "Kemal"
    #   context.response.content_type = "text/html" unless context.response.headers.has_key?("Content-Type")
    #   call_next context
    # end
  end
end
