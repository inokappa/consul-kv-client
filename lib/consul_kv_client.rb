require "consul_kv_client/version"
require "consul_kv_client/kv_client"

module ConsulKvClient
  class << self
    def run(args)
      client = KvClient.new(args)
      if args[1] == 'list'
        client.listkv
      elsif args[1] == 'put'
        client.putkv
      elsif args[1] == 'delete'
        client.deletekv
      end
    end
  end
end
