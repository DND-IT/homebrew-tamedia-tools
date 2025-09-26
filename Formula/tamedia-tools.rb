class TamediaTools < Formula
  desc "Complete suite of AWS and Kubernetes productivity tools - Tamedia Edition"
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
    # Install all tools
    bin.install "tools/tunnel/tunnel.sh" => "tamedia-tunnel"
    bin.install "tools/aws-cli/aws-eks-config.sh" => "tamedia-aws-eks-config"

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
        tamedia-aws-eks-config   - Interactive EKS cluster configuration

      Setup AWS CLI aliases (recommended):
        tamedia-aws-eks-config --setup-aliases

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
    system "#{bin}/tamedia-aws-eks-config", "--version"
  end
end