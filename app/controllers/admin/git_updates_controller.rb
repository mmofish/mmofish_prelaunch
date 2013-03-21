class Admin::GitUpdatesController < ApplicationController
  # GET /admin/git_updates
  # GET /admin/git_updates.json
  def index
    @admin_git_updates = Admin::GitUpdate.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @admin_git_updates }
    end
  end

  # GET /admin/git_updates/1
  # GET /admin/git_updates/1.json
  def show
    @admin_git_update = Admin::GitUpdate.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @admin_git_update }
    end
  end

  # GET /admin/git_updates/new
  # GET /admin/git_updates/new.json
  def new
    @admin_git_update = Admin::GitUpdate.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @admin_git_update }
    end
  end

  # GET /admin/git_updates/1/edit
  def edit
    @admin_git_update = Admin::GitUpdate.find(params[:id])
  end

  # POST /admin/git_updates
  # POST /admin/git_updates.json
  def create
    @admin_git_update = Admin::GitUpdate.new(params[:admin_git_update])

    respond_to do |format|
      if @admin_git_update.save
        format.html { redirect_to @admin_git_update, notice: 'Git update was successfully created.' }
        format.json { render json: @admin_git_update, status: :created, location: @admin_git_update }
      else
        format.html { render action: "new" }
        format.json { render json: @admin_git_update.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /admin/git_updates/1
  # PUT /admin/git_updates/1.json
  def update
    @admin_git_update = Admin::GitUpdate.find(params[:id])

    respond_to do |format|
      if @admin_git_update.update_attributes(params[:admin_git_update])
        format.html { redirect_to @admin_git_update, notice: 'Git update was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @admin_git_update.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/git_updates/1
  # DELETE /admin/git_updates/1.json
  def destroy
    @admin_git_update = Admin::GitUpdate.find(params[:id])
    @admin_git_update.destroy

    respond_to do |format|
      format.html { redirect_to admin_git_updates_url }
      format.json { head :no_content }
    end
  end
end
