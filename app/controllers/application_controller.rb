class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  #before_action :authenticate_user!

  def welcome

  end

  def search
    # cri1 = asdjkl
    # cri2 = sadjlsa
    # lat = 1
    # lon = 1
    #
    #
    #
    # results = []
    # render 'furnitures/index'
  end
  

end
