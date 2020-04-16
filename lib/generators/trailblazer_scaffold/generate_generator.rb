require 'rails/generators'
module TrailblazerScaffold
  class GenerateGenerator < Rails::Generators::Base

    model_name = ARGV[0]
    actions = TrailblazerScaffold::Generate.new.call(model_name)
    result_text = if actions.present?
     "operations and contract for #{actions.join(', ')} has been generated"
    else
     'there was no action for model to create the contract and operaitons for'
                  end
    p result_text
  end
end
