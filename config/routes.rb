Rails.application.routes.draw do

  post '/options/create_option_for_suggesters', to: 'options#create_option_for_suggesters', as: 'create_option_for_suggesters'
  resources :options
  resources :slides
  resources :accounts
  post '/newsletters/add_newsletter_to_list', to: "newsletters#add_newsletter_to_list", as: "add_newsletter_to_list"
  resources :newsletters
  get '/event_search/search_example', to: 'event_search#search_example'
  get '/event_search/search', to: 'event_search#search', as: 'search_events'

  get '/events/new_event_for_non_users', to: 'events#new_event_for_non_users', as: 'new_event_for_non_users'
  post '/events/create_event_for_non_users', to: 'events#create_event_for_non_users', as: 'create_event_for_non_users'
  resources :events
  resources :tags
  resources :pages
  get '/post_search/search_example', to: 'post_search#search_example'
  get '/post_search/search', to: 'post_search#search', as: 'search_posts'
  resources :posts
  devise_for :users
  root 'static_pages#welcome'
  get '/static_pages/texts', to: 'static_pages#texts', as: 'texts'

  get '/static_pages/dashboard', to: 'static_pages#dashboard', as: 'dashboard'

  #get '/event_calendar', to: 'event_calendar#event_calendar', as: 'event_calendar'
  get '/event_calendar/(:date)', to: 'event_calendar#event_calendar', as: 'event_calendar'
  get '/action_map', to: 'event_calendar#action_map', as: 'action_map'
  get '/event_list', to: 'event_calendar#event_list', as: 'event_list'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get 'api/events', to: 'events#api_events'
  get 'api/events_icalendar', to: 'events#icalendar', as: 'events_icalendar'
  get 'api/events_to_icalendar/:id', to: 'events#to_icalendar', as: 'to_icalendar'

  #debate
  get '/debate_a_vegan/reset_debate', to: 'debate_a_vegan#reset_debate', as: 'debate_a_vegan_reset_debate'
  get '/debate_a_vegan(/:slide)', to: 'debate_a_vegan#debate', as: 'debate_a_vegan'

  get '/debate_a_vegan_chat', to: 'debate_a_vegan#chat', as: 'debate_a_vegan_chat'

  post '/debate_a_vegan/load_slide/:option', to: 'debate_a_vegan#load_slide', as: 'debate_a_vegan_load_slide'
  post '/debate_a_vegan/go_one_slide_back', to: 'debate_a_vegan#go_one_slide_back', as: 'debate_a_vegan_go_one_slide_back'

  post '/debate_a_vegan/load_video', to: 'debate_a_vegan#load_video', as: 'debate_a_vegan_load_video'
  post '/debate_a_vegan/load_message/:option', to: 'debate_a_vegan#load_message', as: 'debate_a_vegan_load_message'
  post '/debate_a_vegan/load_starting_slide/:starting_slide', to: 'debate_a_vegan#load_starting_slide', as: 'debate_a_vegan_load_starting_slide'
end
