# frozen_string_literal: true

module TableSync::InstrumentAdapter
  module ActiveSupport
    module_function

    def notify(table:, event:, direction:, count: 1)
      ::ActiveSupport::Notifications.instrument "tablesync.#{direction}.#{event}",
                                                count: count,
                                                table: table.to_s,
                                                event: event,
                                                direction: direction
    end
  end
end
