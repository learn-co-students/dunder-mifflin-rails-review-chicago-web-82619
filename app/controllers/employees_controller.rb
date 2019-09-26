class EmployeesController < ApplicationController

    def index
        @employees = Employee.all
    end

    def show
        @employee = Employee.find_by(id: params[:id])
    end

    def edit
        @employee = Employee.find_by(id: params[:id])
        @dogs = Dog.all
    end
  
    def update
      @employee = Employee.find_by(id: params[:id])
      @employee.update(employee_params)
      redirect_to @employee
    end

    def new
        @employee = Employee.new
        @dogs = Dog.all
    end

    def create
        # @dogs = Dog.all
        # employee = Employee.new(employee_params)
        # jobs = Employee.all.map {|employee| employee.title}
        # job_exists = jobs.include? employee_params[:title]
        # aliases = Employee.all.map {|employee| employee.alias}
        # alias_exists = aliases.include? employee_params[:alias]
        # if employee.save && !job_exists && !alias_exists
        #     redirect_to employee_path(employee)
        # else
        #     @errors = employee.errors.full_messages
        #     @dogs = Dog.all
        #     @errors << "ERROR"
        #     render :new and return
        # end
         @employee = Employee.new(employee_params)
         if @employee.save
             redirect_to @employee
         else
             @dogs = Dog.all
             flash[:errors] = @employee.errors.full_messages
             redirect_to new_employee_path
         end        
    end

    private

    def employee_params
      params.require(:employee).permit(:first_name, :last_name, :alias, :title, :office, :dog_id)
    end

end
