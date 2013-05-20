class ArtifactStatusesController < ApplicationController
  # GET /artifact_statuses
  # GET /artifact_statuses.json
  def index
    @artifact_statuses = ArtifactStatus.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @artifact_statuses }
    end
  end

  # GET /artifact_statuses/1
  # GET /artifact_statuses/1.json
  def show
    @artifact_status = ArtifactStatus.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @artifact_status }
    end
  end

  # GET /artifact_statuses/new
  # GET /artifact_statuses/new.json
  def new
    @artifact_status = ArtifactStatus.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @artifact_status }
    end
  end

  # GET /artifact_statuses/1/edit
  def edit
    @artifact_status = ArtifactStatus.find(params[:id])
  end

  # POST /artifact_statuses
  # POST /artifact_statuses.json
  def create
    @artifact_status = ArtifactStatus.new(params[:artifact_status])

    respond_to do |format|
      if @artifact_status.save
        format.html { redirect_to @artifact_status, notice: 'Artifact status was successfully created.' }
        format.json { render json: @artifact_status, status: :created, location: @artifact_status }
      else
        format.html { render action: "new" }
        format.json { render json: @artifact_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /artifact_statuses/1
  # PUT /artifact_statuses/1.json
  def update
    @artifact_status = ArtifactStatus.find(params[:id])

    respond_to do |format|
      if @artifact_status.update_attributes(params[:artifact_status])
        format.html { redirect_to @artifact_status, notice: 'Artifact status was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @artifact_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /artifact_statuses/1
  # DELETE /artifact_statuses/1.json
  def destroy
    @artifact_status = ArtifactStatus.find(params[:id])
    @artifact_status.destroy

    respond_to do |format|
      format.html { redirect_to artifact_statuses_url }
      format.json { head :no_content }
    end
  end
end
