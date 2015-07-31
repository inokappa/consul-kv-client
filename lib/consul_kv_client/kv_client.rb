module ConsulKvClient
  class KvClient

    def initialize(args)
      require 'open-uri'
      require 'json'
      require 'base64'
      require 'terminal-table'
      @args = args
    end

    def http_request
      begin
        uri = 'http://' + @args[0] + '/v1/kv/?recurse'
        res = open(uri)
        code, message = res.status
      #rescue => ex
      #  puts(ex.message)
      ensure
        return res
      end
    end

    def listkv
      if http_request != nil
        rows = []
        JSON.parse(http_request.read).each do |value|
          rows << ["#{value['Key']}" ,"#{Base64.decode64(value['Value'])}"]
        end
      end

      if rows != nil
        table = Terminal::Table.new :headings => ['Key', 'Value'], :rows => rows
        # puts table
      end
    end

  end
end
