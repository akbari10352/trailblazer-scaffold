module TrailblazerScaffold::Operation
  class Generate

    def call(model, actions)
      model_path = model.to_s.downcase.split('::').join('/')
      dir_path = Rails.root.join('app/concepts', model_path, 'operation')
      FileUtils.mkdir_p(dir_path) unless File.directory?(dir_path)
      actions.each do |action|
        send("generate_#{action}_operaton_class", model, dir_path)
      end
    end

    def generate_create_operaton_class(model, dir_path)
      class_text = <<~EOF
        module #{model}
          class Operaton::Create < Trailblazer::Operation
            step Model(#{model}, :new)
            step self::Contract::Build(constant: #{model}::Contract::Base)
            step self::Contract::Validate()
            step self::Contract::Persist()
          end
        end
      EOF

      File.write((dir_path + 'create.rb'), class_text)
    end

    def generate_update_operaton_class(model, dir_path)
      class_text = <<~EOF
        module #{model}
          class Operaton::Update < Trailblazer::Operation
            step Model(#{model}, :find)
            step self::Contract::Build(constant: #{model}::Contract::Base)
            step self::Contract::Validate()
            step self::Contract::Persist()
          end
        end
      EOF

      File.write((dir_path + 'update.rb'), class_text)
    end

    def generate_destroy_operaton_class(model, dir_path)
      class_text = <<~EOF
        module #{model}
          class Operaton::Destroy < Trailblazer::Operation
            step Model(#{model}, :find)
            step :destroy

            def destroy(_options, model:, **)
              model.destroy
            end
          end
        end
      EOF

      File.write((dir_path + 'destroy.rb'), class_text)
    end

  end
end
