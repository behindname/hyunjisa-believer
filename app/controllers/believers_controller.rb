class BelieversController < ApplicationController
  before_action :authenticate_user!
  before_action :set_believer, only: %i[ show edit update destroy ]

  # GET /believers or /believers.json
  def index
    @believers = Believer.all
    if params[:search].present?
      #For select2 f.select search
      @believers = Believer.ransack(name_cont: params[:search].to_s.strip).result.limit(5)
      return
    end
    @believers = @believers.ransack(name_or_dharmaName_or_ganzhi_or_addressDetail_or_phone_cont: params[:q]).result(distinct: true) if params[:q].present?
    @believers = @believers.where(temple_id: params[:temple_id]) if params[:temple_id].present?
    @believers = @believers.order(created_at: :desc).page(params[:page])
  end

  # GET /believers/1 or /believers/1.json
  def show
    respond_to do |format|
      format.html
      format.pdf do
          render pdf: "Believer No.#{@believer.id}",
          page_size: 'A4',
          template: "believers/show.pdf.erb",
          layout: "pdf.html",
          zoom: 1,
          dpi: 75
      end
    end
  end

  # GET /believers/new
  def new
    @believer = Believer.new
  end

  # GET /believers/1/edit
  def edit
  end

  # POST /believers or /believers.json
  def create
    @believer = Believer.new(believer_params)

    respond_to do |format|
      if @believer.save
        format.html { redirect_to @believer, notice: "believer was successfully created." }
        format.json { render :show, status: :created, location: @believer }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @believer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /believers/1 or /believers/1.json
  def update
    respond_to do |format|
      if @believer.update(believer_params)
        format.html { redirect_to @believer, notice: "believer was successfully updated." }
        format.json { render :show, status: :ok, location: @believer }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @believer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /believers/1 or /believers/1.json
  def destroy
    @believer.destroy
    respond_to do |format|
      format.html { redirect_to believers_url, notice: "believer was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_believer
      @believer = Believer.find(params[:id])
      @family = @believer.family
    end

    # Only allow a list of trusted parameters through.
    def believer_params
      params.require(:believer).permit(:temple_id, :profile, :name, :addressProvince, :addressDetail, :phone, 
                                :gender, :birthday, :registerday, :remarks, :ganzhi, :dharmaName, :email)
    end
end
