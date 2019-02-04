Pod::Spec.new do |s|
  s.name         = 'Appear'
  s.version      = '0.1.0'
  s.summary      = 'Simple Stylesheets for iOS'

  s.description  = <<-DESC

                  This library hopefully makes working with themes accross applications easy.


  DESC

  s.swift_version = '4.2'

  s.homepage     = 'https://github.com/JohnPaulConcierge/appear-ios.git'
  s.license      = { type: 'MIT', file: 'LICENSE' }
  s.author = { 'John Paul Concierge' => 'mobile@johnpaul.com' }
  s.ios.deployment_target = '8.0'
  s.source = { git: 'https://github.com/JohnPaulConcierge/appear-ios.git', tag: s.version.to_s }

  s.subspec 'Core' do |cs|
    cs.source_files = 'Appear/Core/**/*.swift'
  end

  s.subspec 'Components' do |cs|
    cs.source_files = 'Appear/Components/**/*.swift'
    cs.dependency 'Appear/Core'
  end

  s.test_spec 'Tests' do |test_spec|
    test_spec.source_files = 'Tests/*.swift'
  end
end
