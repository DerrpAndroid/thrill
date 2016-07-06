class ApiConstraints
  def initialize(options)
    @version = options[:version]
    @default = options[:default]
  end

  def matches?(req)
    @default || request
      .headers
      .fetch(:accept)
      .include?("v#{version}")
  end
end