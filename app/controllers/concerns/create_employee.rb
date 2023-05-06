module CreateEmployee
  extend ActiveSupport::Concern

  def create_employee?(data)
    return true if Employee.create!(data)
  rescue StandardError
    false
  end
end