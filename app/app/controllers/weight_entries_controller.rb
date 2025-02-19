class WeightEntriesController < ApplicationController
before_action :authenticate_user!
before_action :set_weight_entry, only: [:show, :edit, :update, :destroy]


  def index
    @weight_entries = WeightEntry.order(date: :desc)
  end

 


 def new
   @weight_entry = WeightEntry.new(date: Date.current)
 end

  def create
    @weight_entry = WeightEntry.new(weight_entry_params)
    @weight_entry.user = current_user
    if @weight_entry.save
      redirect_to weight_entries_path, notice: 'votre poids a bien été enregistrer'
    else
     render :new
    end
  end

  def show
   
  end
  def edit
    @weight_entry = WeightEntry.find(params[:id])
  end

  def update
    @weight_entry = WeightEntry.find(params[:id])
    if @weight_entry.update(weight_entry_params)
      redirect_to @weight_entry, notice: 'vos moficiation on bien été enreigster.'
    else
      render :edit
    end
   
  end
  def destroy
    @weight_entry = WeightEntry.find(params[:id])
    @weight_entry.destroy
    redirect_to weight_entries_url, notice: 'entrer a bient été supprimé.'
  end

  private

  def set_weight_entry
    @weight_entry = WeightEntry.find(params[:id])
  end

    def weight_entry_params
      params.require(:weight_entry).permit(:weight, :date, :nbre_pas)
      
    end

   

   
end
