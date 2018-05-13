class PurchaseWorker
  include Sidekiq::Worker

  def perform(file_path)
    PurchaseParser.parse(file_path)
  end
end
