json.extract! bill, :id, :name, :amount, :description, :due_date, :created_at, :updated_at
json.url bill_url(bill, format: :json)
