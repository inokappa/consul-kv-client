module ConsulKvClient
  class KvClient

    def initialize(args)
      require 'open-uri'
      require 'json'
      @args = args
    end

    def listkv
      uri = 'http://' + @args[0] + '/v1/kv/?recurse'
      res = open(uri)
      code, message = res.status
      if code == '200'
        JSON.parse(res.read)
      else
        puts "error #{code} / #{message}"
      end
    end

  end
end
