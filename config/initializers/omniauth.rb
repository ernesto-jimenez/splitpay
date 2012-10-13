Rails.application.config.middleware.use OmniAuth::Builder do
  if Rails.env.production?
    provider :paypal,
      '1413cfd8ee2ff061df4893adbe16596c',
      '7c73052a7312b388'
  else
    provider :paypal,
      'c558c861721a836b57d59fad68529009',
      'efb96b55967f3fe3'
  end
end
