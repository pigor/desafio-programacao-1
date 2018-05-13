require 'csv'

class PurchaseParser
  def self.parse(file_path)
    index = 0
    column_names = []
    purchases = []

    CSV.foreach(file_path, {:col_sep => "\t"}) do |line|
      if index == 0
        column_names = line.map{ |c| c.strip.gsub(/\s+/, '_') }
      else 
        purchase_params = Hash[column_names.zip(line)]
        purchases << PurchaseRegister.new_purchase(purchase_params)
      end
      
      index += 1
    end

    purchases.compact
  end
end