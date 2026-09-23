class Pullr < Formula
  desc "Fast-forward pull every git repository under a directory"
  homepage "https://github.com/kova1max/pullr"
  url "https://github.com/kova1max/pullr/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "84c3e2598c6dbb28e94ec7e4e4bee3e45eaaa2f842d0bdf6f556086da2684111"
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
