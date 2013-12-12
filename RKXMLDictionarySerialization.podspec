Pod::Spec.new do |s|
  s.name         = "RKXMLDictionarySerialization"
  s.version      = "1.0.0"
  s.summary      = "A RestKit serialization format implementation for XML using XMLDictionary."
  s.homepage     = "https://github.com/DZamataev/RKXMLDictionarySerialization"
  s.license      = { :type => 'MIT', :file => 'LICENSE'}
  s.author       = { "Denis Zamataev" => "denis.zamataev@gmail.com" }
  
  s.ios.deployment_target = '5.0'
  s.osx.deployment_target = '10.7'
  
  s.requires_arc = true
    
  s.source       = { :git => "https://github.com/DZamataev/RKXMLDictionarySerialization.git" }
  s.source_files = '*.{h,m}'
  
  s.dependency 'RestKit'
end
