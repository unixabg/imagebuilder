# this file is supposed to be sourced by the get-files shell script

chromebook_nyan_release_version="6.1.51-stb-cbt%2B"
chromebook_nyan_kernel_tree="linux-mainline-and-mali-generic-stable-kernel"
chromebook_nyan_2g_uboot_version="v2021.10-cbt"
chromebook_nyan_2g_noflicker_uboot_version="v2021.10-cbt"
chromebook_nyan_4g_uboot_version="v2021.10-cbt"
chromebook_nyan_4g_noflicker_uboot_version="v2021.10-cbt"
# stick to this older mesa version for nyan as with newer ones there
# were regressions which have to be checked and resolved first
mesa_release_version="21.0.3"
xserver_release_version="21.0.1"

rm -rf ${DOWNLOAD_DIR}/boot-extra-${1}
mkdir -p ${DOWNLOAD_DIR}/boot-extra-${1}
# get different u-boot versions for different nyan chromebook versions
wget -v https://github.com/hexdump0815/u-boot-chainloading-for-arm-chromebooks/releases/download/${chromebook_nyan_2g_uboot_version}/uboot.kpart.cbt-2g.gz -O - | gunzip -c > ${DOWNLOAD_DIR}/boot-extra-${1}/uboot.kpart.cbt-2g
wget -v https://github.com/hexdump0815/u-boot-chainloading-for-arm-chromebooks/releases/download/${chromebook_nyan_2g_noflicker_uboot_version}/uboot.kpart.cbt-2g-noflicker.gz -O - | gunzip -c > ${DOWNLOAD_DIR}/boot-extra-${1}/uboot.kpart.cbt-2g-noflicker
wget -v https://github.com/hexdump0815/u-boot-chainloading-for-arm-chromebooks/releases/download/${chromebook_nyan_4g_uboot_version}/uboot.kpart.cbt-4g.gz -O - | gunzip -c > ${DOWNLOAD_DIR}/boot-extra-${1}/uboot.kpart.cbt-4g
wget -v https://github.com/hexdump0815/u-boot-chainloading-for-arm-chromebooks/releases/download/${chromebook_nyan_4g_noflicker_uboot_version}/uboot.kpart.cbt-4g-noflicker.gz -O - | gunzip -c > ${DOWNLOAD_DIR}/boot-extra-${1}/uboot.kpart.cbt-4g-noflicker
# copy the 4gb nyan u-boot to the right place, so that it will be written to the kernel partition
cp ${DOWNLOAD_DIR}/boot-extra-${1}/uboot.kpart.cbt-4g ${DOWNLOAD_DIR}/boot-chromebook_nyan-armv7l.dd

# get the mainline kernel
rm -f ${DOWNLOAD_DIR}/kernel-chromebook_nyan-armv7l.tar.gz
wget -v https://github.com/hexdump0815/${chromebook_nyan_kernel_tree}/releases/download/${chromebook_nyan_release_version}/${chromebook_nyan_release_version}.tar.gz -O ${DOWNLOAD_DIR}/kernel-chromebook_nyan-armv7l.tar.gz

## on tegra a special xorg is required as well
#rm -f ${DOWNLOAD_DIR}/opt-xserver-${3}-${2}.tar.gz
#wget https://github.com/hexdump0815/mesa-etc-build/releases/download/${xserver_release_version}/opt-xserver-${3}-${2}.tar.gz -O ${DOWNLOAD_DIR}/opt-xserver-${3}-${2}.tar.gz
