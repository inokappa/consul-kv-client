require "spec_helper"

RSpec.describe ConsulKvClient::KvClient do
  describe "# No KVS data" do
    before do
      system("curl -s -X DELETE http://localhost:8500/v1/kv/?recurse 2>&1 > /dev/null")
    end
    context "access KVS" do
      subject { ConsulKvClient::KvClient.new(["127.0.0.1:8500"]).http_request }
      it "http_request response expect NilClass" do
        expect(subject.class).to eq NilClass
      end
    end
    context "list KVS" do
      subject { ConsulKvClient::KvClient.new(["127.0.0.1:8500"]).listkv }
      it "listkv response expect NilClass" do
        expect(subject.class).to eq NilClass
      end
    end
  end

  describe "# KVS data exists" do
    before do
      system("curl -s -X PUT -d 'bar' http://localhost:8500/v1/kv/foo/key1 2>&1 > /dev/null")
    end
    context "access KVS" do
      subject { ConsulKvClient::KvClient.new(["127.0.0.1:8500"]).http_request }
      it "http_request response expect StringIO Class" do
        expect(subject.class).to eq StringIO
      end
    end

    context "list KVS" do
      subject { ConsulKvClient::KvClient.new(["127.0.0.1:8500"]).listkv }
      it "listkv response expect Teminal Table Class" do
        expect(subject.class).to eq Terminal::Table
      end
    end

    context "No argument access KVS" do
      subject { ConsulKvClient::KvClient.new([""]).http_request }
      it "http_request response expect NilClass" do
        expect(subject.class).to eq NilClass
      end
    end

    context "No argument list KVS" do
      subject { ConsulKvClient::KvClient.new([""]).listkv }
      it "listkv response expect NilClass" do
        expect(subject.class).to eq NilClass
      end
    end

  end
end
