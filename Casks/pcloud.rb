cask "pcloud" do
  version "3.11.9"

  if Hardware::CPU.intel?
    sha256 "58742bd2752b098c5489e74d543cdf25ca862f100f0819329382469fc9532850"
    pkg "pCloud Drive #{version.to_s}.pkg"
    code = "XZo7mjVZMDpFbSo6SYuTzNiNH49xs7zpuwFX"
  else
    sha256 "e2a19752339a33017d0973807c5e1df0d257bed012fabd14828ef8218d15a5ef"
    pkg "pCloud Drive #{version.to_s} macFUSE.pkg"
    code = "XZo7mjVZMDpFbSo6SYuTzNiNH49xs7zpuwFX"
  end

  url do
    require 'net/http'
    require 'json'
    api = 'https://api.pcloud.com/'
    uri = URI(api + 'getpublinkdownload?code=' + code)
    response = Net::HTTP.get(uri)
    data = JSON.parse(response)
    data['hosts'][0] + data['path']
  end
  name 'pCloud Drive'
  homepage 'https://www.pcloud.com/'
  desc "Client for the pCloud storage"

  depends_on cask: 'osxfuse'

  pkg 'pCloud Drive 3.11.9.pkg'

  uninstall quit:    'com.pcloud.pcloud.macos',
            pkgutil: 'com.mobileinno.pkg.pCloudDrive'
end
