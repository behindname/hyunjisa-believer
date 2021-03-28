class FamiliesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_family, only: %i[ show edit update destroy ]

  # GET /families or /families.json
  def index
    @families = Family.all.page( params[:page] )
  end

  # GET /families/1 or /families/1.json
  def show
  end

  # GET /families/new
  def new
    @family = Family.new
    @family.family_members.build
  end

  # GET /families/1/edit
  def edit
    set_main_believer
  end

  # POST /families or /families.json
  def create
    @family = Family.new(family_params)
    set_main_believer
    
    respond_to do |format|
      if @family.save && @main_believer.save
        format.html { redirect_to @family, notice: "Family was successfully created." }
        format.json { render :show, status: :created, location: @family }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @family.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /families/1 or /families/1.json
  def update
    set_main_believer    
    respond_to do |format|
      if @family.update(family_params) && @main_believer.save
        format.html { redirect_to @family, notice: "Family was successfully updated." }
        format.json { render :show, status: :ok, location: @family }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @family.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /families/1 or /families/1.json
  def destroy
    @family.destroy
    respond_to do |format|
      format.html { redirect_to families_url, notice: "Family was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_family
      @family = Family.find(params[:id])
    end

    def set_main_believer
      if @family.present?
        @main_believer = Believer.find(@family.main_believer_id)
        @main_believer.family = @family
      end
    end

    # Only allow a list of trusted parameters through.
    def family_params
      params.require(:family).permit(:main_believer_id, :name, family_members_attributes:[:id, :_destroy, :family_id, :relation, :name, :birthday, :ganzhi, :remarks])
    end
end
