require 'spec_helper'

describe UsersController do

  describe '#new' do
    it 'renders the new template' do
      get :new
      response.should render_template('new')
    end
  end

  describe '#create' do
    let!(:user) { build(:user) }
    let(:params) {{
      "handle" => user.handle, 
      "email" => user.email, 
      "password" => 'blackbeard' 
    }}

    it 'should create a new user' do
      User.should_receive(:new).with(params) { user }
      post :create, :user => params
    end
    
  end

  describe '#show' do
    it 'should render the new template' do
      get :show, :id => 'foobar'
      response.should render_template('show')
    end
  end
end
