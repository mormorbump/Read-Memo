# frozen_string_literal: true

class HomeController < ApplicationController
  before_action :forbid_login_user, { only: %i[new create login_form login] }

  def top; end
end
