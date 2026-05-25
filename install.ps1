# Development Environment Setup for Windows
param([switch]$SkipDocker = $false)

function Write-Info { Write-Host "[INFO] $args" -ForegroundColor Green }
function Write-Warn { Write-Host "[WARN] $args" -ForegroundColor Yellow }

Write-Info "Starting dev environment setup..."

# Check for required tools
$requiredTools = @("git", "python", "curl")
foreach ($tool in $requiredTools) {
    try {
        $version = & $tool --version 2>$null
        Write-Info "$tool: $(($version -split "`n")[0])"
    } catch {
        Write-Warn "$tool not found in PATH"
    }
}

# Python virtual environment
if (-not (Test-Path .venv)) {
    Write-Info "Creating Python virtual environment..."
    python -m venv .venv
    & .\.venv\Scripts\Activate.ps1
    Write-Info "Virtual environment created"
}

Write-Info "Environment setup complete"
Write-Info "Activate venv with: .\.venv\Scripts\Activate.ps1"
