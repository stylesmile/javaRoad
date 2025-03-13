### 修改时区
### 修改时区
```
tzselect
```
```
Please identify a location so that time zone rules can be set correctly.
Please select a continent, ocean, "coord", or "TZ".
 1) Africa
 2) Americas
 3) Antarctica
 4) Asia
 5) Atlantic Ocean
 6) Australia
 7) Europe
 8) Indian Ocean
 9) Pacific Ocean
10) coord - I want to use geographical coordinates.
11) TZ - I want to specify the timezone using the Posix TZ format.
#? 
```
选择 4  Asia
```
Please select a country whose clocks agree with yours.
 1) Afghanistan		     20) Iran			  39) Palestine
 2) Antarctica		     21) Iraq			  40) Philippines
 3) Armenia		     22) Israel			  41) Qatar
 4) Azerbaijan		     23) Japan			  42) Russia
 5) Bahrain		     24) Jordan			  43) Réunion
 6) Bangladesh		     25) Kazakhstan		  44) Saudi Arabia
 7) Bhutan		     26) Korea (North)		  45) Seychelles
 8) Brunei		     27) Korea (South)		  46) Singapore
 9) Cambodia		     28) Kuwait			  47) Sri Lanka
10) China		     29) Kyrgyzstan		  48) Syria
11) Christmas Island	     30) Laos			  49) Taiwan
12) Cocos (Keeling) Islands  31) Lebanon		  50) Tajikistan
13) Cyprus		     32) Macau			  51) Thailand
14) East Timor		     33) Malaysia		  52) Turkmenistan
15) French S. Terr.	     34) Mongolia		  53) United Arab Emirates
16) Georgia		     35) Myanmar (Burma)	  54) Uzbekistan
17) Hong Kong		     36) Nepal			  55) Vietnam
18) India		     37) Oman			  56) Yemen
19) Indonesia		     38) Pakistan
#? 

```
选择10 china
```angular2html
Please select one of the following timezones.
1) Beijing Time
2) Xinjiang Time
#? 
```
选择1 Beijing Time
```
Therefore TZ='Asia/Shanghai' will be used.
Selected time is now:	Thu Mar 13 15:47:24 CST 2025.
Universal Time is now:	Thu Mar 13 07:47:24 UTC 2025.
Is the above information OK?
1) Yes
2) No
#? yes

```
选择yes
```
Please enter a number in range.
#? 1
```
### 复制文件到/etc目录下
```
sudo cp /usr/share/zoneinfo/Asia/Shanghai  /etc/localtime
```
改时间
修改时间

sudo date -s MM/DD/YY //修改日期
sudo date -s hh:mm:ss //修改时间
在修改时间以后，修改硬件CMOS的时间

sudo hwclock --systohc //非常重要，如果没有这一步的话，后面时间还是不准