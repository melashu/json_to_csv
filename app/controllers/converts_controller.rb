class ConvertsController < ApplicationController
  include ModelToHash
  include ConvertToCsv
  include CreateEmployee

  def index
    input = params_value[:data]
    if create_employee?(input)
      result = convert_to_csv(input)
      render plain: result, status: :ok
    else
      render plain: 'Either the id is duplicted or invalid format,try /convert/previous to see previous data', status: 422
    end
  end

  def previous
    all_employee = model_object_to_ruby_hash
    result = convert_to_csv(all_employee)
    render plain: result, status: :ok
  end

  private

  def params_value
      params.require(:data)
      params.permit(data: %i[id fname lname company position salary])
  end
end
