class PurchaseWorker
  include Sidekiq::Worker

  def perform(file_path)
    Purchase.destroy_all
    PurchaseParser.parse(file_path)
  end
end
