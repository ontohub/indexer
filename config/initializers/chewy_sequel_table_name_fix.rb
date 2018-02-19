# frozen_string_literal: true

# This is needed until chewy > 0.10.1 is released
module Chewy
  class Type
    module Adapter
      # The gem code qualifies this implicitly with :table__column. This is not
      # allowed any more since Sequel 5.
      class Sequel < Orm
        private

        def full_column_name(column)
          ::Sequel.qualify(target.table_name, column)
        end
      end
    end
  end
end
