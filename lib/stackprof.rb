require "stackprof/stackprof"

module StackProf
  VERSION = '0.2.17'

  class << self
    private :_results

    def run(mode: :wall, out: nil, interval: nil, raw: nil, metadata: nil, debug: nil, &block)
      raise unless block_given?

      start(mode: mode, interval: interval, raw: raw, metadata: metadata, debug: nil)

      begin
        yield
      ensure
        stop
      end

      results out
    end

    def results(io = nil)
      _results io
    end
  end
end

StackProf.autoload :Report, "stackprof/report.rb"
StackProf.autoload :Middleware, "stackprof/middleware.rb"
