class DependentsController < ApplicationController

  def create
    @dependent = Dependent.new(dependent_params)
   
    if @dependent.save
      render json: @dependent, status: :created
    else
      render json: @dependent.errors, status: :unprocessable_entity
    end
  end
   
  def update
    @dependent = Dependent.find(params[:id])
   
    if @dependent.update(updated_dependent_params)
      render json: @dependent, status: :created
    else
      render json: @dependent.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @dependent = Dependent.find(params[:id])

    if @dependent.destroy
      render json: @dependent, status: :ok
    else
      render json: @dependent.errors, status: :unprocessable_entity
    end
  end

  def show
    @dependent = Dependent.find(params[:id])

    render json: @dependent, status: :ok
  end
   
  private
    def dependent_params
      params.permit(:name, :kinship, :user_id)
    end

    def update_dependent_params
      params.permit(:name, :kinship)
    end
end
