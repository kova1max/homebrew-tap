class Logr < Formula
  desc "Search the commit history of every git repository under a directory"
  homepage "https://github.com/kova1max/logr"
  url "https://github.com/kova1max/logr/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "0000000000000000000000000000000000000000000000000000000000000000"
  license "MIT"

  def install
    bin.install "bin/logr"
  end

  test do
    assert_match "logr #{version}", shell_output("#{bin}/logr --version")

    system "git", "init", "--quiet", "repo"
    system "git", "-C", "repo", "-c", "user.name=Test", "-c", "user.email=test@example.com",
           "commit", "--quiet", "--allow-empty", "-m", "Fix the login redirect"
    output = shell_output("#{bin}/logr login #{testpath}")
    assert_match(/^repo\t\h+\t[\d-]+\tTest\t\S+\tFix the login redirect$/, output)
  end
end
