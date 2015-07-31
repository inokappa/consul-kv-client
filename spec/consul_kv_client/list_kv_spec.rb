require "spec_helper"

RSpec.describe ConsulKvClient::KvClient do
  describe "No KVS data" do
    before do
      system("curl -s -X DELETE http://localhost:8500/v1/kv/foo/key1 2>&1 > /dev/null")
    end
    context "access KVS" do
      subject { ConsulKvClient::KvClient.new(["127.0.0.1:8500"]).http_request }
      it "http_request expect nil" do
        expect(subject.class).to eq NilClass
      end
    end

    context "list KVS" do
      subject { ConsulKvClient::KvClient.new(["127.0.0.1:8500"]).listkv }
      it "listkv expect nil" do
        expect(subject.class).to eq NilClass
      end
    end
  end

  describe "KVS data exists" do
    before do
      system("curl -s -X PUT -d 'bar' http://localhost:8500/v1/kv/foo/key1 2>&1 > /dev/null")
    end
    context "access KVS" do
      subject { ConsulKvClient::KvClient.new(["127.0.0.1:8500"]).http_request }
      it "http_request expect StringIO" do
        expect(subject.class).to eq StringIO
      end
    end

    context "list KVS" do
      subject { ConsulKvClient::KvClient.new(["127.0.0.1:8500"]).listkv }
      it "listkv expect nil" do
        expect(subject.class).to eq Array
      end
    end
  end

end
