class Logr < Formula
  desc "Search the commit history of every git repository under a directory"
  homepage "https://github.com/kova1max/logr"
  url "https://github.com/kova1max/logr/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "d1164e40ea6ac1a50b27f06921911c15de0cc8880037efbd50b29bed6dd6ba30"
  license "MIT"

  def install
    bin.install "bin/logr"
  end

  test do
    assert_match "logr #{version}", shell_output("#{bin}/logr --version")

    system "git", "init", "--quiet", "repo"
    system "git", "-C", "repo", "-c", "user.name=Test", "-c", "user.email=test@example.com",
           "commit", "--quiet", "--allow-empty", "-m", "Fix the login redirect (#7)"
    output = shell_output("#{bin}/logr login #{testpath}")
    assert_match(/^repo\t\h+\t[\d-]+\tTest\t\S+\t#7\tFix the login redirect \(#7\)$/, output)
  end
end
