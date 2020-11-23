require 'elevator_media'

describe ElevatorMedia::Streamer do
  before(:each) { @test = described_class.new }
  it 'returns a valid HTML string' do
    expect(@test.getContent('div', 'hello')).to eq('<div>hello</div>')
  end
end
