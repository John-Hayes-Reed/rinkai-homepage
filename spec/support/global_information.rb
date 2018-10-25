module GlobalInformationHelpers
  def create_global_information!
    GlobalAppInformation.create! unless GlobalAppInformation.first.present?
  end
end

module AdministratorHelpers
  def create_administrator!
    Administrator.create! email: 'test@test.com', password: 'testtest'
  end
end

RSpec.configure do |config|
  config.include GlobalInformationHelpers
  config.include AdministratorHelpers
end
