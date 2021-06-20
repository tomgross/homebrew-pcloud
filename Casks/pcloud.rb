cask 'pcloud' do
  version '3.10.3'
  sha256 '44df032206a1156d30d7ef221be99d832e0537406bc0ba57438792ab5611787c'

  url do
    require 'net/http'
    require 'json'
    api = 'https://api.pcloud.com/'
    code = 'XZ0ndMXZHwvGuThOJ3YVFQb2SJqRajzkBRjy'
    uri = URI(api + 'getpublinkdownload?code=' + code)
    response = Net::HTTP.get(uri)
    data = JSON.parse(response)
    data['hosts'][0] + data['path']
  end
  name 'pCloud Drive'
  homepage 'https://www.pcloud.com/'

  depends_on cask: 'osxfuse'

  pkg 'pCloud Drive 3.10.3.pkg'

  uninstall quit:    'com.pcloud.pcloud.macos',
            pkgutil: 'com.mobileinno.pkg.pCloudDrive'
end
