class TamediaTools < Formula
  desc "Complete suite of AWS and Kubernetes productivity tools - Tamedia Edition"
  homepage "https://github.com/dnd-it/tamedia-tools"
  url "https://github.com/DND-IT/tamedia-tools/archive/v1.2.1.tar.gz"
  sha256 "a41089da1f6a6f3a1a8acbb2e8579ef24b1aedeb57db0f2bee9475c96ba30622"
  license "MIT"
  version "1.2.1"
  
  depends_on "awscli"
  depends_on "jq"
  depends_on "kubernetes-cli"
  depends_on "fzf" => :recommended
  
  def install
    # Install all tools
    bin.install "tools/tunnel/tunnel.sh" => "tamedia-tunnel"
    bin.install "tools/aws-cli/aws-cli-helpers.sh" => "tamedia-aws-cli-helpers"

    # Install shared utilities
    bin.install "scripts/common.sh" => "tamedia-common"

    # Install completion scripts
    bash_completion.install "completion/tamedia-tunnel.bash" => "tamedia-tunnel"
    zsh_completion.install "completion/_tamedia-tunnel"
  end
  
  def caveats
    <<~EOS
      Tamedia Tools have been installed with the following commands:
        tamedia-tunnel           - Tunnel to AWS services through Kubernetes
        tamedia-aws-cli-helpers  - Interactive AWS CLI helper tools

      Setup AWS CLI aliases (recommended):
        tamedia-aws-cli-helpers --setup-aliases

      Then use AWS CLI aliases anywhere:
        aws eks-config           # Interactive cluster selection
        aws eks-list            # List clusters with status
        aws eks-describe CLUSTER # Detailed cluster info

      Run any command with --help for usage information.

      Documentation: https://github.com/dnd-it/tamedia-tools
    EOS
  end
  
  test do
    system "#{bin}/tamedia-tunnel", "--version"
    system "#{bin}/tamedia-aws-cli-helpers", "--version"
  end
end