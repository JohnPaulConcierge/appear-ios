Pod::Spec.new do |s|
  s.name         = "Appear"
  s.version      = "0.0.1"
  s.summary      = "Simple JSON Stylesheets for iOS"

  s.description  = <<-DESC

                  This library hopefully makes working with themes accross applications easy.


                   DESC

  s.homepage     = "https://github.com/JohnPaulConcierge/appear-ios.git"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "John Paul Concierge" => "mobile@johnpaul.com" }
  s.ios.deployment_target = "8.0"
  s.source       = { :git => "https://github.com/JohnPaulConcierge/appear-ios.git", :tag => "#{s.version}" }

  s.subspec 'Core' do |cs|
    cs.source_files = "Appear/*.swift", "Appear/Properties/*.swift"
  end

  s.subspec 'Components' do |cs|
    cs.source_files = "Appear/Components/*.swift"
  end

end
