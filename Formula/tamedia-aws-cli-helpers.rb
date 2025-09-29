class TamediaAwsCliHelpers < Formula
  desc "Interactive AWS CLI helper tools with enhanced integrations"
  homepage "https://github.com/dnd-it/tamedia-tools"
  url "https://github.com/dnd-it/tamedia-tools/archive/v1.2.0.tar.gz"
  sha256 "934762e43fc0b7e9b8d629ea67cfb9065fbb6ea372604f275835f2bcf5bc266f"
  license "MIT"
  version "1.2.0"

  depends_on "awscli"
  depends_on "jq"
  depends_on "kubernetes-cli"
  depends_on "fzf" => :recommended

  def install
    # Install AWS CLI helper tool
    bin.install "tools/aws-cli/aws-cli-helpers.sh" => "tamedia-aws-cli-helpers"

    # Install shared utilities
    bin.install "scripts/common.sh" => "tamedia-common"
  end

  def caveats
    <<~EOS
      Tamedia AWS CLI Helper has been installed.

      Setup AWS CLI aliases (recommended):
        tamedia-aws-cli-helpers --setup-aliases

      Then use AWS CLI aliases anywhere:
        aws eks-config           # Interactive cluster selection
        aws eks-list            # List clusters with status
        aws eks-describe CLUSTER # Detailed cluster info

      Run tamedia-aws-cli-helpers --help for usage information.

      Documentation: https://github.com/dnd-it/tamedia-tools/tree/main/tools/aws-cli
    EOS
  end

  test do
    system "#{bin}/tamedia-aws-cli-helpers", "--version"
  end
end