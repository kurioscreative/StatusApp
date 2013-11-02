# -*- coding: utf-8 -*-
$:.unshift("/Library/RubyMotion/lib")
require 'motion/project/template/ios'
require 'motion-hpple'
require 'motion-cocoapods'
require 'bubble-wrap/all'

begin
  require 'bundler'
  Bundler.require
rescue LoadError
end

Motion::Project::App.setup do |app|
  # Use `rake config' to see complete project settings.
  app.name = 'BalancedStatus'

  app.pods {}
end

MotionBundler.setup