platform :ios, '13.0'

target 'BVCAutoservice' do
  use_frameworks!

  pod 'Alamofire', '5.6.1'
  pod 'KeychainSwift', '20.0.0'
  pod 'R.swift'
  pod 'SwiftLint'
  pod 'SnapKit', '5.6.0'

  target 'BVCAutoserviceTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'BVCAutoserviceUITests' do
    # Pods for testing
  end
end

post_install do |installer|
 installer.pods_project.targets.each do |target|
  target.build_configurations.each do |config|
   config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '13.0'
  end
 end
end