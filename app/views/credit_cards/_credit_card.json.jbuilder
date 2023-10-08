json.extract! credit_card, :id, :name, :debt, :fee, :space, :payment, :user_id, :created_at, :updated_at
json.url credit_card_url(credit_card, format: :json)
