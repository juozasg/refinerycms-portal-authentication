module Refinery
  class UsersController < Devise::RegistrationsController

    # Protect these actions behind an admin login
    before_filter :redirect?, :only => [:new, :create]

    helper Refinery::Core::Engine.helpers
    helper_method :refinery_users_exist?
    layout 'refinery/layouts/login'

    def new
      @user = User.new
    end

    def show
      @user = User.find(params[:id])
    end

    # This method should only be used to create the first Refinery user.
    def create
      @user = User.new(params[:user])
      if !refinery_users_exist?
        @user.create_first
      else
        @user.save
      end

      if @user.valid?
        flash[:message] = "<strong>#{t('welcome', :scope => 'refinery.users.create', :who => @user.username).gsub(/\.$/, '')}.</strong>".html_safe

        sign_in(@user)
        redirect_back_or_default(refinery.root_path)
      else
        render :new
      end
    end

    protected

    def redirect?
      redirect_to refinery.admin_users_path if refinery_user?
    end

    def refinery_users_exist?
      Refinery::Role[:refinery].users.any?
    end

  end
end
