#
# Be sure to run `pod lib lint CubicController.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'CubicController'
  s.version          = '0.1.0'
  s.summary          = 'Subclass of UICollectionViewController with 3d Scrolling.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = 'A Subclass of UICollectionViewController that creates a 3d scrolling effect like a Cube, similiar to the one used by Instagram on their new Stories'
  s.homepage         = 'https://github.com/andrespch/CubicCollectionViewController/'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'andrespch' => 'andres.portillos@gmail.com' }
  s.source           = { :git => 'https://github.com/andrespch/CubicCollectionViewController.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'
end
