class Pullr < Formula
  desc "Safe, fast-forward pull every git repository under a directory"
  homepage "https://github.com/kova1max/pullr"
  url "https://github.com/kova1max/pullr/archive/refs/tags/v0.9.0.tar.gz"
  sha256 "278ee84eeda9c99202cf4ac1b6de770a59bca111d4b4797e6a7e2b80c5446f9b"
  license "MIT"

  def install
    bin.install "bin/pullr"
  end

  test do
    assert_match "pullr #{version}", shell_output("#{bin}/pullr --version")

    system "git", "init", "--quiet", "repo"
    output = shell_output("#{bin}/pullr --max-depth 1 #{testpath}")
    assert_match(/^- repo \(\S+ has no upstream\)$/, output)
  end
end
