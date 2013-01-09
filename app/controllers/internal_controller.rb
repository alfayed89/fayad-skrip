class InternalController < ApplicationController
  before_filter do
    authenticate_karyawan!
  end
  
  load_and_authorize_resource

  rescue_from CanCan::AccessDenied do |exception|
     flash[:alert] = exception.message
     render :action => :forbidden
  end

  
  
end