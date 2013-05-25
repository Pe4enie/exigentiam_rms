class ArtifactsController < ApplicationController
  before_filter :get_list_dependencies, only: [:new, :edit, :index]
  before_filter :authenticate_user!

  def get_list_dependencies
    @types = ArtifactType.all
    @statuses = ArtifactStatus.all
    @users = Project.find(session[:project_id]).users
    @projects = User.find(session[:user_id]).projects
    @artifacts = Artifact.find_all_by_project_id(session[:project_id])
  end

  def link
    schema = LinkSchema.where('project_id = ? and from_type_id = ? and to_type_id = ?',
                              session[:project_id], Artifact.find(params[:from_id]).artifact_type_id, Artifact.find(params[:id]).artifact_type).first
    if schema == nil
      redirect_to '/artifacts', flash: { error: 'Link between these artifacts is not allowed' }
      return
    end
    result = Link.create(project: session[:project_id], from_artifact_id: params[:from_id], to_artifact_id: params[:id])
    if result.errors.messages.empty?
      redirect_to '/artifacts'
    else
      redirect_to '/artifacts', flash: { error: 'There is already a link between these two artifacts' }
    end
  end

  def links
    @artifact = Artifact.find(params[:id])

    @incoming = []
    @outcoming = []

    @artifact.incoming_links.each do |incoming_link|
      @incoming << Artifact.find(incoming_link.from_artifact_id)
    end

    @artifact.incoming_links.each do |outcoming_link|
      @outcoming << Artifact.find(outcoming_link.to_artifact_id)
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @artifacts }
    end
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

    session[:artifact_id] = params[:id]

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
    @artifact.project = session[:project_id]

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

  def history
    @artifact = Artifact.find(params[:id])
    session[:return_to] ||= request.referer
    @changes = Change.find_all_by_artifact_id(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @artifact }
    end
  end

  def has_changes(old, new)
    if old.project != new.project ||
        old.artifact_type != new.artifact_type ||
        old.assignee != new.assignee ||
        old.artifact_status != new.artifact_status ||
        old.description != new.description ||
        old.parent != new.parent
      return true
    end
    return false
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
    previous = Artifact.find(params[:id])

    respond_to do |format|
      if @artifact.update_attributes(params[:artifact])
        format.html { redirect_to @artifact, notice: 'Artifact was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @artifact.errors, status: :unprocessable_entity }
      end
    end

    if has_changes(previous, @artifact)
      @artifact.update_attribute(:identifier, @artifact.artifact_type.shortening + '-' + @artifact.id.to_s)
      change = copy_to_change(@artifact)
      change.version = Change.find_last_by_artifact_id(params[:id]).version + 1
      change.save
      changes = Change.find_all_by_artifact_id(params[:id])
      if changes.count > 10
        changes.first.delete
      end
    end
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
