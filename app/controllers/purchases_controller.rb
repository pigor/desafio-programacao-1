class PurchasesController < ApplicationController
  def new
    @amount = Purchase.sum(:total)
  end
  
  def create
    PurchaseWorker.perform_async(params[:file].tempfile.path)

    redirect_to root_path, notice: 'Iniciado o processamento do arquivo...'
  end
end
