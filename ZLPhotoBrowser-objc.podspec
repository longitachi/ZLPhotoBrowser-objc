Pod::Spec.new do |s|
  s.name         = 'ZLPhotoBrowser-objc'
  s.version      = '1.0.4'
  s.summary      = 'ZLPhotoBrowser 的oc版本'
  s.homepage     = 'https://github.com/longitachi/ZLPhotoBrowser-objc'
  s.license      = 'MIT'
  s.platform     = :ios
  s.author       = {'longitachi' => 'longitachi@163.com'}

  s.ios.deployment_target = '8.0'
  s.source       = {:git => 'https://github.com/longitachi/ZLPhotoBrowser-objc.git', :tag => s.version}
  s.source_files = 'ZLPhotoBrowser/PhotoBrowser/**/*.{h,m}'
  s.resources    = 'ZLPhotoBrowser/PhotoBrowser/resource/*.{png,xib,nib,bundle}'

  s.requires_arc = true
  s.frameworks   = 'UIKit','Photos','PhotosUI'

  s.dependency 'SDWebImage'
end
