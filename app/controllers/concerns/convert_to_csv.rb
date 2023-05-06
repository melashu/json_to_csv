
module ConvertToCsv
  extend ActiveSupport::Concern

  def convert_to_csv(input)
    return 'We expect array of hash' unless input.is_a?(Array)
  
    return 'No data avaliable' if input.empty?
  
    csv_keys = input[0].keys.join(',')
    csv_file = input.map do |ele|
      ele.values.join(',')
    end.join("\n")

    "#{csv_keys}\n#{csv_file}"
  end

end
