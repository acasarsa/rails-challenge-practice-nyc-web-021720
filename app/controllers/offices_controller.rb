class OfficesController < ApplicationController

  # before_action :find_office, only: [:show]

  def index
    @offices = Office.all 
  end

  def show 
    @office = Office.find(params[:id])
  end

  def new 
    @office = Office.new 
  end

  def create
    office = Office.new(office_params)

    if office.save 
      redirect_to office
    else
      render :new
    end
  end

  private 

  def office_params 
    params.require(:office).permit(:name)
  end

  # def find_office
  #   @office = Office.find(params[:id])
  # end
end