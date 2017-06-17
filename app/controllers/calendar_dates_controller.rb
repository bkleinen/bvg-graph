class CalendarDatesController < ApplicationController
  before_action :set_calendar_date, only: [:show, :edit, :update, :destroy]

  # GET /calendar_dates
  # GET /calendar_dates.json
  def index
    @calendar_dates = CalendarDate.all
  end

  # GET /calendar_dates/1
  # GET /calendar_dates/1.json
  def show
  end

  # GET /calendar_dates/new
  def new
    @calendar_date = CalendarDate.new
  end

  # GET /calendar_dates/1/edit
  def edit
  end

  # POST /calendar_dates
  # POST /calendar_dates.json
  def create
    @calendar_date = CalendarDate.new(calendar_date_params)

    respond_to do |format|
      if @calendar_date.save
        format.html { redirect_to @calendar_date, notice: 'Calendar date was successfully created.' }
        format.json { render :show, status: :created, location: @calendar_date }
      else
        format.html { render :new }
        format.json { render json: @calendar_date.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /calendar_dates/1
  # PATCH/PUT /calendar_dates/1.json
  def update
    respond_to do |format|
      if @calendar_date.update(calendar_date_params)
        format.html { redirect_to @calendar_date, notice: 'Calendar date was successfully updated.' }
        format.json { render :show, status: :ok, location: @calendar_date }
      else
        format.html { render :edit }
        format.json { render json: @calendar_date.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /calendar_dates/1
  # DELETE /calendar_dates/1.json
  def destroy
    @calendar_date.destroy
    respond_to do |format|
      format.html { redirect_to calendar_dates_url, notice: 'Calendar date was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_calendar_date
      @calendar_date = CalendarDate.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def calendar_date_params
      params.require(:calendar_date).permit(:service_identifier, :date, :exception_type)
    end
end
