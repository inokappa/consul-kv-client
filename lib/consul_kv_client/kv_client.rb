module ConsulKvClient
  class KvClient

    def initialize(args)
      require 'rest-client'
      require 'json'
      require 'base64'
      require 'terminal-table'
      @args = args
    end

    def http_request
      begin
        res = RestClient.get 'http://' + @args[0] + '/v1/kv/?recurse'
      #rescue => ex
      #  puts(ex.message)
      ensure
        return res
      end
    end

    def listkv
      if http_request != nil
        rows = []
        JSON.parse(http_request).each do |value|
          if value['Value'] == nil
            rows << ["#{value['Key']}" ,"#{value['Value']}"]
          else
            rows << ["#{value['Key']}" ,"#{Base64.decode64(value['Value'])}"]
          end
        end
      end

      if rows != nil
        table = Terminal::Table.new :headings => ['Key', 'Value'], :rows => rows
        puts table
      end
    end

    def putkv
      begin
        puts 'Action: ' + @args[1]
        puts 'Key: ' + @args[2]
        puts 'Value: ' + @args[3]
        res = RestClient.put 'http://' + @args[0] + '/v1/kv/' + @args[2], @args[3], :content_type => 'text/plain'
        puts res 
      rescue => e
        puts (e.message)
      end
    end

    def deletekv
      begin
        puts 'Action: ' + @args[1]
        puts 'Key: ' + @args[2]
        res = RestClient.delete 'http://' + @args[0] + '/v1/kv/' + @args[2]
        puts res
      rescue => e
        puts (e.message)
     end
    end

  end
end
