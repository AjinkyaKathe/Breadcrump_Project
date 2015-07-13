class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

add_breadcrumb "Add New User", :new_user_path



  # GET /users
  # GET /users.json
  def index
  @users = User.all
  add_breadcrumb "View All", :user_path
  end

  # GET /users/1
  # GET /users/1.json
  def show
    add_breadcrumb "View ", :user_path ,:title =>"View"
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    add_breadcrumb "Edit User" , :edit_user_path
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


    def more_details
       @more_detail=MoreDetail.new
      add_breadcrumb "Add More Details" , more_details_users_path(@more_detail) 
     
    end
 
    def upload_more_details
      @more_detail=MoreDetail.new(more_params)
        respond_to do |format|
          if @more_detail.save
            format.html {redirect_to users_path, notice: 'More Details Saved'}
          else
            format.html {render :more_details}
          end 
       end
    end

    def more_params
       params.require(:more_detail).permit(:blood_group, :emergency_contact_1, :country, :state , :city, :pic)
    end

    def show_more_details
     @more_detail=MoreDetail.find(params[:id])
    end

    def custome_show
       @user=User.all
       @more_detail=MoreDetail.all
    end

    def selected_user
        @selceted_user = User.selceted_user
    end

    def custome_method
        @custome_method_users = User.where("name = ?" , params[:result])
        redirect_to @custome_method_users
     end
    

 

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :contact, :emial, :gender)
    end

    
end
