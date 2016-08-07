Return-Path: naveen@mail.lastninja.net
Received: from mail.lastninja.net (wbml.net [66.117.1.122])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e552d54b
 for <wireguard@lists.zx2c4.com>; Sun, 7 Aug 2016 01:05:13 +0000 (UTC)
From: Naveen Nathan <naveen@lastninja.net>
To: wireguard@lists.zx2c4.com
Date: Sat,  6 Aug 2016 18:08:59 -0700
Message-Id: <1470532139-68512-1-git-send-email-naveen@lastninja.net>
Cc: Naveen Nathan <naveen@lastninja.net>
Subject: [WireGuard] [PATCH] tests: add tests for NAT
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

---
 src/tests/netns.sh           |   73 +++++++++++++++++++++++++++++++++++-------
 src/tests/qemu/Makefile      |   16 ++++++++-
 src/tests/qemu/kernel.config |   14 ++++++++
 3 files changed, 90 insertions(+), 13 deletions(-)

diff --git a/src/tests/netns.sh b/src/tests/netns.sh
index 1eb37f3..1158d35 100755
--- a/src/tests/netns.sh
+++ b/src/tests/netns.sh
@@ -59,17 +59,35 @@ ip netns add $netns0
 ip netns add $netns1
 ip netns add $netns2
 
+ip0 link add vethrc type veth peer name vethc
+ip0 link add vethrs type veth peer name veths
+ip0 link set vethc netns $netns1
+ip0 link set veths netns $netns2
+ip0 link set vethrc up
+ip0 link set vethrs up
+
 ip0 link set up dev lo
+ip0 addr add 192.168.1.1/24 dev vethrc
+ip0 addr add 10.0.0.1/24 dev vethrs
+n0 bash -c 'echo 1 > /proc/sys/net/ipv4/ip_forward'
+n0 iptables -t nat -A POSTROUTING -s 192.168.1.0/24 -d 10.0.0.0/24 -j SNAT --to 10.0.0.1
 ip0 link add dev wg0 type wireguard
 ip0 link set wg0 netns $netns1
 ip0 link add dev wg0 type wireguard
 ip0 link set wg0 netns $netns2
 
+ip1 addr add 192.168.1.100/24 dev vethc
+ip1 link set vethc up
+ip1 route add default via 192.168.1.1
 ip1 addr add 192.168.241.1/24 dev wg0
 ip1 addr add abcd::1/24 dev wg0
+
+ip2 addr add 10.0.0.100/24 dev veths
+ip2 link set veths up
 ip2 addr add 192.168.241.2/24 dev wg0
 ip2 addr add abcd::2/24 dev wg0
 
+
 key1="$(wg genkey)"
 key2="$(wg genkey)"
 pub1="$(wg pubkey <<<"$key1")"
@@ -77,18 +95,21 @@ pub2="$(wg pubkey <<<"$key2")"
 psk="$(wg genpsk)"
 [[ -n $key1 && -n $key2 && -n $psk ]]
 
-n1 wg set wg0 \
-	private-key <(echo "$key1") \
-	preshared-key <(echo "$psk") \
-	listen-port 1 \
-	peer "$pub2" \
-		allowed-ips 192.168.241.2/32,abcd::2/128
-n2 wg set wg0 \
-	private-key <(echo "$key2") \
-	preshared-key <(echo "$psk") \
-	listen-port 2 \
-	peer "$pub1" \
-		allowed-ips 192.168.241.1/32,abcd::1/128
+configure_peers() {
+	n1 wg set wg0 \
+		private-key <(echo "$key1") \
+		preshared-key <(echo "$psk") \
+		listen-port 1 \
+		peer "$pub2" \
+			allowed-ips 192.168.241.2/32,abcd::2/128
+	n2 wg set wg0 \
+		private-key <(echo "$key2") \
+		preshared-key <(echo "$psk") \
+		listen-port 2 \
+		peer "$pub1" \
+			allowed-ips 192.168.241.1/32,abcd::1/128
+}
+configure_peers
 
 ip1 link set up dev wg0
 ip2 link set up dev wg0
@@ -158,3 +179,31 @@ n1 ping -c 1 192.168.241.2
 [[ $(n2 wg show wg0 endpoints) == "$pub1	[::1]:9998" ]]
 n1 wg
 n2 wg
