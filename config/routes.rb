Rails.application.routes.draw do
  #On a high level, PUT has the ability to update the entire object, whereas PATCH simply updates the elements that were changed
  resources :posts, only: %i[index new show create edit]
  patch 'posts/:id', to: 'posts#update'

end
