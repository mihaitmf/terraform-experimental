#!/usr/bin/env bash

BINARY_NAME=${1}
DOWNLOAD_URL=${2}
ARCHIVE_FILE_NAME=${3}
SOURCES_DIR_NAME=${4}
STARTUP_CONFIG_FILE=${5}

# If package already exists, skip installation
if type ${BINARY_NAME} >/dev/null 2>&1; then
    echo "${BINARY_NAME} already exists, skipping..."
    exit 0
fi

echo "Installing ${BINARY_NAME}..."

# Download
wget ${DOWNLOAD_URL} -O ${ARCHIVE_FILE_NAME} >/dev/null 2>&1

# Extract
mkdir ${SOURCES_DIR_NAME}
unzip ${ARCHIVE_FILE_NAME} -d ${SOURCES_DIR_NAME} >/dev/null
rm -f ${ARCHIVE_FILE_NAME}

# Move sources to /opt
rm -rf /opt/${SOURCES_DIR_NAME}
mv ${SOURCES_DIR_NAME} /opt

# Add binary to $PATH and setup environment variables
cat > ${STARTUP_CONFIG_FILE} <<EOL
export PATH=\$PATH:/opt/${SOURCES_DIR_NAME}
EOL

chmod a+x ${STARTUP_CONFIG_FILE}

# Load environment variables
source ${STARTUP_CONFIG_FILE}

# Check installation succeeded
if ! type ${BINARY_NAME} >/dev/null 2>&1; then
    echo "ERROR installing ${BINARY_NAME}"
    exit 1
fi

echo "DONE"

exit 0
