class HomeController < ApplicationController
before_action :forbid_login_user, {only: [:new, :create, :login_form, :login]}



  def top
  end



end
