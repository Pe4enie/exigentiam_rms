class AttachmentsController < ApplicationController
  def index
    @attachments = Attachment.where('project_id = ? and artifact_id = ?', session[:project_id], session[:artifact_id])
    render json: @attachments.collect { |p| p.to_jq_upload }.to_json
  end

  def create
    @attachment = Attachment.new(params[:attachment])

    @attachment.artifact_id = session[:artifact_id]
    @attachment.project = Project.find(session[:project_id])
    @attachment.user = current_user

    if @attachment.save
      respond_to do |format|
        format.html {
          render json: [@attachment.to_jq_upload].to_json,
                 content_type: 'text/html',
                 layout: false
        }
        format.json {
          render json: {files: [@attachment.to_jq_upload]}, status: :created, location: @attachment
        }
      end
    else
      render json: [{:error => 'custom_failure'}], :status => 304
    end
  end

  def destroy
    @attachment = Attachment.find(params[:id])
    @attachment.destroy
    render json: true
  end
end
