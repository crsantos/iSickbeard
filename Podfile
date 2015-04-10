source 'https://github.com/CocoaPods/Specs.git'

platform :ios, '8.0'
#inhibit_all_warnings!
use_frameworks!

workspace 'iSickbeard/iSickbeard.xcworkspace'
xcodeproj 'iSickbeard/iSickbeard.xcodeproj'

target :iSickbeard do
  pod 'Alamofire', '1.2.0'
  pod 'PrintlnMagic', '1.2.1'
end

target :iSickbeardTests, :exclusive => true do
  pod 'Quick', '0.2.2'
  pod 'Nimble', '0.3.0'
end