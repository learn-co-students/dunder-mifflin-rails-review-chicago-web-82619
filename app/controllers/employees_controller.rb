class EmployeesController < ApplicationController
  before_action :find_employee, only: [:show, :edit, :update, :destroy]

  def index
    @employees = Employee.all
  end

  def show
  end

  def new
    @employee = Employee.new
  end

  def create
    @employee = Employee.new(employee_params)

    if @employee.valid?
      @employee.save
      redirect_to @employee
    else
      p @employee.errors.full_messages
      flash[:errors] = @employee.errors.full_messages
      redirect_to new_employee_path
    end
  end

  def edit
  end

  def update
    @employee = Employee.update(employee_params)
    redirect_to employee_path(@employee)
  end

  def destroy
  end

  private

  def find_employee
    @employee = Employee.find_by(id: params[:id])
  end

  def employee_params
    params.require(:employee).permit([:first_name, :last_name, :alias, :title, :office, :dog_id, :img_url])
  end
end
