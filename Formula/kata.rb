class Kata < Formula
  desc "Code review for jj (jujutsu) workflows with web, HTTP, and MCP surfaces"
  homepage "https://github.com/martint/kata"
  url "https://github.com/martint/kata.git", branch: "main"
  version "main"
  license "Apache-2.0"
  head "https://github.com/martint/kata.git", branch: "main"

  depends_on "bun" => :build
  depends_on "rust" => :build
  depends_on "gh"
  depends_on "jj"

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "crates/kata-server"
  end

  test do
    assert_match "kata", shell_output("#{bin}/kata --help")
  end
end
