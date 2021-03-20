class PraysController < ApplicationController
  before_action :authenticate_user!
  before_action :set_pray, only: %i[ show edit update destroy donations]

  # GET /prays or /prays.json
  def index
    @prays = Pray.all
  end

  # GET /prays/1 or /prays/1.json
  def show
    @current_request = @pray.pray_requests.order(created_at: :desc).first if @pray.pray_requests.any?
    @recent_donations = @pray.pray_donations.last(10)
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "Pray No.#{@pray.id}",
        page_size: 'A4',
        template: "prays/show.pdf.erb",
        layout: "pdf.html",
        zoom: 1,
        dpi: 75
      end
    end
  end

  # GET /prays/new
  def new
    @pray = Pray.new
  end

  # GET /prays/1/edit
  def edit
    @edit_donations = (params[:mode] == "donations")
  end

  # POST /prays or /prays.json
  def create
    @pray = Pray.new(pray_params)

    respond_to do |format|
      if @pray.save
        format.html { redirect_to @pray, notice: "Pray was successfully created." }
        format.json { render :show, status: :created, location: @pray }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @pray.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /prays/1 or /prays/1.json
  def update
    respond_to do |format|
      if @pray.update(pray_params)
        format.html { redirect_to @pray, notice: "Pray was successfully updated." }
        format.json { render :show, status: :ok, location: @pray }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @pray.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /prays/1 or /prays/1.json
  def destroy
    @pray.destroy
    respond_to do |format|
      format.html { redirect_to prays_url, notice: "Pray was successfully destroyed." }
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pray
      @pray = Pray.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def pray_params
      params.require(:pray).permit(:temple_id, :buddha_id, :believer_id, :donator, 
        :prayerRelation, :prayerName, :prayerBirthyear, :prayerAddress, :prayerPhone, 
        :startDay, :finishDay, :fullPayDay, :isPrayFinished, :isFinishConfirmed, :remarks,
        pray_requests_attributes:[:id, :pray_id, :requestDay, :request, :remarks], 
        pray_donations_attributes:[:id, :_destroy, :pray_id, :donateDay, :donation, :remarks])
    end
end
