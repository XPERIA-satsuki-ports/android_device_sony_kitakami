#include <stdlib.h>

// The devices to init for Xperia Z5
const char *mr_init_devices[] = {
    "/sys/class/graphics/fb0",

    "/sys/block/mmcblk0",
    "/sys/block/mmcblk0rpmb",
    "/sys/block/mmcblk1",
    "/sys/devices/soc.0/f9824900.sdhci",
    "/sys/devices/soc.0/f98a4900.sdhci",
    "/sys/devices/soc.0/f98a4900.sdhci/mmc_host/mmc*"
    "/sys/devices/soc.0/f98a4900.sdhci/mmc_host/mmc*"
    "/sys/devices/soc.0/f9824900.sdhci/mmc_host/mmc0",
    "/sys/devices/soc.0/f98a4900.sdhci/mmc_host/mmc1",
    "/sys/devices/soc.0/f9824900.sdhci/mmc_host/mmc0/mmc0:0001",
    "/sys/devices/soc.0/f98a4900.sdhci/mmc_host/mmc1/mmc0:*",
    "/sys/devices/soc.0/f98a4900.sdhci/mmc_host/mmc1/mmc0:e624",
    "/sys/devices/soc.0/f9824900.sdhci/mmc_host/mmc0/mmc0:0001/block/mmcblk0",
    "/sys/devices/soc.0/f98a4900.sdhci/mmc_host/mmc1/mmc0:e624/block/mmcblk1",
    "/sys/devices/soc.0/f9824900.sdhci/mmc_host/mmc0/mmc0:0001/block/mmcblk0/*",
    "/sys/devices/soc.0/f98a4900.sdhci/mmc_host/mmc1/mmc0:e624/block/mmcblk1/*",
    "/dev/block/bootdevice/by-name/*",
    "/sys/devices/soc.0/f9824900.sdhci/mmc_host/mmc0/mmc0:0001/block/mmcblk0/mmcblk0p29", // boot
    "/sys/devices/soc.0/f9824900.sdhci/mmc_host/mmc0/mmc0:0001/block/mmcblk0/mmcblk0p41", // cache
    "/sys/devices/soc.0/f9824900.sdhci/mmc_host/mmc0/mmc0:0001/block/mmcblk0/mmcblk0p3", // modem
    "/sys/devices/soc.0/f9824900.sdhci/mmc_host/mmc0/mmc0:0001/block/mmcblk0/mmcblk0p31", // persist
    "/sys/devices/soc.0/f9824900.sdhci/mmc_host/mmc0/mmc0:0001/block/mmcblk0/mmcblk0p43", // system
    "/sys/devices/soc.0/f9824900.sdhci/mmc_host/mmc0/mmc0:0001/block/mmcblk0/mmcblk0p42", // userdata
    "/sys/devices/soc.0/f9824900.sdhci/mmc_host/mmc0/mmc0:0001/block/mmcblk0/mmcblk0p14", // ssd
    "/sys/devices/soc.0/f9824900.sdhci/mmc_host/mmc0/mmc0:0001/block/mmcblk0/mmcblk0rpmb", // RPMB
    "/sys/devices/soc.0/f98a4900.sdhci/mmc_host/mmc1/mmc0:e624/block/mmcblk1/mmcblk1p1", // SD Card
    "/sys/bus/mmc",
    "/sys/bus/mmc/drivers/mmcblk",
    "/sys/module/mmc_core",
    "/sys/module/mmcblk",
    "/sys/bus*",
    "/sys/devices*",

    // for keys and touchscreen
    "/sys/devices/soc.0/gpio_keys.79/input*",
    "/sys/devices/virtual/input*",
    "/sys/devices/virtual/misc/uinput",
    "/sys/devices/soc.0/f9924000.i2c/i2c-2/2-0070/input*",

    // for adb
    "/sys/devices/virtual/tty/ptmx",
    "/sys/devices/virtual/misc/android_adb",
    "/sys/devices/virtual/android_usb/android0/f_adb",
    "/sys/bus/usb",
    "/sys/bus/usb-serial",
    "/sys/devices/virtual/misc/mtp_usb",
    "/sys/devices/platform/android_usb/usb_function_switch",
    
    // USB
    "/sys/devices/soc.0/f9200000.ssusb/f9200000.dwc3/xhci-hcd.*",

    // Encryption
    "/sys/devices/virtual/misc/device-mapper",
    "/sys/devices/virtual/misc/ion",
    "/sys/devices/virtual/qseecom/qseecom",

    // Logging
    "/sys/devices/virtual/pmsg/pmsg0",

    NULL
};
