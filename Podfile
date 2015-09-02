source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '8.0'
use_frameworks!

def mainPods
    pod 'Alamofire'
    pod 'XCGLogger'
end

target 'ReviewTime' do
    pod 'Fabric'
    pod 'Crashlytics'
    pod 'TwitterKit'
    pod 'TwitterCore'
    mainPods
end

target 'ReviewTimeWidget' do
    mainPods
end

target 'ReviewTimeTests' do
    pod 'OHHTTPStubs', '~> 4.0'
    pod 'OCMock', '~> 3.1'
end