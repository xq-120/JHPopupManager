Pod::Spec.new do |spec|

  spec.name         = "JHPopupManager"
  spec.version      = "1.0.0"
  spec.summary      = "弹窗管理器."
  spec.description  = "弹窗管理器."
  spec.homepage     = "https://github.com/xq-120/JHPopupManager"

  spec.license      = "MIT"

  spec.author       = { "jekyttt" => "1204556447@qq.com" }
  
  spec.platform     = :ios, "13.0"

  spec.source       = { :git => "https://github.com/xq-120/JHPopupManager.git", :tag => "#{spec.version}" }

  spec.source_files = "JHPopupManager/*.{swift}"

  spec.frameworks   = "Foundation", "UIKit"

  spec.requires_arc = true

end
