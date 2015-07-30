require "spec_helper"

RSpec.describe ConsulKvClient::KvClient do
  describe "#listkv" do
    context "access KVS" do
      subject { ConsulKvClient::KvClient.new(["127.0.0.1:8500"]).listkv }
      it { expect(subject).to be true }
    end
  end
end
