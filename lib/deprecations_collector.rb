module DeprecationsCollector

  def DeprecationsCollector.instance(version: :short, filename: 'deprecations.log', callstack_limit: 5)
    klass_name = "Klass#{rand(100_000)}#{Time.now.to_i}"
    code = %Q(
      class #{klass_name}
        def self.logger
          @logger ||= Logger.new("#{Rails.root}/log/#{filename}")
        end
        def self.call(message = "", callstack = [], deprecation_horizon = nil, gem_name = nil)
          str = "=" * 80
          str << "\n" + message.to_s
          if :#{version} != :short && callstack.any?
            str << "\n" + callstack.take(#{callstack_limit}).join("\n")
          end
          str << "\n"
          logger.info str
        end
        def self.arity
          4 # just because this method is called in Rails 5
        end
      end
    )
    eval(code)
    eval(klass_name)
  end

end