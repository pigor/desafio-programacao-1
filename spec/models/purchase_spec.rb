require 'rails_helper'

RSpec.describe Purchase, type: :model do
  it { should validate_presence_of :purchaser_id }
  it { should validate_presence_of :merchant_id }
  it { should validate_presence_of :item_id }
  it { should validate_presence_of :quantity }

  it { should belong_to :purchaser }
  it { should belong_to :merchant }
  it { should belong_to :item }
end
