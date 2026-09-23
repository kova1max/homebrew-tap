class Pullr < Formula
  desc "Fast-forward pull every git repository under a directory"
  homepage "https://github.com/kova1max/pullr"
  url "https://github.com/kova1max/pullr/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "a30c0a59b94b27c119255a7708ef72f818373f127979a3fc007ad307d75d9048"
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
