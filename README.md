# SpeedLimiter

SpeedLimiter is a FiveM script that allows you to setup a maximum speed for all the vehicles!
It avoids you having to modify the handling file of each vehicle and prevents from having cars going 500 kmh on the map which was not designed for that.

## Config
Set **Config.kmh** to true if you want to use km/h or false if you want to use mph.

In order to limit the speed by each vehicle category, set **Config.useCategories** to true.
After that go on each category and set the max speed to whatever limit you want to set

If you rather use a max speed for all the categories just set **Config.useCategories** to false and set **Config.maxSpeed** to whatever limit you want to set.

Do not modify the max speed on **Categories 15 and 16** otherwise you won't be able to fly the helis and the planes. 

## How does it work?
The script check when you are in a vehicle, if the vehicle is faster than the limit you set it will set that vehicle max speed to the limit you set on the config
