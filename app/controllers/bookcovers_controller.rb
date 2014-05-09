class BookcoversController < ApplicationController
  # before_action :set_bookcover, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:show, :edit, :update, :destroy]

  # GET /bookcovers
  # GET /bookcovers.json
  def index
    @bookcovers = Bookcover.all
  end

  # GET /bookcovers/1
  # GET /bookcovers/1.json
  def show
    @my_uploads = current_user.bookcovers.load.page(params[:page]).per(12)
  end

  # GET /bookcovers/new
  def new
    @bookcover = Bookcover.new
  end

  # GET /bookcovers/1/edit
  def edit
    @my_edit = Bookcover.find(params[:id])
  end

  # POST /bookcovers
  # POST /bookcovers.json
  def create
    @bookcover = current_user.bookcovers.build(bookcover_params)

    respond_to do |format|
      if @bookcover.save

        format.html { redirect_to my_uploads_bookcovers_path(current_user.username), notice: 'Bookcover was successfully created.' }
        format.json { render action: 'show', status: :created, location: @bookcover }
      else
        format.html { render action: 'new' }
        format.json { render json: @bookcover.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bookcovers/1
  # PATCH/PUT /bookcovers/1.json
  def update
    respond_to do |format|
      if @bookcover.update(bookcover_params)
        format.html { redirect_to @bookcover, notice: 'Bookcover was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @bookcover.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bookcovers/1
  # DELETE /bookcovers/1.json
  def destroy
    @bookcover.destroy
    respond_to do |format|
      format.html { redirect_to my_uploads_bookcovers_path(current_user.username) }
      format.json { head :no_content }
    end
  end

  # convert meta tags into array
  def meta_tags_to_array
    self.ingredients.gsub(/(\[\"|\"\])/, '').split('" "').split('", "')
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bookcover
      @bookcover = Bookcover.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bookcover_params
      params.require(:bookcover).permit(:meta_tags, :user_id, :description, :cover, :remote_cover_url)
    end
end
