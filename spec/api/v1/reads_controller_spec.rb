require 'rails_helper'

describe Api::V1::ReadsController do
  context "create" do
    it "creates a read and renders it in json" do

      post api_v1_reads_path, headers: {'HTTP_URL': "some_url"}

      expect(Read.first.url).to eq("some_url")
    end
  end
end
