#!/usr/bin/env bash
set -euo pipefail

PLUGIN_NAME="deep_research_workflow"
REPO_URL="https://github.com/Yigal/deep_research_workflow.git"
INSTALL_DIR="${HOME}/.claude/plugins/${PLUGIN_NAME}"

echo "================================================"
echo "  Deep Research Workflow — Plugin Installer"
echo "================================================"
echo ""

# Check dependencies
if ! command -v git &>/dev/null; then
  echo "Error: git is not installed."
  exit 1
fi

if ! command -v claude &>/dev/null; then
  echo "Warning: claude CLI not found in PATH. Plugin will be installed but you'll need Claude Code to use it."
fi

# Create plugins directory if needed
mkdir -p "${HOME}/.claude/plugins"

# Install or update
if [ -d "${INSTALL_DIR}" ]; then
  echo "Updating existing installation..."
  git -C "${INSTALL_DIR}" pull --ff-only
else
  echo "Cloning plugin..."
  git clone "${REPO_URL}" "${INSTALL_DIR}"
fi

echo ""
echo "Installed to: ${INSTALL_DIR}"
echo ""
echo "Usage:"
echo "  claude --plugin-dir ${INSTALL_DIR}"
echo ""
echo "Or add this alias to your shell profile:"
echo "  alias claude-research='claude --plugin-dir ${INSTALL_DIR}'"
echo ""
echo "Then run:"
echo "  /deep_research_workflow:deep-research \"your topic\""
echo ""
echo "Done."
