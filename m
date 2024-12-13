Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75CBBC54E90
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 21 May 2025 09:18:02 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d805f9d8;
	Tue, 20 May 2025 19:35:36 +0000 (UTC)
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [2607:f8b0:4864:20::42e])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id f4f48f4b
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 13 Dec 2024 03:08:47 +0000 (UTC)
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-725ee27e905so1662759b3a.2
 for <wireguard@lists.zx2c4.com>; Thu, 12 Dec 2024 19:08:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1734059326; x=1734664126; darn=lists.zx2c4.com;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=luedh3E5fjeOowLern4iwDWN0UhJnMCsLuFyaHGaQ2s=;
 b=DEqn6Rz5qMkqNWStzlQQAeixeXWTGR7M3Dmg5epZZGdHbd3zxgBok5059qGtWCAi/Z
 wG95YMJeXg3RzSBciPX/TztzO5uRE4ZzEg9pDPX29s1Y7VdPRaxgz/nIFxi5tohckwo+
 YI619Gaf7cmT+4t1wJIFB4L2EnbstsQ2dJG6QEYSRJxbARXSl7K54pjO24R39SssJyo2
 A7A6fne0TjLoaqcl2uLkf5Of9BRgWEd/XCKJQlei/zQU1jIPHpFLaXI3cO2DzTwXgpUW
 Qgv7ygrFzJ6/8/oPzTO5GQh+os+ISydagYpOqe7dDcw93ogMD3QRCX43I022vpBiVtVN
 DsOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734059326; x=1734664126;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=luedh3E5fjeOowLern4iwDWN0UhJnMCsLuFyaHGaQ2s=;
 b=OsdthmzxhbxAZFgFSqLXrfyqQyhCgpGJF0DRIfDBlTLTHoHc7saiJ+oXcjDlbPXC3o
 nEUqjh9k7SrOt39YFHL1LOBG+WvYHUmx5tcgQK3e/4gKAsCXeriMy8xS2T2t+d23P5Xq
 qHeDbkaXahNj6w1IcDg4Qh0GyUuFZyz5oy3Dg4pfl0cB0JZCDvS4p2m2ut/aVoxFppJe
 iXcEXt2Q3SHN8Kf94OlSRLWsgbP/PuxSHiAuFewdaXAiC6c9Gak/hTBVRn9fWTdV6RLD
 Azs/j/vOo9zCiJ0JH+hnIEFLxIn6iZKLW0QtYDwuIMCOZ/TbHLFmyQoEufvuBK+pVQxY
 hj8A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUvVOecbaFWgbhu5UYe0jD0efCjicpN8xq1Y2rwTqiuRlLTMmeLjsDWNN/YgJupFhlkm4Zh3v1Yv8o=@lists.zx2c4.com
X-Gm-Message-State: AOJu0Yy/5hdULdxAUsRs5Djmn0olSuCEOFfq4VPlEelIk2PCbxt7BJ3n
 yknDUoQ11E9+JCtYj01Sri7BuuRliMa1hh+oTL65LJg+dtl7yh5c
X-Gm-Gg: ASbGncu8DZ2jsm4qy/e7x5g7xRso/gbRhePaQIWSvMTYPsUCwPPyek3k8xuPznWqP/v
 Erw4pm1JQzmWFHLs9rV+83POdtAVHMWOpjC1mwJElli/ygY5IT4VJ0DRM+wgOnWS8Bl9P1oTi5q
 jwkF9m6b7Dbq/3SC0X/XJpFWfOrfzucAFstnQyolT3kcuzdaCZjNqY9xe9Qm28yQnJOFkEh/F56
 Rc15cQvPamK7Zg2I1TiuKVai0x1C5GJJbZ37Qg4+zSC3g2rGnxXTLZ5OVQVrEe5wUqtwHfFBkmD
X-Google-Smtp-Source: AGHT+IGYK9E6V1ljVwWs41gWcPcHM9MzFn4nVnvgoAVy8bYSHXluPqnbuqIAPcABaWu+rX3CxbRjAA==
X-Received: by 2002:a05:6a00:2995:b0:725:eacf:cfda with SMTP id
 d2e1a72fcca58-7290c25ae78mr1402221b3a.17.1734059326079; 
 Thu, 12 Dec 2024 19:08:46 -0800 (PST)
