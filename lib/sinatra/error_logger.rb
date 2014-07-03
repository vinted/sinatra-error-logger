module Sinatra
  class ErrorLogger < Struct.new(:app, :logger)
    VERSION = "0.0.1"

    def call(env)
      status, headers, body = app.call(env)
      log_error(env)
      [status, headers, body]
    end

    def log_error(env)
      exception = env['sinatra.error']
      return unless exception

      logger.error(format_message(exception, env))
    end

    def format_message(exception, env)
      method = env['REQUEST_METHOD']
      uri = env['REQUEST_URI']
      backtrace = exception.backtrace.join("\n")

      "[#{method} #{uri}] #{exception.inspect}:\n#{backtrace}"
    end
  end
end
