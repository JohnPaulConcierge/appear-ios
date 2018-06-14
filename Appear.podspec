Pod::Spec.new do |s|
  s.name         = "Appear"
  s.version      = "0.0.1"
  s.summary      = "Simple JSON Stylesheets for iOS"

  # This description is used to generate tags and improve search results.
  #   * Think: What does it do? Why did you write it? What is the focus?
  #   * Try to keep it short, snappy and to the point.
  #   * Write the description between the DESC delimiters below.
  #   * Finally, don't worry about the indent, CocoaPods strips it!
  s.description  = <<-DESC

                  This library hopefully makes working with themes accross applications easy.


                   DESC

  s.homepage     = "https://github.com/JohnPaulConcierge/appear-ios.git"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "John Paul Concierge" => "mobile@johnpaul.com" }
  s.ios.deployment_target = "8.0"
  s.source       = { :git => "https://github.com/JohnPaulConcierge/appear-ios.git", :tag => "#{s.version}" }
  s.source_files  = "Appear", "Appear/**/*.swift"

end
