class LinkSchemasController < ApplicationController
  before_filter :get_list_dependencies, only: [:new, :edit]

  def get_list_dependencies
    @types = ArtifactType.all
  end

  # GET /link_schemas
  # GET /link_schemas.json
  def index
    @link_schemas = Project.find(session[:project_id]).link_schemas

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @link_schemas }
    end
  end

  # GET /link_schemas/1
  # GET /link_schemas/1.json
  def show
    @link_schema = LinkSchema.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @link_schema }
    end
  end

  # GET /link_schemas/new
  # GET /link_schemas/new.json
  def new
    @link_schema = LinkSchema.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @link_schema }
    end
  end

  # GET /link_schemas/1/edit
  def edit
    @link_schema = LinkSchema.find(params[:id])
  end

  # POST /link_schemas
  # POST /link_schemas.json
  def create
    @link_schema = LinkSchema.new(params[:link_schema])

    respond_to do |format|
      if @link_schema.save
        format.html { redirect_to @link_schema, notice: 'Link schema was successfully created.' }
        format.json { render json: @link_schema, status: :created, location: @link_schema }
      else
        format.html { render action: "new" }
        format.json { render json: @link_schema.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /link_schemas/1
  # PUT /link_schemas/1.json
  def update
    @link_schema = LinkSchema.find(params[:id])

    respond_to do |format|
      if @link_schema.update_attributes(params[:link_schema])
        format.html { redirect_to @link_schema, notice: 'Link schema was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @link_schema.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /link_schemas/1
  # DELETE /link_schemas/1.json
  def destroy
    @link_schema = LinkSchema.find(params[:id])
    @link_schema.destroy

    respond_to do |format|
      format.html { redirect_to link_schemas_url }
      format.json { head :no_content }
    end
  end
end
