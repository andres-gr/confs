#!/usr/bin/env bash

# --enable-features=WebRTCPipeWireCapturer

# Fix Slack screen sharing on Wayland
sudo sed -i'.backup' -e 's/,"WebRTCPipeWireCapturer"/,"LebRTCPipeWireCapturer"/' /usr/lib/slack/resources/app.asar
