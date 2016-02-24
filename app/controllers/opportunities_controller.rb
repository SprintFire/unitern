class OpportunitiesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_opportunity, only: [:edit, :update, :show, :destroy]
  before_action :require_company_owner, only: [:edit, :update, :destroy]

  def index
    @opportunities = Opportunity.all
  end

  def new
    # redirect to root path if user has no company yet
    if current_user.companies.empty?
      flash[:danger] = "You must create a company before adding an internship"
      redirect_to new_company_path
    end

    @opportunity = Opportunity.new
  end

  def create
    @opportunity = Opportunity.new(opportunity_params)
    # we need to see if the company belongs to the user that is signed in
    if current_user.companies.exists?(params[:opportunity][:company_id])
      @opportunity.company = Company.find(params[:opportunity][:company_id])
      if @opportunity.save
  			flash[:success] = "Internship was successfully created"
  			redirect_to opportunity_path(@opportunity)
  		else
  			render 'new'
  		end
    else
      flash[:danger] = "You can not create an internship for this company"
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @opportunity.update(opportunity_params)
			flash[:success] = "Company was successfully updated"
			redirect_to opportunity_path(@opportunity)
		else
			render 'edit'
		end
  end

  def destroy
  end

  private

  def set_opportunity
    @opportunity = Opportunity.find(params[:id])
  end

  def opportunity_params
    params.require(:opportunity).permit(:name, :description, :location, :responsibilities, :duration, :hourly_rate)
  end

  def require_company_owner
    unless current_user.companies.exists?(@opportunity.company)
		 flash[:danger] = "You can only edit your own internships"
		 redirect_to root_path
    end
  end

end
