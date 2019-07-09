# frozen_string_literal: true

RSpec.describe Lite::Ruby do
  it 'to be a version number' do
    expect(Lite::Ruby::VERSION).not_to be nil
  end
end