Received: from fedora.dns.podman ([43.228.180.230])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-725e4b13545sm9152783b3a.126.2024.12.12.19.08.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Dec 2024 19:08:45 -0800 (PST)
From: Hangbin Liu <liuhangbin@gmail.com>
To: netdev@vger.kernel.org
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, Jakub Kicinski <kuba@kernel.org>,
 Shuah Khan <shuah@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Simon Horman <horms@kernel.org>, Phil Sutter <phil@nwl.cc>,
 Florian Westphal <fw@strlen.de>, Petr Mladek <pmladek@suse.com>,
 Yoann Congal <yoann.congal@smile.fr>, wireguard@lists.zx2c4.com,
 bpf@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, Hangbin Liu <liuhangbin@gmail.com>
Subject: [PATCHv3 net-next 2/2] selftests: wireguard: update to using nft for
 qemu test
Date: Fri, 13 Dec 2024 03:08:19 +0000
Message-ID: <20241213030819.49987-3-liuhangbin@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20241213030819.49987-1-liuhangbin@gmail.com>
References: <20241213030819.49987-1-liuhangbin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.30rc1
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Since we will replace iptables with nft for wireguard netns testing,
let's also convert the qemu test to use nft at the same time.

Co-developed-by: Phil Sutter <phil@nwl.cc>
Signed-off-by: Phil Sutter <phil@nwl.cc>
Signed-off-by: Hangbin Liu <liuhangbin@gmail.com>
---
 .../testing/selftests/wireguard/qemu/Makefile | 40 ++++++++++++++-----
 .../selftests/wireguard/qemu/kernel.config    |  7 ++--
 2 files changed, 34 insertions(+), 13 deletions(-)

