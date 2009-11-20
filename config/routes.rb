# Put your extension routes here.

# map.namespace :admin do |admin|
#   admin.resources :whatever
# end  

map.namespace :admin do |admin|
   admin.resources :products do |product|
     product.resources :spare_parts,  :collection => {:remove => :post,:available => :post, :selected => :get,:select => :post}
     product.resources :optional_spare_parts,  :collection => {:remove => :post,:available => :post, :selected => :get,:select => :post}
   end
end  
