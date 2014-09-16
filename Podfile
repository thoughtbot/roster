platform :ios, '7.0'

pod 'TBDirectory'

target :unit_tests, :exclusive => true do
  link_with 'UnitTests'
  pod 'TBDirectory/Testing'
  pod 'Specta', :git => 'https://github.com/specta/specta.git', :branch => '0.3-wip'
  pod 'Expecta'
  pod 'OCMock'
end
