
Pod::Spec.new do |s|
  s.name         = "XLCountDownButton"
  s.version      = "1.0.1"
  s.summary      = "短信倒计时按钮"
  s.description  = "实现短信倒计时按钮"
  s.homepage     = "https://github.com/zuoxueliangIOS/XLCountDownButton"
  s.license      = "MIT"
  s.author       = { "左学良" => "469036530@qq.com" }
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/zuoxueliangIOS/XLCountDownButton.git", :tag => s.version }
  s.source_files  = "XLCountDownButton", "XLCountDownButton/XLCountDownButton/XLCountDownButton/*.{h,m}"
  s.frameworks = "Foundation"
  s.requires_arc = true

end
