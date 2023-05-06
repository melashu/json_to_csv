
module ModelToHash
  extend ActiveSupport::Concern

  def model_object_to_ruby_hash
    all_employee = Employee.select(:id, :fname, :lname, :salary, :company, :position)
    all_employee.map do |emp|
      {
        id: emp.id, fname: emp.fname,
        lname: emp.lname, salary: emp.salary,
        company: emp.company, position: emp.position
      }
    end
  end
end
