#
# Be sure to run `pod lib lint ASMultiAppsView.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'ASMultiAppsView'
  s.version          = '0.1.0'
  s.summary          = 'App Store like multi-apps river view'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  [https://github.com/Co2333/ASMultiAppsRiverView]
                       DESC

  s.homepage         = 'https://github.com/Co2333/ASMultiAppsView'
  s.screenshots      = 'https://github.com/Co2333/ASMultiAppsRiverView/raw/master/main.png'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Lakr Aream' => 'master@233owo.com' }
  s.source           = { :git => 'https://github.com/Co2333/ASMultiAppsRiverView.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/Lakr233'

  s.ios.deployment_target = '9.0'

  s.source_files = 'ASMultiAppsView/Classes/**/*'
  
  # s.resource_bundles = {
  #   'ASMultiAppsView' => ['ASMultiAppsView/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  s.dependency 'SnapKit'
end
