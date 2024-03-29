class OfferingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_offering, only: %i[ show edit update destroy ]

  # GET /offerings or /offerings.json
  def index
    @offerings = Offering.all
    @offerings = @offerings.ransack(believer_name_or_offerorName_or_donator_cont: params[:q]).result(distinct: true) if params[:q].present?
    @offerings = @offerings.where(temple_id: params[:temple_id]) if params[:temple_id].present?
    @offerings = @offerings.order(created_at: :desc).page(params[:page])
  end

  # GET /offerings/1 or /offerings/1.json
  def show
  end

  # GET /offerings/new
  def new
    @offering = Offering.new
  end

  # GET /offerings/1/edit
  def edit
  end

  # POST /offerings or /offerings.json
  def create
    @offering = Offering.new(offering_params)

    respond_to do |format|
      if @offering.save
        format.html { redirect_to @offering, notice: "Offering was successfully created." }
        format.json { render :show, status: :created, location: @offering }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @offering.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /offerings/1 or /offerings/1.json
  def update
    respond_to do |format|
      if @offering.update(offering_params)
        format.html { redirect_to @offering, notice: "Offering was successfully updated." }
        format.json { render :show, status: :ok, location: @offering }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @offering.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /offerings/1 or /offerings/1.json
  def destroy
    @offering.destroy
    respond_to do |format|
      format.html { redirect_to offerings_url, notice: "Offering was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_offering
      @offering = Offering.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def offering_params
      params.require(:offering).permit(:temple_id, :buddha_id, :believer_id, :donator, :offerorRelation, :offerorName, :offerorBirthyear, :offerorAddress, :offerorPhone, :offerDay, :request, :remarks)
    end
end
