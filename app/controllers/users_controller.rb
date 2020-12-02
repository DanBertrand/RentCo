class  UsersController < ApplicationController

    def index
        if params[:approved] == "false"
            @users = User.where(approved: false)
        else
            @users = User.all
        end
    end

    def show
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        if @user.update(approved: true)
            respond_to do |format|
                format.html { redirect_to users_path, notice: 'Compte utilisateur confirmé'}
                format.js { }
            end
        else
            respond_to do |format|
                format.html { redirect_to users_path, notice: 'Impossible de confirmer le compte'}
                format.js { }
            end
        end
    end
end
    