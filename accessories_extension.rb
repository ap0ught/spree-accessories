# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application'

class AccessoriesExtension < Spree::Extension
  version "1.0"
  description "Add Accessories to Products"
  url "http://yourwebsite.com/spree_accessories"

  def activate
    # admin.tabs.add "Spree Accessories", "/admin/spree_accessories", :after => "Layouts", :visibility => [:all]
    
    Product.class_eval do
      has_many :paint_colors
      has_many :kits, :source=> :product, :through => :spare_parts, :select=> "DISTINCT product_id,products.*"
      has_many_polymorphs :sps, :from => [:product_wrappers,:taxons], :through => :spare_parts, :rename_individual_collections=>true
      has_many_polymorphs :osps, :from => [:product_wrappers,:taxons], :through => :optional_spare_parts, :rename_individual_collections=>true
    end
    
#    Taxon.class_eval do
#      #has_many_polymorphs :linkables, :from => [:spare_parts], :through => :accessories
#    end


    # register Accessories product tab
    Admin::BaseController.class_eval do
      before_filter :add_accessories_tab
      
      private
      def add_accessories_tab
        @product_admin_tabs << {:name => "Pieces détachés", :url => "selected_admin_product_spare_parts_url"}
        @product_admin_tabs << {:name => "Pieces détachés Optionelles", :url => "selected_admin_product_optional_spare_parts_url"}
        @product_admin_tabs << {:name => "Couleurs", :url => "selected_admin_product_paint_colors_url"}
      end
    end
 
  end
end