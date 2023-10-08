# == Schema Information
#
# Table name: expenses
#
#  id         :bigint           not null, primary key
#  category   :integer
#  name       :string
#  total      :float
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_expenses_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Expense < ApplicationRecord
  belongs_to :user

  enum categoy: {
    saving: 0,
    credit: 1,
    credit_card: 2
  }
end
