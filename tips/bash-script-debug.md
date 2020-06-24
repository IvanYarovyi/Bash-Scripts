# Enable trace mode for the entire script:
Add -x as parameter to shebang. Put this to the top of the script - *#!/bin/bash -x*

# Enabling tracing for only one section of the script:
set -x # Turn on tracing
set +x # Turn off tracing