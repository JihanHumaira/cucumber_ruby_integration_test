$LOAD_PATH.unshift File.expand_path('../../page_objects', __FILE__)

require "capybara/cucumber"
require "capybara-screenshot/cucumber"
require "capybara/rspec"
require 'faker'
require "selenium-webdriver"
require "rspec/retry"
require "securerandom"
require "yaml"
require "dotenv"
require "site_prism"
require "httparty"
require "uri"
require "net/http"
require "headless"
require "nokogiri"
require "open-uri"
require "fileutils"
require "net/http/post/multipart"
require "logger"
require "uri"
require "net/ssh"
require 'logger'
require 'webdrivers'
require 'rotp'

Dotenv.load
Dotenv.overload(".env.#{ENV['ENV']}")
include RSpec::Matchers
