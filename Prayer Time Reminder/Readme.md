# Prayer Time Notification Script

This Bash script fetches the Islamic prayer times for a specified city and country using the Aladhan API, then checks the current time to notify the user when a prayer time is near (within 10 minutes). The notification will appear on the desktop using `notify-send`.

## Features
- Fetches prayer times for a specific date, city, and country via the [Aladhan API](https://aladhan.com/prayer-times-api).
- Converts prayer times to minutes since midnight for easy comparison.
- Compares the current time to prayer times and sends a desktop notification 10 minutes before the prayer time.