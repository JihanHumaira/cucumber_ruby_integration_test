$LOAD_PATH.unshift File.expand_path('../../page_objects', __FILE__)

require "capybara/cucumber"
# require "capybara-screenshot/cucumber"
# require "capybara/rspec"
# require 'byebug'
# require 'faker'
# require "selenium-webdriver"
# require "rspec/retry"
# require "pry"
# require "securerandom"
# require "yaml"
require "dotenv"
require "site_prism"
# require "httparty"
require "uri"
# require "net/http"
# require "headless"
# require "nokogiri"
# require "open-uri"
# require "filesize"
# require "fileutils"
# require "net/http/post/multipart"
# require "logger"
# require "uri"
# require "net/ssh"
# require 'record_time'
# require 'grafana'
# require 'cinta'
# require 'browsermob/proxy'
# require 'logger'
# require 'webdrivers'
# require 'rotp'
# require 'json'
# require 'jwt'
# require 'magick_title'

Dotenv.load
Dotenv.overload(".env.#{ENV['ENV']}")









