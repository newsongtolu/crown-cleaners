Rails.application.routes.draw do
  root 'home#index'
  post 'enquiries', to: 'home#create_enquiry'

  # SEO Crawler endpoints
  get '/robots.txt', to: proc { [200, { 'Content-Type' => 'text/plain' }, ["User-agent: *\nAllow: /\nSitemap: #{ENV.fetch('HOST_URL', 'https://crown-cleaners.onrender.com')}/sitemap.xml"]] }
  get '/sitemap.xml', to: 'sitemaps#show', defaults: { format: 'xml' }

  # Public Individual Service Detail View
  get 'services/:id', to: 'home#show_service', as: :service_detail

  # Dedicated Legal & Compliance Pages
  get 'privacy', to: 'home#privacy', as: :privacy
  get 'cookies', to: 'home#cookies_policy', as: :cookies_policy
  get 'terms', to: 'home#terms', as: :terms
  get 'accessibility', to: 'home#accessibility', as: :accessibility
  get 'safeguarding', to: 'home#safeguarding', as: :safeguarding

  # Admin Namespace
  namespace :admin do
    get 'login', to: 'sessions#new'
    post 'login', to: 'sessions#create'
    delete 'logout', to: 'sessions#destroy'

    root to: 'dashboard#index'
    resources :services, only: [:index, :edit, :update]
    resources :site_settings, only: [:index, :update]
    resources :enquiries, only: [:index, :destroy]
    resources :testimonials
  end
end