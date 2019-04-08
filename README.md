## IP2Location Nmap script

This IP2Location Nmap script provides a fast lookup of country, region, city, latitude, longitude, ZIP code, time zone, ISP, domain name, connection type, IDD code, area code, weather station code, station name, mcc, mnc, mobile brand, elevation, and usage type from IP address by using the IP2Location Lua Package. 

The database will be updated in monthly basis for the greater accuracy. Free LITE databases are available at <https://lite.ip2location.com/> upon registration.

The paid databases are available at [https://www.ip2location.com](https://www.ip2location.com/) under Premium subscription package.

Please take note that this script only support the IPV4 IP address at the moment. The IPV6 IP address will be supported in future.

## Installation

If the Luarocks have installed with the latest dependency (5.3), you can install with the following steps:

1. Download and unzip the package. 

2. Copy the ip-geolocation-ip2location.nse to your Nmap program directory/scripts. 

   Note: The default Nmap program directory for Linux user should be under /usr/share/, for example /usr/share/nmap. For Windows user, the Nmap directory should be C:\Program Files (x86)\Nmap.

3. Install the [IP2Location Lua](https://github.com/ip2location/ip2location-lua) Library by using this command: `luarocks install ip2location` 

4. Download the database from <https://lite.ip2location.com/> for free version or [https://www.ip2location.com](https://www.ip2location.com/) for paid version.

However, if the Luarocks is not installed, or you do not prefer to install the Luarocks, you can also install the script manually with the following steps:

1. Download and unzip the package. 

2. Copy the ip-geolocation-ip2location.nse to your Nmap program directory/scripts. 

3. Get the [ip2location.lua](https://github.com/ip2location/ip2location-lua/blob/master/ip2location.lua) & [BigNum library](https://github.com/user-none/lua-nums) and copy it to your Nmap installation directory/nselib. 

   Note: The default Nmap program directory for Linux user should be under /usr/share/, for example /usr/share/nmap. For Windows user, the Nmap directory should be C:\Program Files (x86)\Nmap.

4. Download the database from https://lite.ip2location.com/ for free version or [https://www.ip2location.com](https://www.ip2location.com/) for paid version.



## Usage

`nmap --script ip-geolocation-ip2location <target> --script-args ip-geolocation-ip2location.ip2location_db=<database_path>`

Replace the `<target>` with the IP Address that you wish to search and the `<database_path>` with the IP2Location database file path in your computer. Remember to put double backslashes (\\\\) instead of single backslash(\\) in the path.

## Parameters

**ip2location_db**

Indicates the path of the database file to use.

# Copyright

Copyright (C) 2019 by IP2Location.com, [support@ip2location.com](mailto:support@ip2location.com)
