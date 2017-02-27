require 'rails_helper'

describe Api::V1::ReadsController do
  context "create" do
    it "creates a read and renders it in json" do

      post api_v1_reads_path, headers: {'HTTP_URL': "some_url"}

      expect(Read.first.url).to eq("some_url")
    end
  end

  context "index" do
    it "renders the hottest reads around" do
      create_list(:read, 11)
      url = Read.first.url
      create(:read, url: url)

      get api_v1_reads_path
      reads = JSON.parse(response.body, symbolize_names: true)

      url_exists = reads.any? { |read| read[:url] == url }

      expect(url_exists).to eq(true)
      expect(reads.length).to eq(10)
    end
  end
end
