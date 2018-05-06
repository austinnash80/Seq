class UpdatesheetsController < ApplicationController
  before_action :set_updatesheet, only: [:show, :edit, :update, :destroy]
  helper_method :sort_column, :sort_direction #Sortable column headers

  # GET /updatesheets
  # GET /updatesheets.json
  def index
    #Sortable column headers
    @updatesheets = Updatesheet.order(sort_column + " " + sort_direction)

    # .sort_by { |e| [ e == 'chicken' ? 0 : e == 'beef' ? 1 : 2, e ] }
  end

  # GET /updatesheets/1
  # GET /updatesheets/1.json
  def show
  end

  # GET /updatesheets/new
  def new
    @updatesheet = Updatesheet.new
  end

  # GET /updatesheets/1/edit
  def edit
  end

  # POST /updatesheets
  # POST /updatesheets.json
  def create
    @updatesheet = Updatesheet.new(updatesheet_params)

    respond_to do |format|
      if @updatesheet.save
        format.html { redirect_to @updatesheet, notice: 'Updatesheet was successfully created.' }
        format.json { render :show, status: :created, location: @updatesheet }
      else
        format.html { render :new }
        format.json { render json: @updatesheet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /updatesheets/1
  # PATCH/PUT /updatesheets/1.json
  def update
    respond_to do |format|
      if @updatesheet.update(updatesheet_params)
        format.html { redirect_to @updatesheet, notice: 'Updatesheet was successfully updated.' }
        format.json { render :show, status: :ok, location: @updatesheet }
      else
        format.html { render :edit }
        format.json { render json: @updatesheet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /updatesheets/1
  # DELETE /updatesheets/1.json
  def destroy
    @updatesheet.destroy
    respond_to do |format|
      format.html { redirect_to updatesheets_url, notice: 'Updatesheet was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def same_values?
    self.uniq.length == 1
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_updatesheet
      @updatesheet = Updatesheet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def updatesheet_params
      params.require(:updatesheet).permit(:seq_version, :pes_number, :pes_version, :date_received, :update_course, :new_course, :note_approval, :text_complete, :exam_complete, :course_listed, :date_listed, :role, :rolep, :irs_number, :proofed, :proofed_note, :hold, :datasheet_id)
    end

    #sortable column headers - set the default
    def sort_column
      params[:sort] || 'date_received'
    end

    def sort_direction
      params[:direction] || 'asc'
    end


end
