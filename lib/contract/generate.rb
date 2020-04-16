module TrailblazerScaffold::Contract
  class Generate

    BLACKLIST_COLUMNS = %w(id created_at updated_at)

    PROPERTY_TYPES = %i(integer float boolean)

    def call(model)
      model_path = model.to_s.downcase.split('::').join('/')
      dir_path = Rails.root.join('app/concepts', model_path, 'contract')
      FileUtils.mkdir_p(dir_path) unless File.directory?(dir_path)
      file_name = 'base.rb'
      File.write((dir_path + file_name), generate_class_text(model))
    end

    def generate_class_text(model)
      klass_text = "class #{model}\n  class Contract::Base < Reform::Form\n"
      properties = get_properties(model)
      properties.each do |property|
        klass_text += "    property :#{property[:name]}#{validation(property)}\n"
      end
      klass_text +=  "  end\nend\n"
    end

    def get_properties(model)
      model.columns.map do |column|
        next if BLACKLIST_COLUMNS.include? column.name
        { name: column.name, allow_null: column.default || column.null, type: column.type }
      end.compact
    end

    def validation(property)
      presence_validation = validate_presence(property[:allow_null])
      type_validation = validation_type(property[:type])
      return unless presence_validation || type_validation
      ", validates: {#{[presence_validation, type_validation].compact.join(',')} }"
    end

    def validation_type(type)
      return  unless PROPERTY_TYPES.include?(type)
      case type
      when :integer
        ' numericality: { only_integer: true }'
      when :float
        ' numericality: { only_float: true }'
      when :boolean
        ' inclusion: { in: [true, false] }'
      end
    end

    def validate_presence(allow_null)
      return if allow_null
      ' presence: true'
    end
  end

end
