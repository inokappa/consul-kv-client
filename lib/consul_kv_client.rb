require "consul_kv_client/version"
require "consul_kv_client/kv_client"

module ConsulKvClient
  class << self
    def run(args)
      list = KvClient.new(args)
      puts list.listkv
    end
  end
end
