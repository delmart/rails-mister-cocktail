class DosesController < ApplicationController
  before_action :set_dose, only: [:show, :edit, :update, :destroy]
  before_action :load_cocktail, only: [:new, :create, :edit, :update]
  def index
    @doses = Dose.all
    @doses = @cocktail.doses.all
  end

  def show
  end

  def new
    @dose = Dose.new
    @dose = @cocktail.doses.new
  end

  def create
    @dose = Dose.new(dose_params)
    @dose = @cocktail.doses.new(dose_params)

    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @dose.update(dose_params)
      redirect_to cocktail_path(@cocktail)
    else
      render :edit
    end
  end

  def destroy
    id = @dose.cocktail_id
    @dose.destroy
    redirect_to cocktail_path(id)
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id, :cocktail_id)
  end

  def set_dose
    @dose = Dose.find(params[:id])
  end

  def load_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end
end
