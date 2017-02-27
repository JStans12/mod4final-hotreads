class Api::V1::ReadsController < ApplicationController

  def index
    @hot_reads = Read.hot
    render json: @hot_reads
  end

  def create
    read = Read.new(url: url)
    read.save
    render json: read, status: 200
  end

  private

  def url
    request.headers.env.detect{|k, _| k =~ /^HTTP_URL/}[1]
  end
end
