Rails.configuration.stripe = {
  publishable_key: ENV['PUBLISHABLE_KEY'],
  secret_key: ENV['SECRET_KEY']
}

Stripe.api_key = 'sk_test_GlRlt1FyFGXPaPjMyiXhPvmY00qm876Zh3'
