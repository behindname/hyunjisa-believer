class PrayRequestsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_pray, only: %i[index new create]
  before_action :set_pray_request, only: %i[ show edit update destroy ]

  # GET /pray_requests or /pray_requests.json
  def index
    @pray_requests = @pray.pray_requests
  end

  # GET /pray_requests/1 or /pray_requests/1.json
  def show
  end

  # GET /pray_requests/new
  def new
    @pray_request = @pray.pray_requests.new
  end

  # GET /pray_requests/1/edit
  def edit
  end

  # POST /pray_requests or /pray_requests.json
  def create
    @pray_request = @pray.pray_requests.new(pray_request_params)

    respond_to do |format|
      if @pray_request.save
        format.html { redirect_to @pray_request, notice: "Pray request was successfully created." }
        format.json { render :show, status: :created, location: @pray_request }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @pray_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pray_requests/1 or /pray_requests/1.json
  def update
    respond_to do |format|
      if @pray_request.update(pray_request_params)
        format.html { redirect_to @pray_request, notice: "Pray request was successfully updated." }
        format.json { render :show, status: :ok, location: @pray_request }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @pray_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pray_requests/1 or /pray_requests/1.json
  def destroy
    @pray_request.destroy
    respond_to do |format|
      format.html { redirect_to pray_pray_requests_url(@pray), notice: "Pray request was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_pray
      @pray = Pray.find(params[:pray_id])
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_pray_request
      @pray_request = PrayRequest.find(params[:id])
      @pray = @pray_request.pray
    end

    # Only allow a list of trusted parameters through.
    def pray_request_params
      params.fetch(:pray_request, {}).permit(:pray_id, :requestDay, :request, :remarks)
    end
end
