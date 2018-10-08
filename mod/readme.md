# Hakchi Speed Booster

This module will give you mad gains bro.

But seriously. A complete write up and warnings and explinations of setting the clock and voltage of the SoC will be posted here.

And the fact that we are not responsible for any damage etc etc.

This is strictly RC and intended for internal use only (and testers)

THIS WILL ONLY WORK FOR NEWER BUILDS OF HAKCHI CE. RECOMMENDED HAKCHI CE 3.4.1 or newer.

### How to use

1. Install the Hakchi Speed Booster via Hakchi CE.
3. On first boot after install it will set up the speed boost (1 time only) and it will display the progress to the TV.
4. Once complete it will reboot and then enable. At this point you are good to go!

### Some useful debug commands

You can run these commands via telnet/ssh to get debug information:

```
#cat /sys/devices/platform/axp22_board/axp22-regulator.2/regulator/regulator.3/microvolts #Displays current SoC voltage (Should be 1500 (1.5v))
#cat /sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_cur_freq #Displays current SoC clock speed (Should be 1.344ghz)
#cat /sys/devices/virtual/thermal/thermal_zone0/temp #Displays SoC core temperature (Safe limit = 90c / Critical = 110c)
```

You can get further support at the support channel at the discord here: [Hakchi Resources Discord](https://discord.gg/8gygsrw)
