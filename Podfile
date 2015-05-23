source 'https://github.com/CocoaPods/Specs.git'

platform :ios, '8.0'
#inhibit_all_warnings!
use_frameworks!

workspace 'iSickbeard/iSickbeard.xcworkspace'
xcodeproj 'iSickbeard/iSickbeard.xcodeproj'

target :iSickbeard do
  pod 'Alamofire', '~> 1.2'
  pod 'PrintlnMagic', '1.2.1'
  pod 'SwiftyJSON', '~> 2.2'
end

target :iSickbeardTests, :exclusive => true do
  pod 'Quick', '0.3.1'
  pod 'Nimble', '0.4.2'
end