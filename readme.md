# BMP085

Mit dem [BMP085](http://www.adafruit.com/datasheets/BMP085_DataSheet_Rev.1.0_01July2008.pdf "Bosch BMP085") kann der Luftdruck im Bereich von 300 bis 1100 hPa und die Temperatur von -40 bis +85 Grad ermittelt werden. Zusätlich wird in diesem Projekt die Höhenlage in Bezug zum Meeresspiegel mittels Luftdruck ermittelt.

# Hardware

Der Sensor BMP085 wird wie folgt mit dem Raspberry Pi verdrahtet:

```
UCC -> 3,3V (PIN 1)
SDA -> SDA (PIN 3 I2C)
SCL -> SCL (PIN 5 I2C)
GND -> GND
```

# Installation

Als erstes muss das I2C-Interface aktiviert werden, falls dies nocht nicht geschehen ist.
Dazu muss mittels folgendem Befehl die raspi-blacklist.conf editiert werden.
```
sudo vi /etc/modprobe.d/raspi-blacklist.conf
```
Dazu muss folgende Zeile gelöscht oder auskommentiert (#) werden.
```
blacklist i2c-bcm2708
```
Mittels folgender Befehle können die I2C-Module von hand geladen werden.
```
sudo modprobe i2c-bcm2708
sudo modprobe i2c-dev
```
Damit dies nicht immer von Hand gemacht werden muss, kann man dies auch automatisieren.
```
sudo vi /etc/modules
```
Folgende Zeilen müssen in die modules am Ende eingetragen werden.
```
i2c_bcm2708
i2c-dev
```

Als erstes müssen die I2C-Tools installiert werden.
```
sudo apt-get install i2c-tools
```

Mittels folgendesm Befehl kann somit die Adresse des Sonsor herausgefunden werden. In diesem Fall wäre es die 0x77
```
sudo i2cdetect -y 1
     0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
00:          -- -- -- -- -- -- -- -- -- -- -- -- --
10: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
20: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
30: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
40: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
50: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
60: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
70: -- -- -- -- -- -- -- 77
```


Clone das git und nicht zu vergessen ist die smbus.h zu includieren.

```
https://github.com/Karllebolla/Temperaturmessung.git
```

Den C-Code habe ich von folgender Seite erstanden.
```
http://www.raspberrypi.org/forums/viewtopic.php?t=16968&p=177210
``` 

Beim Compilieren muss darauf geachtet werden, das die smbus.c Datei dazu gelinkt wird.
```
gcc -Wall -o temperaturmessung ./smbus.c ./temperaturmessung.c
```

Have fun!
