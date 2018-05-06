class DatasheetsController < ApplicationController
  before_action :set_datasheet, only: [:show, :edit, :update, :destroy]
  helper_method :sort_column, :sort_direction #Sortable column headers

  # GET /datasheets
  # GET /datasheets.json
  def index
    #sort th table - sort_column and sort_direction are defined below in private
    @datasheets = Datasheet.order(sort_column + " " + sort_direction)

    # not needed with new search
    # if params[:seq_number]
    #   @datasheets = Datasheet.where(seq_number: params[:seq_number])
    #
    # elsif params[:pes_number]
    #   @datasheets = Datasheet.where(pes_number: params[:pes_number])
    # else
    #   @datasheets = Datasheet.order(:seq_number)
    # end

    respond_to do |format|
      format.html
      format.csv { send_data @datasheets.to_csv, filename: "datasheet-#{Date.today}.csv" }
    end

  end

  # GET /datasheets/1
  # GET /datasheets/1.json
  def show
  end

  # GET /datasheets/new
  def new
    @datasheet = Datasheet.new
  end

  # GET /datasheets/1/edit
  def edit
  end

  # POST /datasheets
  # POST /datasheets.json
  def create
    @datasheet = Datasheet.new(datasheet_params)

    respond_to do |format|
      if @datasheet.save
        format.html { redirect_to @datasheet, notice: 'Datasheet was successfully created.' }
        format.json { render :show, status: :created, location: @datasheet }
      else
        format.html { render :new }
        format.json { render json: @datasheet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /datasheets/1
  # PATCH/PUT /datasheets/1.json
  def update
    respond_to do |format|
      if @datasheet.update(datasheet_params)
        format.html { redirect_to @datasheet, notice: 'Datasheet was successfully updated.' }
        format.json { render :show, status: :ok, location: @datasheet }
      else
        format.html { render :edit }
        format.json { render json: @datasheet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /datasheets/1
  # DELETE /datasheets/1.json
  def destroy
    @datasheet.destroy
    respond_to do |format|
      format.html { redirect_to datasheets_url, notice: 'Datasheet was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def import
    Datasheet.import(params[:file])
    redirect_to datasheets_path, notice: "Upload Complete"

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_datasheet
      @datasheet = Datasheet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def datasheet_params
      params.require(:datasheet).permit(:seq_number, :seq_version, :category, :seq_title, :hours, :pub_date, :seq_update, :seq_original_list, :active, :drop_date, :drop_reason, :pes_number, :pes_version, :pes_listed, :needs_approval, :has_approval, :approval_info, :course_note, :extra_note, :extra_boolean)
    end

    #sortable column headers - set the default
    def sort_column
      params[:sort] || 'seq_number'
    end

    def sort_direction
      params[:direction] || 'asc'
    end
end
