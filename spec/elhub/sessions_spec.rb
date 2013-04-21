require 'spec_helper'

describe Sessions do
  let(:options) {
    {email: ENV['EMAIL'],  password: ENV['PASSWORD']}
  }

  it 'connect to hub url and tries to login with credentials from env' do
    session = Sessions.create options

    session.email.should be
  end


  context 'session created' do
    let(:session) { Sessions.create options }


    it 'has list of projects' do
      session.project_list.should include('Camp')
    end
  end

end
