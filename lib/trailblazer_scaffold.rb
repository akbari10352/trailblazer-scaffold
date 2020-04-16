require 'get_actions.rb'
require 'contract/generate.rb'
require 'operation/generate.rb'
module TrailblazerScaffold
  class Generate

    def call(model_name)
      unless (model = model_name.safe_constantize) && model.ancestors.include?(ActiveRecord::Base)
        return puts 'model does not exists'
      end
      actions = GetActions.new.call(model_name)
      TrailblazerScaffold::Contract::Generate.new.call(model)
      return unless actions.present?
      TrailblazerScaffold::Operation::Generate.new.call(model, actions)
    end

  end
end
