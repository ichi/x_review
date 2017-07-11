module FactoryGirl
  module Strategy
    class AttributesWithForeignKey
      def association(runner)
        runner.run
      end

      def result(evaluation)
        instance = evaluation.object
        assocs = instance.class.reflect_on_all_associations(:belongs_to)
        assoc_attrs = assocs.map do |assoc|
          fk = assoc.foreign_key
          [fk, instance.send(fk)]
        end.to_h

        evaluation.hash.merge(assoc_attrs)
      end
    end
  end
end

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods

  config.before :suite do
    FactoryGirl.reload
    FactoryGirl.register_strategy(:attributes_with_foreign_key, FactoryGirl::Strategy::AttributesWithForeignKey)
  end
end
