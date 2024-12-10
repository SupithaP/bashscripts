#!/bin/bash

# This script displays information about the system on which it is executed.

# Start of the script.
echo "Starting the script."

# Display the hostname of the system.
hostname

# Display the current date and time when this information is collected.
date

# Display the kernel release followed by the architecture.
uname -r
uname -m

# Display the disk usage in a human readable format.
df -h

# End of the script.
echo "End of the script."
