#!/usr/bin/env bash
# The dcos cli can be configured with environment variables
# See https://docs.d2iq.com/mesosphere/dcos/1.13/cli/configure/
dcos config set core.ssl_verify false
# Optionally set this for more log output in console
#export DCOS_LOG_LEVEL=error
