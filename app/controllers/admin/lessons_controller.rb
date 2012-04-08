class Admin::LessonsController < ApplicationController
  before_filter :admin_required
  
  def index
    render :text => 'Booooooooyah admin panel'
  end
end
