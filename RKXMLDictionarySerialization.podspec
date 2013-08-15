Pod::Spec.new do |s|
  s.name         = "RKXMLDictionarySerialization"
  s.version      = "0.1.0"
  s.summary      = "A RestKit serialization format implementation for XML using XMLDictionary."
  s.homepage     = "https://github.com/DZamataev/RKXMLDictionarySerialization"
  s.license      = { :type => 'Apache', :file => 'LICENSE'}
  s.author       = { "Denis Zamataev" => "denis.zamataev@gmail.com" }

  s.requires_arc = true
  s.ios.deployment_target = '5.0'
  s.osx.deployment_target = '10.7'
  
  s.source       = { :git => "https://github.com/DZamataev/RKXMLDictionarySerialization.git" }
  s.source_files = '*.{h,m}'
  
  s.dependency 'RestKit', '>= 0.20.0'
end
