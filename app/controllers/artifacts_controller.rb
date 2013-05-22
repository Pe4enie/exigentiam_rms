class ArtifactsController < ApplicationController
  before_filter :get_list_dependencies, only: [:new, :edit]

  def get_list_dependencies
    @types = ArtifactType.all
    @statuses = ArtifactStatus.all
    @users = Project.find(session[:project_id]).users
    @projects = User.find(session[:user_id]).projects
    @artifacts = Artifact.find_all_by_project_id(session[:project_id])
  end

  # GET /artifacts
  # GET /artifacts.json
  def index
    @artifacts = Artifact.where('project_id = ?', session[:project_id])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @artifacts }
    end
  end

  # GET /artifacts/1
  # GET /artifacts/1.json
  def show
    @artifact = Artifact.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @artifact }
    end
  end

  # GET /artifacts/new
  # GET /artifacts/new.json
  def new
    @artifact = Artifact.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @artifact }
    end
  end

  # GET /artifacts/1/edit
  def edit
    @artifact = Artifact.find(params[:id])
  end

  # POST /artifacts
  # POST /artifacts.json
  def create
    @artifact = Artifact.new(params[:artifact])
    @artifact.project_id = session[:project_id]

    change = copy_to_change(@artifact)
    change.version = 1

    respond_to do |format|
      if @artifact.save && change.save
        format.html { redirect_to @artifact, notice: 'Artifact was successfully created.' }
        format.json { render json: @artifact, status: :created, location: @artifact }
      else
        format.html { render action: "new" }
        format.json { render json: @artifact.errors, status: :unprocessable_entity }
      end
    end

    @artifact.identifier = @artifact.artifact_type.shortening + '-' + @artifact.id.to_s
    @artifact.save
  end

  def copy_to_change(artifact)
    change = Change.new
    change.project = artifact.project
    change.artifact = artifact
    change.changer = User.find(session[:user_id])
    change.artifact_type = artifact.artifact_type
    change.assignee = artifact.assignee
    change.artifact_status = artifact.artifact_status
    change.description = artifact.description
    change.parent = artifact.parent
    return change
  end

  # PUT /artifacts/1
  # PUT /artifacts/1.json
  def update
    @artifact = Artifact.find(params[:id])

    respond_to do |format|
      if @artifact.update_attributes(params[:artifact])
        format.html { redirect_to @artifact, notice: 'Artifact was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @artifact.errors, status: :unprocessable_entity }
      end
    end

    change = copy_to_change(@artifact)
    change.version = Change.find_last_by_artifact_id(params[:id]).version + 1
    change.save
  end

  # DELETE /artifacts/1
  # DELETE /artifacts/1.json
  def destroy
    @artifact = Artifact.find(params[:id])
    @artifact.destroy

    respond_to do |format|
      format.html { redirect_to artifacts_url }
      format.json { head :no_content }
    end
  end
end
