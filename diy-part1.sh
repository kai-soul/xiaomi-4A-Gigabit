#!/bin/bash
#!/bin/bash


### 修改为R4A千兆版Breed直刷版
## 1.修改 mt7621_xiaomi_mir3g-v2.dts
export shanchu1=$(grep  -a -n -e '&spi0 {' target/linux/ramips/dts/mt7621_xiaomi_mi-router-4a-3g-v2.dtsi|cut -d ":" -f 1)
export shanchu2=$(grep  -a -n -e '&pcie {' target/linux/ramips/dts/mt7621_xiaomi_mi-router-4a-3g-v2.dtsi|cut -d ":" -f 1)
export shanchu2=$(expr $shanchu2 - 1)
export shanchu2=$(echo $shanchu2"d")
sed -i $shanchu1,$shanchu2 target/linux/ramips/dts/mt7621_xiaomi_mi-router-4a-3g-v2.dtsi
# 在20221001分支里有bug，master正常
# grep  -Pzo '&spi0[\s\S]*};[\s]*};[\s]*};[\s]*};' target/linux/ramips/dts/mt7621_youhua_wr1200js.dts > youhua.txt
# echo "" >> youhua.txt
# echo "" >> youhua.txt
export jiequ1=$(grep  -a -n -e '&spi0 {' target/linux/ramips/dts/mt7621_youhua_wr1200js.dts|cut -d ":" -f 1)
export jiequ2=$(grep  -a -n -e '&pcie {' target/linux/ramips/dts/mt7621_youhua_wr1200js.dts|cut -d ":" -f 1)
export jiequ2=$(expr $jiequ2 - 1)
export jiequ2=$(echo $jiequ2"p")
sed -n $jiequ1,$jiequ2 target/linux/ramips/dts/mt7621_youhua_wr1200js.dts >> youhua.txt
export shanchu1=$(expr $shanchu1 - 1)
export shanchu1=$(echo $shanchu1"r")
sed -i "$shanchu1 youhua.txt" target/linux/ramips/dts/mt7621_xiaomi_mi-router-4a-3g-v2.dtsi
rm -rf youhua.txt
## 2.修改mt7621.mk
export imsize1=$(grep  -a -n -e 'define Device/xiaomi_mir3g-v2' target/linux/ramips/image/mt7621.mk|cut -d ":" -f 1)
export imsize1=$(expr $imsize1 + 2)
export imsize1=$(echo $imsize1"s")
sed -i "$imsize1/IMAGE_SIZE := .*/IMAGE_SIZE := 16064k/" target/linux/ramips/image/mt7621.mk
