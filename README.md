# User Agent Generator

A simple library to generate fake user agents for various platforms and browsers. This library can be useful for web scraping, testing, and simulating user behavior in web applications.

## Features

- Generates random user agents for multiple platforms:
  - Chrome
  - Firefox
  - Safari
  - Microsoft Edge
  - Internet Explorer
  - Android
  - iOS
  - Linux
  - Mac
  - Windows
- Customizable version and build numbers
- Easy to use and integrate into your projects

## Installation

You can install the package using pip:

```bash
gem install spoofagent
```

## Usage
Here’s how to use the UserAgentGenerator class in your project:

## Example
```rb
# import library
require 'spoofagent'

# Create an instance of UserAgentGenerator
generator = UserAgentGenerator.new

# various platforms
chrome_ua = generator.generate_user_agent('chrome')
firefox_ua = generator.generate_user_agent('firefox')
safari_ua = generator.generate_user_agent('safari')
edge_ua = generator.generate_user_agent('edge')
ie_ua = generator.generate_user_agent('ie')
android_ua = generator.generate_user_agent('android')
ios_ua = generator.generate_user_agent('ios')
linux_ua = generator.generate_user_agent('linux')
mac_ua = generator.generate_user_agent('mac')
windows_ua = generator.generate_user_agent('windows')

# Displays the generated user agent
puts "Chrome User Agent: #{chrome_ua}"
puts "Firefox User Agent: #{firefox_ua}"
puts "Safari User Agent: #{safari_ua}"
puts "Edge User Agent: #{edge_ua}"
puts "Internet Explorer User Agent: #{ie_ua}"
puts "Android User Agent: #{android_ua}"
puts "iOS User Agent: #{ios_ua}"
puts "Linux User Agent: #{linux_ua}"
puts "Mac User Agent: #{mac_ua}"
puts "Windows User Agent: #{windows_ua}"
```

## Customizing User Agents
You can customize the version and build numbers when generating user agents:
```rb
custom_ua = generator.generate_user_agent('chrome', version='89', build='1234')
puts "Custom Chrome User Agent:", #{custom_ua}
```

## Platform Options
The following platforms are supported:

- chrome
- firefox
- safari
- edge
- ie
- android
- ios
- linux
- mac
- windows
