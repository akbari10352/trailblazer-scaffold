module TrailblazerScaffold::Contract
  class Generate

    BLACKLIST_COLUMNS = %w(id created_at updated_at)

    def call(model)
      model_path = model.to_s.downcase.split('::').join('/')
      dir_path = Rails.root.join('app/concepts', model_path, 'contract')
      FileUtils.mkdir_p(dir_path) unless File.directory?(dir_path)
      file_name = 'base.rb'
      File.write((dir_path + file_name), generate_class_text(model))
    end

    def generate_class_text(model)
      klass_text = "class #{model}::Contract::Base < Reform::Form\n"
      properties = get_properties(model)
      puts properties.to_s
      properties.each do |property|
        validate_text = property[:null] ? '' : ', validates: { presence: true }'
        klass_text += "  property :#{property[:name]}#{validate_text}\n"

      end
      klass_text +=  "end\n"
    end

    def get_properties(model)
      model.columns.map do |column|
        next if BLACKLIST_COLUMNS.include? column.name
        { name: column.name, null: column.null }
      end.compact
    end
  end

end
