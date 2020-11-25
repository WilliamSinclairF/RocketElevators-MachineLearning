require 'webmock/rspec'
WebMock.disable_net_connect!(allow_localhost: true)

RSpec.configure do |config|
  config.before(:each) do
    stub_request(:get, /api.openweathermap.org/).with(
      headers: { 'Accept' => '*/*', 'User-Agent' => 'Ruby' }
    ).to_return(status: 200, body: 'stubbed response ', headers: {})
  end
end