diff --git a/tools/testing/selftests/wireguard/qemu/Makefile b/tools/testing/selftests/wireguard/qemu/Makefile
index 35856b11c143..10e79449fefa 100644
--- a/tools/testing/selftests/wireguard/qemu/Makefile
+++ b/tools/testing/selftests/wireguard/qemu/Makefile
@@ -40,7 +40,9 @@ endef
 $(eval $(call tar_download,IPERF,iperf,3.11,.tar.gz,https://downloads.es.net/pub/iperf/,de8cb409fad61a0574f4cb07eb19ce1159707403ac2dc01b5d175e91240b7e5f))
 $(eval $(call tar_download,BASH,bash,5.1.16,.tar.gz,https://ftp.gnu.org/gnu/bash/,5bac17218d3911834520dad13cd1f85ab944e1c09ae1aba55906be1f8192f558))
 $(eval $(call tar_download,IPROUTE2,iproute2,5.17.0,.tar.gz,https://www.kernel.org/pub/linux/utils/net/iproute2/,bda331d5c4606138892f23a565d78fca18919b4d508a0b7ca8391c2da2db68b9))
-$(eval $(call tar_download,IPTABLES,iptables,1.8.7,.tar.bz2,https://www.netfilter.org/projects/iptables/files/,c109c96bb04998cd44156622d36f8e04b140701ec60531a10668cfdff5e8d8f0))
+$(eval $(call tar_download,LIBMNL,libmnl,1.0.5,.tar.bz2,https://www.netfilter.org/projects/libmnl/files/,274b9b919ef3152bfb3da3a13c950dd60d6e2bcd54230ffeca298d03b40d0525))
+$(eval $(call tar_download,LIBNFTNL,libnftnl,1.2.8,.tar.xz,https://www.netfilter.org/projects/libnftnl/files/,37fea5d6b5c9b08de7920d298de3cdc942e7ae64b1a3e8b880b2d390ae67ad95))
+$(eval $(call tar_download,NFTABLES,nftables,1.1.1,.tar.xz,https://www.netfilter.org/projects/nftables/files/,6358830f3a64f31e39b0ad421d7dadcd240b72343ded48d8ef13b8faf204865a))
 $(eval $(call tar_download,NMAP,nmap,7.92,.tgz,https://nmap.org/dist/,064183ea642dc4c12b1ab3b5358ce1cef7d2e7e11ffa2849f16d339f5b717117))
 $(eval $(call tar_download,IPUTILS,iputils,s20190709,.tar.gz,https://github.com/iputils/iputils/archive/s20190709.tar.gz/#,a15720dd741d7538dd2645f9f516d193636ae4300ff7dbc8bfca757bf166490a))
 $(eval $(call tar_download,WIREGUARD_TOOLS,wireguard-tools,1.0.20210914,.tar.xz,https://git.zx2c4.com/wireguard-tools/snapshot/,97ff31489217bb265b7ae850d3d0f335ab07d2652ba1feec88b734bc96bd05ac))
@@ -322,11 +324,12 @@ $(BUILD_PATH)/init-cpio-spec.txt: $(TOOLCHAIN_PATH)/.installed $(BUILD_PATH)/ini
 	echo "file /bin/ss $(IPROUTE2_PATH)/misc/ss 755 0 0" >> $@
 	echo "file /bin/ping $(IPUTILS_PATH)/ping 755 0 0" >> $@
 	echo "file /bin/ncat $(NMAP_PATH)/ncat/ncat 755 0 0" >> $@
-	echo "file /bin/xtables-legacy-multi $(IPTABLES_PATH)/iptables/xtables-legacy-multi 755 0 0" >> $@
-	echo "slink /bin/iptables xtables-legacy-multi 777 0 0" >> $@
+	echo "file /bin/nft $(NFTABLES_PATH)/src/nft 755 0 0" >> $@
 	echo "slink /bin/ping6 ping 777 0 0" >> $@
 	echo "dir /lib 755 0 0" >> $@
 	echo "file /lib/libc.so $(TOOLCHAIN_PATH)/$(CHOST)/lib/libc.so 755 0 0" >> $@
+	echo "file /lib/libmnl.so.0 $(TOOLCHAIN_PATH)/lib/libmnl.so.0 755 0 0" >> $@
+	echo "file /lib/libnftnl.so.11 $(TOOLCHAIN_PATH)/lib/libnftnl.so.11 755 0 0" >> $@
 	echo "slink $$($(CHOST)-readelf -p .interp '$(BUILD_PATH)/init'| grep -o '/lib/.*') libc.so 777 0 0" >> $@
 
 $(KERNEL_BUILD_PATH)/.config: $(TOOLCHAIN_PATH)/.installed kernel.config arch/$(ARCH).config
@@ -338,7 +341,7 @@ $(KERNEL_BUILD_PATH)/.config: $(TOOLCHAIN_PATH)/.installed kernel.config arch/$(
 	cd $(KERNEL_BUILD_PATH) && ARCH=$(KERNEL_ARCH) $(KERNEL_PATH)/scripts/kconfig/merge_config.sh -n $(KERNEL_BUILD_PATH)/.config $(KERNEL_BUILD_PATH)/minimal.config
 	$(if $(findstring yes,$(DEBUG_KERNEL)),cp debug.config $(KERNEL_BUILD_PATH) && cd $(KERNEL_BUILD_PATH) && ARCH=$(KERNEL_ARCH) $(KERNEL_PATH)/scripts/kconfig/merge_config.sh -n $(KERNEL_BUILD_PATH)/.config debug.config,)
 
-$(KERNEL_BZIMAGE): $(TOOLCHAIN_PATH)/.installed $(KERNEL_BUILD_PATH)/.config $(BUILD_PATH)/init-cpio-spec.txt $(IPERF_PATH)/src/iperf3 $(IPUTILS_PATH)/ping $(BASH_PATH)/bash $(IPROUTE2_PATH)/misc/ss $(IPROUTE2_PATH)/ip/ip $(IPTABLES_PATH)/iptables/xtables-legacy-multi $(NMAP_PATH)/ncat/ncat $(WIREGUARD_TOOLS_PATH)/src/wg $(BUILD_PATH)/init
+$(KERNEL_BZIMAGE): $(TOOLCHAIN_PATH)/.installed $(KERNEL_BUILD_PATH)/.config $(BUILD_PATH)/init-cpio-spec.txt $(IPERF_PATH)/src/iperf3 $(IPUTILS_PATH)/ping $(BASH_PATH)/bash $(IPROUTE2_PATH)/misc/ss $(IPROUTE2_PATH)/ip/ip $(LIBMNL_PATH)/libmnl $(LIBNFTNL_PATH)/libnftnl $(NFTABLES_PATH)/src/nft $(NMAP_PATH)/ncat/ncat $(WIREGUARD_TOOLS_PATH)/src/wg $(BUILD_PATH)/init
 	$(MAKE) -C $(KERNEL_PATH) O=$(KERNEL_BUILD_PATH) ARCH=$(KERNEL_ARCH) CROSS_COMPILE=$(CROSS_COMPILE)
 .PHONY: $(KERNEL_BZIMAGE)
 
@@ -421,15 +424,34 @@ $(IPROUTE2_PATH)/misc/ss: | $(IPROUTE2_PATH)/.installed $(USERSPACE_DEPS)
 	$(MAKE) -C $(IPROUTE2_PATH) PREFIX=/ misc/ss
 	$(STRIP) -s $@
 
-$(IPTABLES_PATH)/.installed: $(IPTABLES_TAR)
+$(LIBMNL_PATH)/.installed: $(LIBMNL_TAR)
 	mkdir -p $(BUILD_PATH)
 	flock -s $<.lock tar -C $(BUILD_PATH) -xf $<
-	sed -i -e "/nfnetlink=[01]/s:=[01]:=0:" -e "/nfconntrack=[01]/s:=[01]:=0:" $(IPTABLES_PATH)/configure
 	touch $@
 
-$(IPTABLES_PATH)/iptables/xtables-legacy-multi: | $(IPTABLES_PATH)/.installed $(USERSPACE_DEPS)
-	cd $(IPTABLES_PATH) && ./configure --prefix=/ $(CROSS_COMPILE_FLAG) --enable-static --disable-shared --disable-nftables --disable-bpf-compiler --disable-nfsynproxy --disable-libipq --disable-connlabel --with-kernel=$(BUILD_PATH)/include
-	$(MAKE) -C $(IPTABLES_PATH)
+$(LIBMNL_PATH)/libmnl: | $(LIBMNL_PATH)/.installed $(USERSPACE_DEPS)
+	cd $(LIBMNL_PATH) && ./configure --prefix=$(TOOLCHAIN_PATH) $(CROSS_COMPILE_FLAG)
+	$(MAKE) -C $(LIBMNL_PATH) install
+	$(STRIP) -s $(TOOLCHAIN_PATH)/lib/libmnl.so.0
+
+$(LIBNFTNL_PATH)/.installed: $(LIBNFTNL_TAR)
+	mkdir -p $(BUILD_PATH)
+	flock -s $<.lock tar -C $(BUILD_PATH) -xf $<
+	touch $@
+
+$(LIBNFTNL_PATH)/libnftnl: | $(LIBNFTNL_PATH)/.installed $(USERSPACE_DEPS)
+	cd $(LIBNFTNL_PATH) && PKG_CONFIG_PATH="$(TOOLCHAIN_PATH)/lib/pkgconfig" ./configure --prefix=$(TOOLCHAIN_PATH) $(CROSS_COMPILE_FLAG)
+	$(MAKE) -C $(LIBNFTNL_PATH) install
+	$(STRIP) -s $(TOOLCHAIN_PATH)/lib/libnftnl.so.11
+
+$(NFTABLES_PATH)/.installed: $(NFTABLES_TAR)
+	mkdir -p $(BUILD_PATH)
+	flock -s $<.lock tar -C $(BUILD_PATH) -xf $<
+	touch $@
+
+$(NFTABLES_PATH)/src/nft: | $(NFTABLES_PATH)/.installed $(USERSPACE_DEPS)
+	cd $(NFTABLES_PATH) && PKG_CONFIG_PATH="$(TOOLCHAIN_PATH)/lib/pkgconfig" ./configure --prefix=/ $(CROSS_COMPILE_FLAG) --enable-static --disable-shared --disable-debug --disable-man-doc --with-mini-gmp --without-cli
+	$(MAKE) -C $(NFTABLES_PATH) PREFIX=/
 	$(STRIP) -s $@
 
 $(NMAP_PATH)/.installed: $(NMAP_TAR)
diff --git a/tools/testing/selftests/wireguard/qemu/kernel.config b/tools/testing/selftests/wireguard/qemu/kernel.config
index f314d3789f17..9930116ecd81 100644
--- a/tools/testing/selftests/wireguard/qemu/kernel.config
+++ b/tools/testing/selftests/wireguard/qemu/kernel.config
@@ -19,10 +19,9 @@ CONFIG_NETFILTER_XTABLES=y
 CONFIG_NETFILTER_XT_NAT=y
 CONFIG_NETFILTER_XT_MATCH_LENGTH=y
 CONFIG_NETFILTER_XT_MARK=y
-CONFIG_IP_NF_IPTABLES=y
-CONFIG_IP_NF_FILTER=y
-CONFIG_IP_NF_MANGLE=y
-CONFIG_IP_NF_NAT=y
+CONFIG_NF_TABLES=m
+CONFIG_NF_TABLES_INET=y
+CONFIG_NFT_NAT=y
 CONFIG_IP_ADVANCED_ROUTER=y
 CONFIG_IP_MULTIPLE_TABLES=y
 CONFIG_IPV6_MULTIPLE_TABLES=y
-- 
2.39.5 (Apple Git-154)

