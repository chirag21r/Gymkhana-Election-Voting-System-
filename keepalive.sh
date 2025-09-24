#!/bin/bash

# IIIT Kalyani Gymkhana Voting System - Keepalive Script
# This script pings your Render service every 5 minutes to keep it awake

SERVICE_URL="https://voting-app-ekks.onrender.com"
KEEPALIVE_ENDPOINT="/keepalive"
DEBUG_ENDPOINT="/debug"

echo "🔄 Starting keepalive service for IIIT Kalyani Gymkhana Voting System"
echo "📍 Service URL: $SERVICE_URL"
echo "⏰ Ping interval: Every 5 minutes"
echo "🛑 Press Ctrl+C to stop"
echo ""

while true; do
    echo "$(date): Pinging service..."
    
    # Ping the keepalive endpoint
    if curl -s -f "$SERVICE_URL$KEEPALIVE_ENDPOINT" > /dev/null; then
        echo "✅ Service is alive and responding"
    else
        echo "❌ Service ping failed, trying debug endpoint..."
        if curl -s -f "$SERVICE_URL$DEBUG_ENDPOINT" > /dev/null; then
            echo "✅ Service is alive (via debug endpoint)"
        else
            echo "❌ Service appears to be down"
        fi
    fi
    
    echo "⏳ Waiting 5 minutes..."
    sleep 300  # 5 minutes = 300 seconds
done
