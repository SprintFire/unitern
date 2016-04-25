class CompaniesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_company, only: [:edit, :update, :show, :destroy]
  before_action :require_same_user, only: [:edit, :update, :destroy]

  def index
    @companies = Company.all
  end

  def new
    @company = Company.new
  end

  def create
    @company = Company.new(company_params)
		@company.user = current_user
		if @company.save
			flash[:success] = "Article was successfully created"
			redirect_to company_path(@company)
		else
			render 'new'
		end
  end

  def edit
  end

  def show
  end

  def update
    if @company.update(company_params)
			flash[:success] = "Company was successfully updated"
			redirect_to company_path(@company)
		else
			render 'edit'
		end
  end

  def destroy
  end


  private
  def set_company
    @company = Company.find(params[:id])
  end

  def company_params
    params.require(:company).permit(:name, :website, :description, :company_size, :founded, :headquarters, :avatar)
  end

  def require_same_user
		if current_user != @company.user
			flash[:danger] = "You can only edit your own company"
			redirect_to root_path
		end
	end

end
