class TamediaTunnel < Formula
  desc "AWS service tunneling tool for Kubernetes - Tamedia Edition"
  homepage "https://github.com/dnd-it/tamedia-tools"
  url "https://github.com/dnd-it/tamedia-tools/archive/v1.0.0.tar.gz"
  sha256 "35b8c16cba70717f6770627d408a9504ef0f4ab5649cd4daf8ad1679b380be73"
  license "MIT"
  version "1.0.0"
  
  depends_on "awscli"
  depends_on "jq"
  depends_on "kubernetes-cli"
  depends_on "fzf" => :recommended
  
  def install
    bin.install "tools/tunnel/tunnel.sh" => "tamedia-tunnel"
    bin.install "scripts/common.sh" => "tamedia-common"
    
    # Install completion scripts
    bash_completion.install "completion/tamedia-tunnel.bash" => "tamedia-tunnel"
    zsh_completion.install "completion/_tamedia-tunnel"
  end
  
  test do
    system "#{bin}/tamedia-tunnel", "--version"
  end
end