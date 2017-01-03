

Pod::Spec.new do |s|

  s.name         = 'LLSwiftLib'
  s.version      = '0.0'
  s.summary      = "LL'S SWIFT LIB"
  s.description  = <<-DESC
		   LL'S SWIFT LIB . which implement by Swift
                   DESC

  s.homepage     = "https://github.com/liutongchao/LLSwiftLib"
  s.license      = 'MIT'
  s.author       = { 'liutongchao' => '413281269@qq.com' }
  s.platform     = :ios, '8.0'

  s.source       = { :git => "https://github.com/liutongchao/LLSwiftLib.git", :tag => s.version }
  s.source_files  = "LLSwiftLib/**/*.swift"

  s.resources  = "LLSwiftLib/**/*.bundle"

  s.frameworks = "Foundation", "UIKit"
  s.requires_arc = true

end
