require 'spec_helper'
require 'unicorn'

describe Miron::Handler::Unicorn do
  describe 'In general' do
    it 'inherits from WEBrick::HTTPServlet::AbstractServlet' do
      expect(Miron::Handler::Unicorn.superclass).to eq(Unicorn::HttpServer)
    end

    it 'responds to self.run' do
      expect(Miron::Handler::Unicorn).to respond_to(:run)
    end
  end

  describe 'Handler' do
    sample_unicorn_app

    it 'returns the correct HTTP body' do
      response = get
      expect(response.body).to eq('hi')
    end

    xit 'returns the correct HTTP cookies' do
      response = get
      expect(response.headers['set-cookie']).to eq('HELLO=HELLO')
    end

    it 'returns the correct HTTP headers' do
      response = get
      expect(response.headers['hello']).to eq('HELLO')
    end

    it 'returns the correct HTTP status' do
      response = get
      expect(response.code.to_i).to eq(200)
    end
  end
end
