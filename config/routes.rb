Rails.application.routes.draw do
  root 'home#top'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources 'users'
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end