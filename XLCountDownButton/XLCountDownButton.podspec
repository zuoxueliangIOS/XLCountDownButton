
Pod::Spec.new do |s|
  s.name         = "XLCountDownButton"
  s.version      = "1.0.0"
  s.summary      = ""
  s.description  = <<-DESC
                   DESC
  s.homepage     = "https://github.com/zuoxueliangIOS/XLCountDownButton"
  s.license      = "MIT"
  s.author             = { "zuoxueliangIOS" => "email@address.com" }
  s.platform     = :ios, "5.0"
  s.source       = { :git => "https://github.com/zuoxueliangIOS/XLCountDownButton.git", :tag => v.version }
  s.source_files  = "Classes", "Classes/**/*.{h,m}"
  s.exclude_files = "Classes/Exclude"
  s.frameworks = "Founation", "UIKit"
  s.requires_arc = true


end