+
+# Test using NAT
+ip1 link del dev wg0
+ip1 link add dev wg0 type wireguard
+ip1 addr add 192.168.241.1/24 dev wg0
+ip1 addr add abcd::1/24 dev wg0
+ip1 link set wg0 up
+
+ip2 link del dev wg0
+ip2 link add dev wg0 type wireguard
+ip2 addr add 192.168.241.2/24 dev wg0
+ip2 addr add abcd::2/24 dev wg0
+ip2 link set wg0 up
+
+n0 bash -c 'echo 15 > /proc/sys/net/netfilter/nf_conntrack_udp_timeout'
+n0 bash -c 'echo 15 > /proc/sys/net/netfilter/nf_conntrack_udp_timeout_stream'
+configure_peers
+n1 wg set wg0 peer "$pub2" endpoint 10.0.0.100:2 persistent-keepalive 10
+n1 ping -f -W 1 -c 10 192.168.241.2
+n2 ping -f -W 1 -c 10 192.168.241.1
+n1 wg show wg0 endpoints
+n2 wg show wg0 endpoints
+[[ $(n2 wg show wg0 endpoints) == "$pub1	10.0.0.1:1" ]]
+# demonstrate n2 can still send packets to n1 since
+# persistent-keepalive will prevent connection tracking
+# entry from expiring (to see entries: `n0 conntrack -L`)
+sleep 35
+n2 ping -f -W 1 -c 10 192.168.241.1
diff --git a/src/tests/qemu/Makefile b/src/tests/qemu/Makefile
index d224fe3..c2ba704 100644
--- a/src/tests/qemu/Makefile
+++ b/src/tests/qemu/Makefile
@@ -41,6 +41,8 @@ $(eval $(call tar_download,LIBMNL,libmnl,1.0.4,.tar.bz2,http://ftp.netfilter.org
 $(eval $(call tar_download,IPERF,iperf,3.1.3,.tar.gz,http://downloads.es.net/pub/iperf/))
 $(eval $(call tar_download,BASH,bash,30a978b7d808c067219c95be88c4979b6a7aa251,.tar.gz,http://git.savannah.gnu.org/cgit/bash.git/snapshot/))
 $(eval $(call tar_download,IPROUTE2,iproute2,4.3.0,.tar.gz,http://www.kernel.org/pub/linux/utils/net/iproute2/))
+$(eval $(call tar_download,IPTABLES,iptables,1.6.0,.tar.bz2,http://ftp.netfilter.org/pub/iptables/))
+
 IPUTILS_VERSION := s20160308
 IPUTILS_TAR := $(DISTFILES_PATH)/$(IPUTILS_VERSION).tar.gz
 IPUTILS_PATH := $(BUILD_PATH)/iputils-$(IPUTILS_VERSION)
@@ -85,6 +87,8 @@ $(BUILD_PATH)/init-cpio-spec.txt:
 	echo "file /bin/ip $(IPROUTE2_PATH)/ip/ip 755 0 0" >> $@
 	echo "file /bin/ss $(IPROUTE2_PATH)/misc/ss 755 0 0" >> $@
 	echo "file /bin/ping $(IPUTILS_PATH)/ping 755 0 0" >> $@
+	echo "file /bin/xtables-multi $(IPTABLES_PATH)/iptables/xtables-multi 755 0 0" >> $@
+	echo "slink /bin/iptables xtables-multi 777 0 0" >> $@
 	echo "slink /bin/ping6 ping 777 0 0" >> $@
 	echo "dir /lib 755 0 0" >> $@
 	echo "file /lib/libc.so $(MUSL_PATH)/lib/libc.so 755 0 0" >> $@
@@ -104,7 +108,7 @@ $(KERNEL_PATH)/.config: kernel.config | $(KERNEL_PATH)
 	cd $(KERNEL_PATH) && scripts/kconfig/merge_config.sh -n .config minimal.config
 	-[ "$(DEBUG_KERNEL)" = "yes" ] && ( cd $(KERNEL_PATH) && scripts/kconfig/merge_config.sh -n .config $(PWD)/debug.config )
 
-$(KERNEL_BZIMAGE): $(KERNEL_PATH) $(KERNEL_PATH)/.config $(BUILD_PATH)/init-cpio-spec.txt $(MUSL_PATH)/lib/libc.so $(IPERF_PATH)/src/iperf3 $(BUILD_PATH)/tools/wg $(IPUTILS_PATH)/ping $(BASH_PATH)/bash $(IPROUTE2_PATH)/ip/ip $(BUILD_PATH)/init ../netns.sh $(WIREGUARD_SOURCES) $(TOOLS_SOURCES)
+$(KERNEL_BZIMAGE): $(KERNEL_PATH) $(KERNEL_PATH)/.config $(BUILD_PATH)/init-cpio-spec.txt $(MUSL_PATH)/lib/libc.so $(IPERF_PATH)/src/iperf3 $(BUILD_PATH)/tools/wg $(IPUTILS_PATH)/ping $(BASH_PATH)/bash $(IPROUTE2_PATH)/ip/ip $(IPTABLES_PATH)/iptables/xtables-multi $(BUILD_PATH)/init ../netns.sh $(WIREGUARD_SOURCES) $(TOOLS_SOURCES)
 	$(MAKE) -C $(KERNEL_PATH)
 
 $(BUILD_PATH)/include/linux: | $(KERNEL_PATH)
@@ -176,6 +180,16 @@ $(IPROUTE2_PATH)/ip/ip: $(IPROUTE2_PATH) $(MUSL_CC) | $(BUILD_PATH)/include/linu
 	CFLAGS="$(CFLAGS)" $(MAKE) -C $(IPROUTE2_PATH) PREFIX=/ CC="$(MUSL_CC)"
 	strip -s $(IPROUTE2_PATH)/ip/ip $(IPROUTE2_PATH)/misc/ss
 
+$(IPTABLES_PATH): $(IPTABLES_TAR)
+	tar -C $(BUILD_PATH) -xf $<
+
+$(IPTABLES_PATH)/iptables/xtables-multi: $(IPTABLES_PATH) $(MUSL_CC) | $(KERNEL_PATH)
+	# iptables 1.6.0 has a bug acquiring a lockfile which appears to be patched in future versions
+	# for now, just hack around this.
+	sed -i 's/if (!restore && !xtables_lock(wait)) {/if (0) {/' $(IPTABLES_PATH)/iptables/iptables.c
+	cd $(IPTABLES_PATH) && CC="$(MUSL_CC)" CFLAGS="$(CFLAGS)" ./configure --prefix=/ --host=$(CHOST) --enable-static --disable-shared --disable-nftables --with-kernel=$(KERNEL_PATH)
+	$(MAKE) -C $(IPTABLES_PATH)
+
 clean:
 	rm -rf $(BUILD_PATH)
 
diff --git a/src/tests/qemu/kernel.config b/src/tests/qemu/kernel.config
index 519257c..04c6409 100644
--- a/src/tests/qemu/kernel.config
+++ b/src/tests/qemu/kernel.config
@@ -1,11 +1,25 @@
 CONFIG_NET=y
 CONFIG_NETDEVICES=y
+CONFIG_NET_CORE=y
+CONFIG_VETH=y
 CONFIG_MULTIUSER=y
 CONFIG_NAMESPACES=y
 CONFIG_NET_NS=y
 CONFIG_UNIX=y
 CONFIG_INET=y
 CONFIG_IPV6=y
+CONFIG_NETFILTER=y
+CONFIG_NETFILTER_ADVANCED=y
+CONFIG_NF_CONNTRACK=y
+CONFIG_NF_NAT=y
+CONFIG_NF_NAT_NEEDED=y
+CONFIG_NETFILTER_XTABLES=y
+CONFIG_NETFILTER_XT_NAT=y
+CONFIG_NF_DEFRAG_IPV4=y
+CONFIG_NF_CONNTRACK_IPV4=y
+CONFIG_NF_NAT_IPV4=y
+CONFIG_IP_NF_IPTABLES=y
+CONFIG_IP_NF_NAT=y
 CONFIG_TTY=y
 CONFIG_BINFMT_ELF=y
 CONFIG_BINFMT_SCRIPT=y
-- 
1.7.6
