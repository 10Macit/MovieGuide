
# Podfile
 
platform :ios, '10.0'

workspace 'MovieGuide.xcworkspace'

use_frameworks!
 
# My other pods
 
def pods
    pod 'Alamofire', '~> 5.0.0-beta.6'
    pod 'Kingfisher'
    pod 'NVActivityIndicatorView'
    pod 'Firebase/Core'
    pod 'Firebase/Analytics'
    pod 'Firebase/RemoteConfig'
    pod 'Firebase/Messaging'
end


target 'MovieGuide' do
project 'MovieGuide/MovieGuide.xcodeproj'
    pods
end


target 'MovieGuideAPI' do
project 'MovieGuideAPI/MovieGuideAPI.xcodeproj'
    pods
end
