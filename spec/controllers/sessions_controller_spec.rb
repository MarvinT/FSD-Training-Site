require 'spec_helper'

describe SessionsController do
  before :each do
    request.env['omniauth.auth'] = {'info'=> {'email' => "hi@hi.com"}}


  end

  it 'should redirect to home if a user is authenticated as an admin' do

    controller.stub(:admin?).and_return(true)
    get :authenticate_admin
    response.should redirect_to("/")
  end

  it 'should return a 401 status if the user is not authenticated as an admin' do
     controller.stub(:admin?).and_return(false)
     get :authenticate_admin
    response.response_code.should == 401

  end


end
