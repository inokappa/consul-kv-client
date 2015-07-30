require "consul_kv_client/version"
require "consul_kv_client/list_kv"
require 'base64'

module ConsulKvClient
  class << self
    def run(args)
      list = KvClient.new(args)
      list.listkv.each do |v|
        puts "key : #{v['Key']} / value : #{Base64.decode64(v['Value'])}"
      end
    end
  end
end
