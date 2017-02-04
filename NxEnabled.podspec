Pod::Spec.new do |spec|
spec.name           = "NxEnabled"
spec.version        = "1.0.0"
spec.summary        = "Library which allows you binding `enabled` property of button with textable elements (TextView, TextField)."

spec.homepage       = "https://github.com/Otbivnoe/NxEnabled"
spec.license        = { type: 'MIT', file: 'LICENSE' }
spec.authors        = { "Nikita Ermolenko" => 'gnod94@gmail.com' }
spec.platform       = :ios
spec.requires_arc   = true

spec.ios.deployment_target  = '8.4'
spec.source                 = { git: "https://github.com/Otbivnoe/NxEnabled.git", tag: "#{spec.version}"}
spec.source_files           = "Sources/*.{h,swift}"
end
