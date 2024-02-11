# iOS Tethering Network Configurator

This project provides a Go application that automatically adjusts macOS network settings based on the SSID of the currently connected Wi-Fi network. Specifically, it switches the network configuration between manual IP settings and DHCP based on whether the device is connected to an iPhone's tethering SSID, like "Sanghwa's iPhone" in this case.

## Features

- **Automatic Detection**: Continuously monitors the Wi-Fi SSID.
- **Network Configuration Switching**: Toggles between manual IP configuration and DHCP depending on the connected SSID.
- **Customizable**: Easy to adjust for different SSIDs or network settings.

## Requirements

- macOS (Tested on macOS Monterey and later)
- Go (Version 1.15 or later recommended)
- Administrator privileges for changing network settings

## Installation

1. **Clone the Repository**:
   ```sh
   git clone https://yourrepository.com/ios-17-tethering-daemon.git
   cd ios-17-tethering-daemon
   ```

2. **Build the Application**:
   ```sh
   go build -o ssidSwitcher main.go
   ```

## Usage

Execute the binary with sufficient privileges to modify network settings:

```sh
sudo ./ssidSwitcher
```

The application runs in the background, monitoring the current Wi-Fi SSID. When it detects a connection to "Sanghwa's iPhone", it switches to a predefined manual IP configuration. For all other SSIDs, it reverts the network settings to DHCP.

## Configuration

To customize the SSID or network settings, edit the following constants in `main.go`:

- `ssidToMatch`: The SSID to trigger manual IP configuration.
- `ipManual`, `subnetMask`, `routerIP`: The manual IP settings to apply.

After making changes, rebuild the application using the build command provided in the Installation section.

## Contributing

Contributions are welcome! Please submit a pull request or open an issue for any bugs, features, or improvements.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

- This project was inspired by the need for a seamless internet connection experience while using iPhone tethering on macOS.

## Disclaimer

Use this application at your own risk. Always test in a non-critical environment before deploying in a production setting.
# network-monitor
