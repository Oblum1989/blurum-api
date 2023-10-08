# == Schema Information
#
# Table name: transactions
#
#  id                   :bigint           not null, primary key
#  description          :string
#  transactionable_type :string           not null
#  value                :float
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  transactionable_id   :bigint           not null
#
# Indexes
#
#  index_transactions_on_transactionable  (transactionable_type,transactionable_id)
#
class Transaction < ApplicationRecord
  belongs_to :transactionable, polymorphic: true
end
