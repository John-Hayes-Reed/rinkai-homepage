module GlobalInformationHelpers
  def create_global_information!
    GlobalAppInformation.create! unless GlobalAppInformation.first.present?
  end
end

RSpec.configure do |config|
  config.include GlobalInformationHelpers
end
