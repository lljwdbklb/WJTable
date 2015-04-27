
Pod::Spec.new do |s|

  s.name         = "WJTable"
  s.version      = "0.0.2"
  s.summary      = "一个简单实现tableview的demo"
  s.homepage     = "https://github.com/lljwdbklb/WJTable"

  s.license      = "MIT"
  s.author       = { "lljwdbklb" => "lljwdbklb@163.com" }
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/lljwdbklb/WJTable.git", :tag => "0.0.2"}

  s.source_files = "WJTable/*.{h,m}"
  s.requires_arc = true
  # s.framework  = 'UIKit' 
  # s.dependency 'RegexKitLite'
end
