# 🤖 Pingfluxor

**Pingfluxor** is a smart, lightweight shell-based chatbot that monitors IP addresses, detects network fluctuations, and sends real-time Telegram alerts when devices go offline or return online. Designed for sysadmins, NOC engineers, and IT support teams.

---

## 📌 Features

- 🔄 Continuously ping IPs from a list
- 🔔 Detects port/IP **fluctuations** (UP ⇄ DOWN)
- 📤 Sends **Telegram alerts** when a change is detected
- 🗃 Logs all activity and fluctuation counts to CSV
- 🪟 Works with Git Bash, WSL, or Linux terminal
- 🖱️ Includes Windows double-click `.bat` launcher

---

## 🛠️ Setup

1. Clone the repository:

```bash
git clone https://github.com/Adulsatl/PingFluxor.git
cd pingfluxor
```

2. Create `ip_list.txt` with one IP per line:
```
192.168.1.1
192.168.1.100
8.8.8.8
```

3. Edit the script and add your Telegram credentials:
- Bot Token
- Chat ID

4. Run manually or on a schedule:

```bash
bash switch_port_fluctuation_tracker.sh
```

Or double-click `Run-SwitchPortTracker.bat` on Windows.

---

## 🔔 Telegram Alerts

To enable Telegram alerts:

- Create a bot via [@BotFather](https://t.me/BotFather)
- Add your bot token and chat ID inside the script under `send_alert()` function

---

## 📄 Files

| File | Description |
|------|-------------|
| `switch_port_fluctuation_tracker.sh` | Main monitoring script |
| `Run-SwitchPortTracker.bat` | Windows launcher |
| `ip_list.txt` | Your target IPs |
| `fluctuation_log.csv` | Logs with counts/status |
| `README.md` | This file |

---

## 👤 Author

**Adul S**   
📧 aduls.career@gmail.com  
🔗 [LinkedIn](https://linkedin.com/in/aduls2002)

---

## 📜 License

MIT License. Free to use, modify, and share.

---

> 🧠 Tip: Combine with crontab or Task Scheduler for 24/7 automated monitoring.
