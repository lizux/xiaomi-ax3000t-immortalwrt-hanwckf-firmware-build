#!/bin/sh
# Description: (After Update feeds)

# Modify default IP
sed -i 's/192.168.1.1/192.168.31.1/g' package/base-files/files/bin/config_generate

# Set DHCP IP Address start and end
sed -i "s/option start.*/option start \'100\'/g" package/network/services/dnsmasq/files/dhcp.conf
sed -i "s/option limit.*/option limit \'100\'/g" package/network/services/dnsmasq/files/dhcp.conf

# ==========================================
# 移除 AN8855 (带 AN8855 交换机芯片的 AX3000T) 设备定义
# 从源头阻止编译和打包 an8855 版本固件
# ==========================================
MT7981_MK="target/linux/mediatek/image/mt7981.mk"

if [ -f "$MT7981_MK" ]; then
    echo "正在从 $MT7981_MK 中移除 an8855 设备定义..."
    # 匹配并删除包含 xiaomi_mi-router-ax3000t-an8855 的定义块
    sed -i '/TARGET_DEVICES += xiaomi_mi-router-ax3000t-an8855/,/^$/d' "$MT7981_MK"
    sed -i '/define Device\/xiaomi_mi-router-ax3000t-an8855/,/endef/d' "$MT7981_MK"
else
    echo "警告: 未找到 mt7981.mk 文件，尝试检索其他可能的文件..."
    # 备用：如果是新版源码可能在 filogic.mk 
    FILOGIC_MK="target/linux/mediatek/image/filogic.mk"
    if [ -f "$FILOGIC_MK" ]; then
        sed -i '/TARGET_DEVICES += xiaomi_mi-router-ax3000t-an8855/,/^$/d' "$FILOGIC_MK"
        sed -i '/define Device\/xiaomi_mi-router-ax3000t-an8855/,/endef/d' "$FILOGIC_MK"
    fi
fi
