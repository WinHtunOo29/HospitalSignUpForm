platform :ios, '13.0'

def shared_pods
    pod 'UIMultiPicker'
    pod 'DatePicker', '~> 1.3.0'
end

target 'OnenexCodingTest' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  shared_pods

  # Pods for OnenexCodingTest

  target 'OnenexCodingTestTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'OnenexCodingTestUITests' do
    # Pods for testing
  end

end

post_install do |installer|
    installer.generated_projects.each do |project|
          project.targets.each do |target|
              target.build_configurations.each do |config|
                  config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '13.0'
               end
          end
   end
end
