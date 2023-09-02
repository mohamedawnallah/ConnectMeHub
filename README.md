# ConnectMeNow

ConnectMeNow is an open-source project designed exclusively for macOS users, simplifying Wi-Fi network management on this platform. It allows macOS users to seamlessly connect to specified Wi-Fi networks, ensuring a reliable and hassle-free network experience.

## Features

- Automatically connects to a list of preferred Wi-Fi networks.
- Supports fallback to a backup network if the primary networks are unavailable.
- Passwords are securely stored in the macOS Keychain for enhanced security.

## macOS Compatibility

ConnectMeNow is designed exclusively for macOS users. It takes advantage of macOS-specific features to simplify Wi-Fi network management on this platform.

Please note that this script is not compatible with other operating systems.


## Granting Keychain Access

To allow `osascript` to access the keychain and retrieve stored Wi-Fi passwords, follow these steps:

1. Open the "Keychain Access" application on your macOS.

2. Select the "Login" keychain on the left sidebar.

3. Search for the Keychain (Wi-Fi Name) that contains the Wi-Fi password and Select it.

3. Select the "Access Control" tab.

4. Click the "+" button to add an application to the list.

5. Navigate to `/usr/bin/osascript` and select it.

6. Click "Add" to grant `osascript` access to the keychain items.

## Getting Started

To get started with ConnectMeNow on macOS, follow these simple steps:

1. Clone the repository to your local machine.
```bash
git clone https://github.com/mohamedawnallah/ConnectMeNow.git
```
2. Open the project in your favorite code editor or script runner.
3. Customize the network configurations in the script by modifying the `mainNetworkSSIDs` and `backupNetworkSSIDs` properties. For example:
```applescript
-- Example: Customize the list of preferred networks
property mainNetworkSSIDs : {"MyHomeNetwork", "OfficeWiFi", "CafeFreeWiFi"}

-- Example: Set a backup network
property backupNetworkSSIDs : {"BackupNetwork"}
```
Run the script by executing the main() function.
```bash
osascript ConnectMeNow.scpt
```

## Running Periodically with Crontab
You can configure ConnectMeNow to run periodically using the crontab. Here's an example of how to set it up:
1. Open Terminal on your macOS.
2. Open your crontab configuration by running:
```bash
crontab -e
```
3. Add the following line to run ConnectMeNow every minute:
```bash
* * * * * osascript path/to/ConnectMeNow.scpt
```

This schedule runs ConnectMeNow every minute. However, you can customize the cron schedule to match your specific needs. The format for the cron schedule is as follows:

- The five asterisks (*) represent the minute, hour, day of the month, month, and day of the week fields, respectively.
- You can adjust the values in these fields to determine when ConnectMeNow runs.
- Refer to the [Crontab documentation](https://manpages.debian.org/stretch/cron/crontab.5.en.html) for more information on customizing your cron schedule.

After customizing your schedule, save and exit the crontab configuration to apply the changes.

ConnectMeNow will now run according to your specified schedule, automatically managing your Wi-Fi connections at the desired intervals.

## Usage
ConnectMeNow simplifies the process of connecting to preferred Wi-Fi networks on macOS. It automatically detects the current network and switches to a specified network if available. If no suitable network is found, it displays a notification.


## Contributing
Contributions to ConnectMeNow are welcome! If you have suggestions for improvements, new features, or would like to add support for other operating systems (such as Windows, Ubuntu, etc.), please open an issue or submit a pull request. 

## License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
