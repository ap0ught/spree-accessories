class Admin::AccessoriesController < Admin::BaseController
  resource_controller
  before_filter :load_object, :only => [:selected, :available, :remove]
  
  belongs_to :product

  def selected
   # @accessories = @product.spare_parts
  end
  
  def available
    if params[:q].blank?
      @available_accessories = []
    else
      if params[:type]=="product"
        @available_accessories = Product.find(:all,:include=>:variants, :conditions => ['lower(name) LIKE ? OR lower(variants.sku) LIKE ?', "%#{params[:q].downcase}%", "%#{params[:q].downcase}%"])
        #@available_accessories.delete_if { |accessory| @product.accessories.include?(accessory) }
      else
        @available_accessories = Taxon.find(:all,:conditions => ['lower(name) LIKE ?', "%#{params[:q].downcase}%"])
        #@available_accessories.delete_if { |accessory| @product.accessories.include?(accessory) }
      end
    end
    respond_to do |format|
      format.html
      format.js {render :layout => false}
    end
  end
 
  def remove
    if params[:accessory_id]
      spare_part = Product.find_by_id(params[:accessory_id])
    else
      spare_part = Taxon.find_by_id(params[:taxon_id])
    end
    @product.linkables.delete(spare_part)

    render :layout => false
  end  
  
  def select
    @product = Product.find_by_param!(params[:product_id])
    if params[:accessory_id]
      spare_part = Product.find_by_id(params[:accessory_id])
    else
      spare_part = Taxon.find_by_id(params[:taxon_id])
    end
    if spare_part
      @product.linkables << spare_part
    end
    render :layout => false
  end
end
