require 'securerandom'

class UserAgentGenerator
  def initialize
    @user_agents = {
      'chrome' => [
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/%{version}.0.%{build}.0 Safari/537.36',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/%{version}.0.%{build}.0 Safari/537.36',
        'Mozilla/5.0 (Linux; Android %{android_version}; Nexus 5X Build/N2G48H) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/%{version}.0.%{build}.0 Mobile Safari/537.36',
      ],
      'firefox' => [
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:%{version}.0) Gecko/20100101 Firefox/%{version}.0',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7; rv:%{version}.0) Gecko/20100101 Firefox/%{version}.0',
        'Mozilla/5.0 (Linux; Android %{android_version}; Nexus 5 Build/MRA58N) Gecko/20100101 Firefox/%{version}.0',
      ],
      'safari' => [
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/%{version}.0.0.0 Safari/605.1.15',
        'Mozilla/5.0 (iPhone; CPU iPhone OS %{ios_version} like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/%{version}.0 Mobile/15E148 Safari/604.1',
      ],
      'edge' => [
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/%{version}.0.%{build}.0 Safari/537.36 Edg/%{version}.0.%{build}',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64; Trident/7.0; AS; rv:%{version}.0) like Gecko',
      ],
      'ie' => [
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64; Trident/7.0; AS; rv:%{version}.0) like Gecko',
        'Mozilla/5.0 (compatible; MSIE %{version}.0; Windows NT 10.0; Trident/7.0)',
      ],
      'android' => [
        'Mozilla/5.0 (Linux; Android %{android_version}; Nexus 5X Build/N2G48H) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/%{version}.0.%{build}.0 Mobile Safari/537.36',
        'Mozilla/5.0 (Linux; Android %{android_version}; SAMSUNG SM-G920F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/%{version}.0.%{build}.0 Mobile Safari/537.36',
        'Mozilla/5.0 (Linux; Android %{android_version}; Redmi 6A) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/%{version}.0.%{build}.0 Mobile Safari/537.36',
        'Mozilla/5.0 (Linux; Android %{android_version}; Infinix X6837 Build/TP1A.220624.014; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/%{version}.0.%{build}.0 Mobile Safari/',
      ],
      'ios' => [
        'Mozilla/5.0 (iPhone; CPU iPhone OS %{ios_version} like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/%{version}.0 Mobile/15E148 Safari/604.1',
        'Mozilla/5.0 (iPad; CPU OS %{ios_version} like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/%{version}.0 Mobile/15E148 Safari/604.1',
      ],
      'linux' => [
        'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/%{version}.0.%{build}.0 Safari/537.36',
        'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/%{version}.0.%{build}.0 Safari/537.36',
      ],
      'mac' => [
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/%{version}.0.%{build}.0 Safari/537.36',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7; rv:%{version}.0) Gecko/20100101 Firefox/%{version}.0',
      ],
      'windows' => [
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/%{version}.0.%{build}.0 Safari/537.36',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64; Trident/7.0; AS; rv:%{version}.0) like Gecko',
      ]
    }
  end

  def generate_user_agent(platform, version = nil, build = nil, android_version = nil, ios_version = nil)
    raise ArgumentError, "Platform not supported. Choose from: #{@user_agents.keys.join(', ')}" unless @user_agents.key?(platform)

    user_agent_template = @user_agents[platform].sample

    version ||= rand(80..100).to_s
    build ||= rand(1000..9999).to_s
    android_version ||= rand(4..14).to_s
    ios_version ||= rand(10..15).to_s

    user_agent = user_agent_template % {
      version: version,
      build: build,
      android_version: android_version,
      ios_version: ios_version
    }

    user_agent
  end
end
