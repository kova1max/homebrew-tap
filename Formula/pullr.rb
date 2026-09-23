class Pullr < Formula
  desc "Safe, fast-forward pull every git repository under a directory"
  homepage "https://github.com/kova1max/pullr"
  url "https://github.com/kova1max/pullr/archive/refs/tags/v0.5.0.tar.gz"
  sha256 "419c5732684915798c947282a09a1c1b820877625c9b87bbe3aba52642553b75"
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
