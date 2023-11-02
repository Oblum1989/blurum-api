# == Schema Information
#
# Table name: credits
#
#  id         :bigint           not null, primary key
#  debt       :float
#  fee        :float
#  name       :string
#  payment    :float
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_credits_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Credit < ApplicationRecord
  belongs_to :user
  has_many :transactions, as: :transactionable

  def create_transaction(total, description)
    transactions.create(value: total, description: description)
    self.update(debt: self.debt - total, payment: total)
  end
end
