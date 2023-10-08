# == Schema Information
#
# Table name: savings
#
#  id         :bigint           not null, primary key
#  name       :string
#  total      :float
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_savings_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Saving < ApplicationRecord
  belongs_to :user
  has_many :transactions, as: :transactionable

  def create_transaction(total, description)
    transactions.create(value: total, description: description)
  end
end
