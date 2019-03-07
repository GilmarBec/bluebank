class RegisterEmployeeController < ApplicationController
  before_action :set_attributes, only: [:edit, :update]

  def index
    @employee_relation = EmployeeRelation.all
  end

  def new
    @offices = Office.all
  end

  def edit
    @offices = Office.all
  end

  def create
    @employee = Employee.create employee_params
    if @employee.save
      @address = Address.create address_params
      if @address.save
        @employee_relation = EmployeeRelation.create(employee: @employee, address: @address, office_id: params[:office])
        if @employee_relation.save
          redirect_to Register_employee_index_path
        # else
        #   @employee.destroy
        #   @address.destroy
        end
      # else
      #   @employee.destroy
      end
    end

    redirect_to Register_employee_new_path
  end

  def update
    if !employee_params.nil?
      @employee_relation.employee.update(employee_params)
    end

    if !address_params.nil?
      @employee_relation.address.update(address_params)
    end

    if !params[:office].nil?
      @employee_relation.office_id = params[:office]
    end

    redirect_to Register_employee_index_path
  end

  private
    def set_attributes
      @employee_relation = EmployeeRelation.find_by(employee: @employee)
    end

    def employee_params
      params.require(:employee).permit(:name, :email, :login, :password, :password_confirmation)
    end

    def address_params
      params.require(:address).permit(:cep, :state, :city, :district, :street, :number)
    end
end
