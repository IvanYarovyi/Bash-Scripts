# Raspberry pi tips
### R-Pi configuration file location
sudo nano /boot/config.txt

### How to make stress-test on Raspberry Pi
sysbench --test=cpu --cpu-max-prime=5000 run

dmesg | grep cpufreq

### Configuration
raspi-config

### get CPU info
/opt/vc/bin/vcgencmd measure_temp
