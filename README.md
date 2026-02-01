# Bash Automation Toolkit: Log Rotator

A robust Bash utility designed to automate the lifecycle of log files. This script prevents disk space exhaustion by automatically compressing aging logs and purging expired ones.

### Features
- Individual Compression: Compresses `.log` files into `.gz` format individually for granular recovery.

- Automated Cleanup: Automatically deletes files older than 30 days.

- Production Ready:  Uses `set -euo` pipefail for strict error handling.

    - Handles filenames with spaces using `find -print0`.

    - Fully compatible with Cron for scheduled maintenance.


### Usage
#### Manual Execution
You can run the script against any directory by passing the path as an argument:
```bash
./log_cleaner.sh /path/to/your/logs
```
If no path is provided, it defaults to the current directory.
#### Automation with Cron
```Code Snippet
0 2 * * 5 /path/to/your/script.sh >> /path/to/your/cron.log 2>&1
```

