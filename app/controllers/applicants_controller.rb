class ApplicantsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_applicant, only: %i[ show edit update destroy ]

  # GET /applicants or /applicants.json
  def index
    @applicants = Applicant.page(params[:page]).per(5)
  end

  # GET /applicants/1 or /applicants/1.json
  def show
  end

  # GET /applicants/new
  def new
    @applicant = Applicant.new
  end

  # GET /applicants/1/edit
  def edit
  end

  # POST /applicants or /applicants.json
  def create
    @applicant = Applicant.new(applicant_params)

    respond_to do |format|
      if @applicant.save
        format.html { redirect_to @applicant, notice: "Applicant was successfully created." }
        format.json { render :show, status: :created, location: @applicant }
      else
        format.html { render :new, status: :unprocessable_entity, alert: "Error creating applicant." }
        format.json { render json: @applicant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /applicants/1 or /applicants/1.json
  def update
    new_salary = params[:salary].to_f
    UpdateSalaryJob.perform_async(@applicant.id, new_salary)

    respond_to do |format|
      if @applicant.update(applicant_params.except(:salary, :inss_discount))
        format.html { redirect_to @applicant, notice: "Applicant was successfully updated." }
        format.json { render :show, status: :ok, location: @applicant }
      else
        format.html { render :edit, status: :unprocessable_entity, alert: "Error updating applicant." }
        format.json { render json: @applicant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /applicants/1 or /applicants/1.json
  def destroy
    @applicant.destroy!

    respond_to do |format|
      format.html { redirect_to applicants_path, status: :see_other, notice: "Applicant was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_applicant
      @applicant = Applicant.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def applicant_params
      params.require(:applicant).permit(:name, :cpf, :birth_date, :street, :number, :neighborhood, :city, :state, :zip_code, :personal_phone, :reference_phone, :salary)
    end
end
