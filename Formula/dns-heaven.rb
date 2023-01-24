# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class DnsHeaven < Formula
  desc "Fixes stupid macOS DNS stack (/etc/resolv.conf)"
  homepage "https://github.com/kcaebe/dns-heaven"
  version "0.1.0"

  depends_on "go"
  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kcaebe/dns-heaven/releases/download/v0.1.0/dns-heaven_0.1.0_darwin_arm64.tar.gz"
      sha256 "b93bd94a3e76ecfc85603d6c19ba9f20b04ff2a940231478f77244977d23f74b"

      def install
        bin.install "dns-heaven"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/kcaebe/dns-heaven/releases/download/v0.1.0/dns-heaven_0.1.0_darwin_amd64.tar.gz"
      sha256 "f8d106b8e87b60310d17c6b976d1d795728b429cdc1611360821fb9cd396e2c7"

      def install
        bin.install "dns-heaven"
      end
    end
  end

  plist_options startup: false

  def plist
    <<~EOS
      <?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>Label</key>
    <string>com.greenboxal.dnsheaven</string>
    <key>ProgramArguments</key>
    <array>
        <string>sudo</string>
        <string>#{bin}/dns-heaven</string>
    </array>
    <key>KeepAlive</key>
    <true/>
    <key>RunAtLoad</key>
    <true/>
</dict>
</plist>

    EOS
  end

  test do
    system "#{bin}/dns-heaven -version"
  end
end