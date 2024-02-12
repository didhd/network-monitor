# iOS Tethering Network Issue Configurator

This project provides a Swift application that automatically adjusts macOS network settings based on the SSID of the currently connected Wi-Fi network. Specifically, it switches the network configuration between manual IP settings and DHCP based on whether the device is connected to an iPhone's tethering SSID, like "Sanghwa's iPhone" in this case.

## Features

- **Automatic Detection**: Continuously monitors the Wi-Fi SSID.
- **Network Configuration Switching**: Toggles between manual IP configuration and DHCP depending on the connected SSID.
- **Customizable**: Easy to adjust for different SSIDs or network settings.

| iPhone SSID                      | Other SSID                      |
| -------------------------------- | ------------------------------- |
| Manual IP configuration          | DHCP configuration              |
| Fixed IP, subnet mask, router IP | Dynamic IP assignment           |
| Disables roaming                 | Allows roaming between networks |

When connected to an iPhone hotspot, the network is configured with:

- Manual IP address: 172.20.10.2
- Subnet mask: 255.255.255.240
- Router IP: 172.20.10.1

This allows easy tethering to an iPhone when needed, while still permitting connectivity to other WiFi networks.

## Requirements

- macOS (Tested on macOS Monterey and later)
- Swift
- Administrator privileges for changing network settings

## Installation

1. Clone the project with `git clone https://github.com/didhd/network-monitor`

2. Run the `install.sh` script:

    ```bash
    cd network-monitor
    bash install.sh
    ```
    
    This script will:
    
    - Create necessary directories
    - Compile the Swift code
    - Generate a `.plist` file to run on startup 
    - Register the Launch Agent
    
## Code Overview

- `main.swift`: Main Swift file containing program logic
- `install.sh`: Installation script

## Logging

- `$HOME/Library/Application Support/networkMonitor/output.log`: Program output log
- `$HOME/Library/Application Support/networkMonitor/error.log`: Program error log

Check the logs to monitor status.

## References

- [NWPathMonitor](https://developer.apple.com/documentation/network/nwpathmonitor) 

## Contributing

Contributions are welcome! Please submit a pull request or open an issue for any bugs, features, or improvements.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

- This project was inspired by the need for a seamless internet connection experience while using iPhone tethering on macOS.

## Disclaimer

Use this application at your own risk. Always test in a non-critical environment before deploying in a production setting.
