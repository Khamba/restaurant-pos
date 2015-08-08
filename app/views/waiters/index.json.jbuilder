json.array!(@waiters) do |waiter|
  json.extract! waiter, :id
  json.url waiter_url(waiter, format: :json)
end
