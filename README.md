# Bash Automation Toolkit: Log Rotator

A robust Bash utility designed to automate the lifecycle of log files. This script prevents disk space exhaustion by automatically compressing aging logs and purging expired ones.

### Features
- Individual Compression: Compresses .log files into .gz format individually for granular recovery.

- Automated Cleanup: Automatically deletes files older than 30 days.

- Production Ready: * Uses set -euo pipefail for strict error handling.

- Handles filenames with spaces using find -print0.

- Fully compatible with Cron for scheduled maintenance.