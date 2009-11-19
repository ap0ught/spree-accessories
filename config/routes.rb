# Put your extension routes here.

# map.namespace :admin do |admin|
#   admin.resources :whatever
# end  

map.namespace :admin do |admin|
   admin.resources :products do |product|
     product.resources :accessories,  :collection => {:remove => :post,:available => :post, :selected => :get,:select => :post}
   end
end  
