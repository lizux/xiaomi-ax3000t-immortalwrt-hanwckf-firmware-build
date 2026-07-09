# Description: (Before Update feeds)


# Uncomment a feed source
# sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
#echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default
#echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default

# echo "src-git kenzo https://github.com/kenzok8/openwrt-packages" >> ./feeds.conf.default   
# echo "src-git small https://github.com/kenzok8/small" >> ./feeds.conf.default

# 添加 Passwall 依赖源和主源
echo 'src-git passwall_packages https://github.com/Openwrt-Passwall/openwrt-passwall-packages' >> feeds.conf.default
echo 'src-git passwall_apps https://github.com/Openwrt-Passwall/openwrt-passwall' >> feeds.conf.default
