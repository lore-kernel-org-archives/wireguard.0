Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BB95C54E65
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 21 May 2025 09:18:34 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a6520e65;
	Tue, 20 May 2025 19:38:05 +0000 (UTC)
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [2607:f8b0:4864:20::62c])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 190d2e5f
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 6 Jan 2025 08:11:12 +0000 (UTC)
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-216401de828so188318715ad.3
 for <wireguard@lists.zx2c4.com>; Mon, 06 Jan 2025 00:11:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736151070; x=1736755870; darn=lists.zx2c4.com;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bhOap6+15f1GmW4sBRqJQM8M8dIdM7tw6pxxMIVMkWY=;
 b=Vz0fNt/791mwNX3MzeQjKziI+JO8rGb0uio5dYez6Vhg7KtqRtaLsH+Df0+nHdfd+p
 jz8cRiTtNdFpFBmB25j7gh5DF1bnblmqmTb1lfEAN3eVpnKfjRcWB5tTFvOluvrFuy2w
 +CzrqDwmt9fetewpS73uLx97gLejgZW/ZKW6P3qIUgH6OYone1o+UuNqH1q+vVGzvyr3
 +yXqVDigbmcYam5ZHFPZ2SQqUewb+nI7DJlpnqYGCuZ6Z4mkZbOaT81Wnw4haWPBWVQB
 P9l7TdOap4xbhwYioYaq4Cnva2pjZI0ZlmdPIpmQyTvhqiRm1FuDyNv2BC9YFErEWXV5
 R50A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736151070; x=1736755870;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bhOap6+15f1GmW4sBRqJQM8M8dIdM7tw6pxxMIVMkWY=;
 b=WcUSyh7WWJ+L7u3XN8IPUFlCPqrtzBF0ARLBjJZCpMfe0r9rSSBBygAaZwOjJs1iW8
 HvzcJRUJelpI4NgWTppjCvc+Vip49Rlx58yEEAqYL4KeJvhvrTCiNkG58WMXR8YzfBde
 lyZ0UnQe/2pD9ozk/En4F+LWYSeVEuAF/LnuWP8q1gL4WY+UqqcdbDMnHSFelrGun3rs
 654YiCCCFuA5GajWSQfSZchTcvdCpKQ06gEMRUU78NfD+EcA+ey3WxQtEwxztDh1P1nj
 rA/311XSz4ir/7ALLwhrNd2whJIdeT2JuLQJwiDw+Psp8EZSldQoUtMCjHdfW9UmUP+/
 XmwA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXOFfP8r/ZDFdlE7E2TlfdUESw1pqOUvlGYhfBdQhBwUj3ZbDIL4c+ScLsz8hAdiFpAxB5sO5pQQ9w=@lists.zx2c4.com
X-Gm-Message-State: AOJu0YyU8/DVEf85tygSGZC+VM1FuFYE1wfET0gZppQu/qFj2wJHkgtL
 jf/XmhUZOtFZrgO2ZlAWDu96FsaOskERAGiFDDeaCH3fK3NGO0uP
X-Gm-Gg: ASbGnctkXq4a8pvhUlftZiDu5w9p2GFmx0Vfa4jQMGVyccNhK0vwLSW4bV40HGUiNvZ
 U2cjaTepuW7CyVQtOBpgzXrR10MNJ/5SUwiNxFac17gJNK82VhWVjCFEEVlh/HsLfSktQ0/2StJ
 X8zvGqEztz6TrYaKOn9i12cwVBd55ycIQ1X3jedsfJ233lqZ/Nnxm+Yrou+3cG8Upx0kFE1MMac
 OGLJpNqQ/spJXwes8sVyOH5wZ9TsJyfzhOBv2F/SqexpREaVvKW1QxgezuzDZVIwWhjb6hfPW1n
X-Google-Smtp-Source: AGHT+IEHw+/S3OGAMfCJhasJ0UYNsadv+UBR4uBkeGflOgvtUWbRLzpFTftGbVN+YPDaAubWouJoig==
X-Received: by 2002:a05:6a21:7898:b0:1e0:cabf:4d99 with SMTP id
 adf61e73a8af0-1e5e046362dmr103096652637.14.1736151070241; 
 Mon, 06 Jan 2025 00:11:10 -0800 (PST)
Received: from fedora.dns.podman ([43.228.180.230])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-72aad835469sm31910429b3a.60.2025.01.06.00.11.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jan 2025 00:11:09 -0800 (PST)
From: Hangbin Liu <liuhangbin@gmail.com>
To: netdev@vger.kernel.org
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, Jakub Kicinski <kuba@kernel.org>,
 Shuah Khan <shuah@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Simon Horman <horms@kernel.org>, Phil Sutter <phil@nwl.cc>,
 Florian Westphal <fw@strlen.de>, Petr Mladek <pmladek@suse.com>,
 Yoann Congal <yoann.congal@smile.fr>, wireguard@lists.zx2c4.com,
 bpf@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, Hangbin Liu <liuhangbin@gmail.com>
Subject: [PATCHv4 RESEND net-next 2/2] selftests: wireguard: update to using
 nft for qemu test
Date: Mon,  6 Jan 2025 08:10:43 +0000
Message-ID: <20250106081043.2073169-3-liuhangbin@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250106081043.2073169-1-liuhangbin@gmail.com>
References: <20250106081043.2073169-1-liuhangbin@gmail.com>
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
2.46.0

