class Pullr < Formula
  desc "Fast-forward pull every git repository under a directory"
  homepage "https://github.com/kova1max/pullr"
  url "https://github.com/kova1max/pullr/archive/refs/tags/v0.4.0.tar.gz"
  sha256 "5920183a591bb39970824448baff1be99cac28e81314d87000a0fbe2942cc2ed"
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
