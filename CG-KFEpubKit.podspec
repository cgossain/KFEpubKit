Pod::Spec.new do |s|
  s.name             =  'CG-KFEpubKit'
  s.version          =  '1.0'
  s.license          =  { :type => 'MIT', :file => 'LICENSE.txt' }
  s.summary          =  'An Objective-C epub extracting and parsing framework for OSX and iOS.'
  s.homepage         =  'https://pods.kf-interactive.com'
  s.author           =  { 'Rico Becker' => 'rico.becker@kf-interactive.com' }
  s.source           =  { :git => 'https://github.com/cgossain/KFEpubKit.git', :tag => s.version.to_s }
  s.framework        =  'Foundation'
  s.requires_arc     =  true
  s.ios.deployment_target = '8.0'
  s.osx.deployment_target = '10.8'

  s.default_subspecs = 'Standard'

  s.subspec 'Core' do |ss|
    ss.dependency   'SSZipArchive', '~> 1.0.1'
    ss.dependency   'KissXML', '~> 5.1.0'
    ss.source_files = 'KFEpubKit/Sources/*.{h,m}', 'KFEpubKit/LICENSE.txt'
    ss.library      = 'xml2'
    ss.xcconfig     = { 'HEADER_SEARCH_PATHS' => '"$(SDKROOT)/usr/include/libxml2"' }
  end

  s.subspec 'Standard' do |ss|
    ss.dependency 'CG-KFEpubKit/Core'
    # ss.dependency 'KissXML'
  end

  s.subspec 'Framework' do |ss|
    ss.ios.deployment_target = '8.0'
    ss.dependency 'CG-KFEpubKit/Core'
    # ss.dependency   'KissXML/libxml_module'
    ss.xcconfig     = { 'HEADER_SEARCH_PATHS' => '$(SDKROOT)/usr/include/libxml2 $(PODS_ROOT)/KissXML',
                        'OTHER_CFLAGS' => '$(inherited) -DDDXML_LIBXML_MODULE_ENABLED=1',
                        'OTHER_SWIFT_FLAGS' => '$(inherited) -DDDXML_LIBXML_MODULE_ENABLED'
}

  end
end
