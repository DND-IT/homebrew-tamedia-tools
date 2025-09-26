class TamediaTunnel < Formula
  desc "AWS service tunneling tool for Kubernetes - Tamedia Edition"
  homepage "https://github.com/dnd-it/tamedia-tools"
  url "https://github.com/DND-IT/tamedia-tools/archive/v1.2.0.tar.gz"
  sha256 "934762e43fc0b7e9b8d629ea67cfb9065fbb6ea372604f275835f2bcf5bc266f"
  license "MIT"
  version "1.2.0"
  
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