#!/bin/bash
# Get project root directory
PROJECT_DIR="$(cd "$(dirname "$0")/.." && pwd)"

# Load configuration
source "$PROJECT_DIR/config/config.conf"

# Color codes
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'  

log_message() {
    LEVEL=$1
    MESSAGE=$2
    TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")

    echo "$TIMESTAMP [$LEVEL] $MESSAGE" >> "$LOG_FILE"

    case $LEVEL in
        INFO)
            echo -e "${GREEN}$TIMESTAMP [$LEVEL] $MESSAGE${NC}"
            ;;
        WARNING)
            echo -e "${YELLOW}$TIMESTAMP [$LEVEL] $MESSAGE${NC}"
            ;;
        ERROR)
            echo -e "${RED}$TIMESTAMP [$LEVEL] $MESSAGE${NC}"
            ;;
        *)
            echo -e "${BLUE}$TIMESTAMP [$LEVEL] $MESSAGE${NC}"
            ;;
    esac
}
