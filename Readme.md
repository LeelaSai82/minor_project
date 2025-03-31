# Project Documentation

## Project Overview
This project provides a set of Bash scripts for managing system performance, user accounts, groups, and file systems. The scripts are containerized using Docker for easy deployment and execution.

### Scripts Included:
1. **system_monitor.sh**: Monitors system performance (CPU and memory usage) and logs reports.
2. **user_script.sh**: Manages user accounts (add, delete, list users).
3. **group_script.sh**: Manages groups (add, delete, list groups).
4. **file_script.sh**: Manages file system operations (create directories, set permissions, check disk usage).

---

## Setup Instructions

### Prerequisites
- Docker installed on your system.
- Basic understanding of Bash scripting and Docker.

### Steps to Set Up
1. Clone or download the project files to your local machine.
2. Navigate to the project directory:
   ```sh
   cd /path/to/project
   
   
3. docker build -t bash-scripts-container .

4. docker run -it bash-scripts-container /bin/bash

Usage Instructions
Running the Scripts
By default, the container runs user_script.sh. You can interact with the menu to manage users.
To run other scripts, modify the CMD instruction in the Dockerfile to point to the desired script. For example:
Then rebuild the Docker image and run the container.
Logs
Logs for each script are stored in the following locations inside the container:
system_monitor.sh: /var/log/system_performance.log
user_script.sh: /var/log/user_management.log
group_script.sh: /var/log/group_management.log
file_script.sh: /var/log/filesystem_management.log
Issues Encountered During Implementation
Permission Errors:

Issue: Scripts may fail to execute due to insufficient permissions.
Solution: Ensure the RUN chmod +x *.sh line in the Dockerfile is present to make all scripts executable.
Log File Access:

Issue: Log files are written to /var/log, which may require elevated permissions.
Solution: Run the container with appropriate permissions or modify the log file paths to a user-accessible directory.
Infinite Loops in Scripts:

Issue: Scripts like system_monitor.sh run indefinitely.
Solution: Use docker exec to interact with the container or modify the script to include a termination condition for testing.
Docker Build Context:

Issue: If the *.sh files are not in the same directory as the Dockerfile, the COPY *.sh . instruction will fail.
Solution: Ensure all .sh files are in the same directory as the Dockerfile before building the image.
Future Improvements
Add environment variables to configure log file paths and intervals dynamically.
Implement better error handling in the scripts.
Provide a unified entry point script to manage all functionalities.
