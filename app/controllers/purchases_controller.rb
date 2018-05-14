class PurchasesController < ApplicationController
  def new
    @amount = Purchase.sum(:total)
  end
  
  def create
    begin
      PurchaseWorker.perform_async(params[:file].tempfile.path)

      redirect_to root_path, notice: 'Iniciado o processamento do arquivo...'
    rescue
      flash[:error] = 'Ocorreu um erro ao tentar processar o arquivo!'
      redirect_to root_path
    end
  end
end
