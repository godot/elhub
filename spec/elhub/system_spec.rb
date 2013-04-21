require 'spec_helper'

describe 'system' do
  it 'has set env variables' do
    ENV.should have_key('EMAIL')
  end
end
