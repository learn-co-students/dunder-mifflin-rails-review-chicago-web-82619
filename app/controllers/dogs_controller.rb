class DogsController < ApplicationController
  before_action :find_dog, only: [:show, :edit, :update, :destroy]
  def index
    @dogs = Dog.all
  end

  def show
  end

  def new
    @dog = Dog.new
  end

  def create
    @dog = Dog.new(dog_params)
    if @dog.valid?
      @dog.save
      redirect_to @dog
    else
      p @dog.errors.messages
      flash[:errors]= @dog.errors.full_messages
      redirect_to new_dog_path
    end
  end

  def edit
  end

  def update
    @dog = Dog.update(dog_params)
    redirect_to @dog
  end

  def destroy
  end

  private

  def find_dog
    @dog = Dog.find_by(id:params[:id])
  end

  def dog_params
    params.require(:dog).permit(:name, :breed, :age)
  end
end
