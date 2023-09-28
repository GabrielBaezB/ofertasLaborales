class JobOffersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_job_offer, only: %i[show edit update destroy show]
  before_action :authenticate_admin!, only: %i[new create edit update destroy]

  def authenticate_admin!
    return if current_user && current_user.role == 'admin'

    flash[:error] = 'Only admins can do that'
    redirect_to root_path
  end

  def new
    @job_offer = JobOffer.new
  end

  # GET /job_offers or /job_offers.json
  def index
    @job_offers = JobOffer.all
  end

  # GET /job_offers/1 or /job_offers/1.json
  def show
    @job_application = JobApplication.new
    @job_applications = @job_offers.job_applications
  end

  # GET /job_offers/new
  def new
    @job_offer = JobOffer.new
  end

  # GET /job_offers/1/edit
  def edit
  end

  #POST /job_offers or /job_offers.json
  def create
    
    @job_offer = JobOffer.new(job_offer_params)
    @job_offer.user = current_user

    respond_to do |format|
      if @job_offer.save
        format.html { redirect_to job_offer_url(@job_offer), notice: "Job offer was successfully created." }
        format.json { render :show, status: :created, location: @job_offer }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @job_offer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /job_offers/1 or /job_offers/1.json
  def update
    respond_to do |format|
      if @job_offer.update(job_offer_params)
        format.html { redirect_to job_offer_url(@job_offer), notice: "Job offer was successfully updated." }
        format.json { render :show, status: :ok, location: @job_offer }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @job_offer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /job_offers/1 or /job_offers/1.json
  def destroy
    @job_offer.destroy

    respond_to do |format|
      format.html { redirect_to job_offers_url, notice: "Job offer was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job_offer
      @job_offer = JobOffer.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def job_offer_params
      params.require(:job_offer).permit(:title, :description)
    end
end
