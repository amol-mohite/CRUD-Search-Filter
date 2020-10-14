class ProvidersController < ApplicationController 
  before_action :set_provider, only: [:show, :edit, :update, :destroy]
	
	def index
	  if params[:search].present?
	  	@providers = Provider.search(params[:search]).order('created_at')
	  elsif params[:filter].present?
	    order_clause = Provider.get_order_by_clause(params[:filter])
	    @providers = Provider.all.order(order_clause)
	  else
	  	@providers = Provider.all.order('created_at')
	  end

	end

	def new
		@provider = Provider.new()
	end
	
	def create
		@provider = Provider.new(provider_params)
		if @provider.save
			flash.now[:sucess] = "Vollaasss added"
		  redirect_to @provider 
		else
			redirect_to 'new'
		end
	end
	
	def edit
	end

	def show
	end
	
	def update
    if @provider.update(provider_params)
      redirect_to @provider
    else
      render 'edit'
    end
	end
 
  def destroy
    @provider.destroy
    redirect_to providers_path
  end
  
  private

  def set_provider
    @provider = Provider.find(params[:id])
  end
  
  def provider_params
    params.require(:provider).permit(:name,:description, :isp_email, :rating, :contact_no, :website, :image, :max_speed, :lowest_price)
  end 
end
