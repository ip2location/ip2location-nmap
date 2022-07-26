local ip2location = require "ip2location"
local nmap = require "nmap"
local stdnse = require "stdnse"

description = [[
Use IP2Location geolocation database to lookup the geolocation information with IP2Location Lua Package. It can be used to determine country, region, city, coordinates, zip code, time zone, ISP, domain name, connection type, area code, weather, MCC, MNC, mobile brand name, elevation, usage type, address type and IAB category that any IP address or hostname originates from. https://www.ip2location.com

The database will be updated on a monthly basis for greater accuracy. Free LITE databases are available at https://lite.ip2location.com/ upon registration.

The paid databases are available at https://www.ip2location.com under Premium subscription package.

Both IPv4 and IPv6 are supported.

]]

---
-- @usage
-- nmap --script ip-geolocation-ip2location <target> --script-args ip-geolocation-ip2location.ip2location_db=<database_path>
-- 
-- @arg ip2location_db string indicates the path of the database file to use to query the info.
--
-- @output
-- 8.8.8.8
-- country_short: US
-- country_long: United States
-- region: California
-- city: Mountain View
-- isp: N/A
-- latitude: 37.405991
-- longitude: -122.078514
-- domain: N/A
-- zipcode: 94043
-- timezone: -07:00
-- netspeed: N/A
-- iddcode: N/A
-- areacode: N/A
-- weatherstationcode: N/A
-- weatherstationname: N/A
-- mcc: N/A
-- mnc: N/A
-- mobilebrand: N/A
-- elevation: 0
-- usagetype: N/A
-- addresstype: N/A
-- category: N/A

author = "IP2Location"
license = "Same as Nmap--See https://nmap.org/book/man-legal.html"
categories = {"discovery","external","safe"}


hostrule = function(host)
--   if nmap.address_family() ~= "inet" then
--     stdnse.verbose1("Only IPV4 address is supported at the moment.")
     -- return false
--     return nil
--   end
  
  return true
end

local fetch_ip_info = function (ip)
  print (ip)
  local db_name = stdnse.get_script_args(SCRIPT_NAME .. ".ip2location_db")
  -- local db_path = "nselib/data/"..db_name
  local db_path = db_name
  local ip2loc = ip2location:new(db_path)
  local result = ip2loc:get_all(ip)
  return result
end

action = function(host,port)
  local result = fetch_ip_info(host.ip)
  print("country_short: " .. result.country_short)
  print("country_long: " .. result.country_long)
  print("region: " .. result.region)
  print("city: " .. result.city)
  -- Replace the message "This parameter is unavailable for selected data file. Please upgrade the data file." with "N/A"
  if ((result.isp) == "This parameter is unavailable for selected data file. Please upgrade the data file.") then 
    print("isp: N/A")
  else
    print("isp: " .. result.isp)
  end
  if ((result.latitude) == "This parameter is unavailable for selected data file. Please upgrade the data file.") then 
    print("latitude: N/A")
  else
    print("latitude: " .. result.latitude)
  end
  if ((result.longitude) == "This parameter is unavailable for selected data file. Please upgrade the data file.") then 
    print("longitude: N/A")
  else
    print("longitude: " .. result.longitude)
  end
  if ((result.domain) == "This parameter is unavailable for selected data file. Please upgrade the data file.") then 
    print("domain: N/A")
  else
    print("domain: " .. result.domain)
  end
  if ((result.zipcode) == "This parameter is unavailable for selected data file. Please upgrade the data file.") then 
    print("zipcode: N/A")
  else
    print("zipcode: " .. result.zipcode)
  end
  if ((result.timezone) == "This parameter is unavailable for selected data file. Please upgrade the data file.") then 
    print("timezone: N/A")
  else
    print("timezone: " .. result.timezone)
  end
  if ((result.netspeed) == "This parameter is unavailable for selected data file. Please upgrade the data file.") then 
    print("netspeed: N/A")
  else
    print("netspeed: " .. result.netspeed)
  end
  if ((result.iddcode) == "This parameter is unavailable for selected data file. Please upgrade the data file.") then 
    print("iddcode: N/A")
  else
    print("iddcode: " .. result.iddcode)
  end
  if ((result.areacode) == "This parameter is unavailable for selected data file. Please upgrade the data file.") then 
    print("areacode: N/A")
  else
    print("areacode: " .. result.areacode)
  end
  if ((result.weatherstationcode) == "This parameter is unavailable for selected data file. Please upgrade the data file.") then 
    print("weatherstationcode: N/A")
  else
    print("weatherstationcode: " .. result.weatherstationcode)
  end
  if ((result.weatherstationname) == "This parameter is unavailable for selected data file. Please upgrade the data file.") then 
    print("weatherstationname: N/A")
  else
    print("weatherstationname: " .. result.weatherstationname)
  end
  if ((result.mcc) == "This parameter is unavailable for selected data file. Please upgrade the data file.") then 
    print("mcc: N/A")
  else
    print("mcc: " .. result.mcc)
  end
  if ((result.mnc) == "This parameter is unavailable for selected data file. Please upgrade the data file.") then 
    print("mnc: N/A")
  else
    print("mnc: " .. result.mnc)
  end
  if ((result.mobilebrand) == "This parameter is unavailable for selected data file. Please upgrade the data file.") then 
    print("mobilebrand: N/A")
  else
    print("mobilebrand: " .. result.mobilebrand)
  end
  if ((result.elevation) == "This parameter is unavailable for selected data file. Please upgrade the data file.") then 
    print("elevation: N/A")
  else
    print("elevation: " .. result.elevation)
  end
  if ((result.usagetype) == "This parameter is unavailable for selected data file. Please upgrade the data file.") then 
    print("usagetype: N/A")
  else
    print("usagetype: " .. result.usagetype)
  end
  if ((result.addresstype) == "This parameter is unavailable for selected data file. Please upgrade the data file.") then 
    print("addresstype: N/A")
  else
    print("addresstype: " .. result.addresstype)
  end
  if ((result.category) == "This parameter is unavailable for selected data file. Please upgrade the data file.") then 
    print("category: N/A")
  else
    print("category: " .. result.category)
  end

end