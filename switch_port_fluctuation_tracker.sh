#!/bin/bash

# ┌────────────────────────────────────────────┐
# │      PingFluxor - IP Fluctuation Tracker   │
# │       Author: Adul S              │
# │       Email: aduls.career@gmail.com         │
# └────────────────────────────────────────────┘

# 🔧 Config
IP_LIST="ip_list.txt"
LOG_FILE="fluctuation_log.csv"

# 🔔 Telegram Alert Config (Replace with your actual values)
BOT_TOKEN="YOUR_TELEGRAM_BOT_TOKEN"
CHAT_ID="YOUR_TELEGRAM_CHAT_ID"

# 🔔 Alert Function
send_alert() {
    MESSAGE="⚠️ IP status changed for $1: $2 → $3 at $(date)"
    curl -s -X POST "https://api.telegram.org/bot$BOT_TOKEN/sendMessage" \
        -d "chat_id=$CHAT_ID" \
        -d "text=$MESSAGE" > /dev/null
}

# 📄 Create log file with header if it doesn’t exist
if [ ! -f "$LOG_FILE" ]; then
    echo "IP,FluctuationCount,LastStatus" > "$LOG_FILE"
fi

# 🧠 Load existing state
declare -A status
declare -A fluctuations

while IFS=',' read -r ip count last_status; do
    if [ "$ip" != "IP" ]; then
        fluctuations["$ip"]=$count
        status["$ip"]=$last_status
    fi
done < "$LOG_FILE"

# 🔄 Main check loop
for ip in $(cat "$IP_LIST"); do
    ping -c 1 -W 1 "$ip" > /dev/null 2>&1
    if [ $? -eq 0 ]; then
        current_status="UP"
    else
        current_status="DOWN"
    fi

    last_status="${status[$ip]}"
    if [ "$last_status" != "" ] && [ "$last_status" != "$current_status" ]; then
        ((fluctuations["$ip"]++))
        send_alert "$ip" "$last_status" "$current_status"
    fi

    status["$ip"]=$current_status
done

# 💾 Save results to log
echo "IP,FluctuationCount,LastStatus" > "$LOG_FILE"
for ip in "${!status[@]}"; do
    echo "$ip,${fluctuations[$ip]:-0},${status[$ip]}" >> "$LOG_FILE"
done

echo "✅ PingFluxor scan completed at $(date)"
