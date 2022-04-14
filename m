Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10930C43217
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 22 Apr 2022 00:21:28 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 813bcc4b;
	Thu, 21 Apr 2022 23:49:56 +0000 (UTC)
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id e152f9e6
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 14 Apr 2022 10:45:14 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id l7so9268683ejn.2
 for <wireguard@lists.zx2c4.com>; Thu, 14 Apr 2022 03:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=blackwall-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RKDpEnsq/n/TRsn5XTPkAPYI/AT8kzztYLqaTFqSURk=;
 b=nKR+XgUN7eTJ2Jcf2loWmFdIYpEmeP+hHWrwngdla75Errh28Pn5UPFkMK5/NeVk3X
 DFLNR+O6HkaoweWqYxh+O2jcvdZYAC9pNtxsDRHBSpJ8nvh67kdTyY04OLpnPg+RyiI6
 T/4Qf06TvduBlehsRo8KqOIdKIeRry+qFKMLddEC5K2u8Si08s4scN63UpTlB13GH6MU
 Fo5lZogebyZXKqpV074KISVmw+dFGZF51bnAai6I/MUhqb0WjiYvxZpKVYFkJI/m0wrw
 pvoz15flvy4pRx0p+bJvUiDU3ZdoBH/B3Qpasrwqzmy1KDvg1JRzuB9NMpgGIT7qQoDo
 ouRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RKDpEnsq/n/TRsn5XTPkAPYI/AT8kzztYLqaTFqSURk=;
 b=eDjJg59HkVi059XEeeqreM59aWAzkQTJ28TYcgey2HDfxaBbzc8GwdmNf5OaeqgUkN
 dh2isSLAxMaL8eYu8PNwB4Og7pp707ppYKYAr9h+URt7QfLMEgEFJtZMFvoKZEKfhand
 g1bSt675nSWL86vF27/De8YBhLqE0NA2t9TJXyFCbfvyuFSJ8bHWTwe8mhFn18gH3Qm/
 FjGTBZdY0r0P/HJFvweSGZM+Wc7Gtwj8o5MCLghkWIyhJp8S/wv8oVT1Zn8FnbsRoTty
 0KWpfYmqbCtocL4DnnGSOuN5Gx12uFfLR75bqOPFwA5Wn0+oq7QX1jpTFP3sExjvQKL8
 vEfw==
X-Gm-Message-State: AOAM53325Hz5cDmMltKtM+vh5TWecX7fcFBnzT3CWVvpymNdoj9B1rKM
 0TaIAw7QcY5GOS4LdQpl1Z16Kw==
X-Google-Smtp-Source: ABdhPJxWyLzR8VL5eNUfSP/kKQK0ahCUimDMdAb3+O6qn5CWx93I46rmprI0Yf04MssQ/ykM8c/zkg==
X-Received: by 2002:a17:907:9485:b0:6db:331:591e with SMTP id
 dm5-20020a170907948500b006db0331591emr1744260ejc.478.1649933114305; 
 Thu, 14 Apr 2022 03:45:14 -0700 (PDT)
Received: from debil.. (87-243-81-1.ip.btc-net.bg. [87.243.81.1])
 by smtp.gmail.com with ESMTPSA id
 hy24-20020a1709068a7800b006e888dbf1d6sm504984ejc.91.2022.04.14.03.45.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Apr 2022 03:45:13 -0700 (PDT)
From: Nikolay Aleksandrov <razor@blackwall.org>
To: netdev@vger.kernel.org
Cc: Daniel Borkmann <daniel@iogearbox.net>, Martynas Pumputis <m@lambda.lt>,
 "Jason A . Donenfeld" <Jason@zx2c4.com>, wireguard@lists.zx2c4.com,
 kuba@kernel.org, davem@davemloft.net,
 Nikolay Aleksandrov <razor@blackwall.org>
Subject: [PATCH net 2/2] wireguard: selftests: add metadata_dst xmit selftest
Date: Thu, 14 Apr 2022 13:44:58 +0300
Message-Id: <20220414104458.3097244-3-razor@blackwall.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220414104458.3097244-1-razor@blackwall.org>
References: <20220414104458.3097244-1-razor@blackwall.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 21 Apr 2022 23:49:50 +0000
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

Add a selftest for transmitting skb with md_dst attached. It is done via
a bpf program which uses bpf_skb_set_tunnel_key on wireguard's egress
path. It requires clang and tc to be installed. If the test finishes
without a crash it is considered successful.

CC: wireguard@lists.zx2c4.com
CC: Jason A. Donenfeld <Jason@zx2c4.com>
CC: Daniel Borkmann <daniel@iogearbox.net>
CC: Martynas Pumputis <m@lambda.lt>
Signed-off-by: Nikolay Aleksandrov <razor@blackwall.org>
---
Executed the prep compilation commands with n1 to make them visible.

 tools/testing/selftests/wireguard/netns.sh | 63 ++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/tools/testing/selftests/wireguard/netns.sh b/tools/testing/selftests/wireguard/netns.sh
index 8a9461aa0878..b492dbb94245 100755
--- a/tools/testing/selftests/wireguard/netns.sh
+++ b/tools/testing/selftests/wireguard/netns.sh
@@ -156,6 +156,67 @@ tests() {
 	done
 }
 
+md_dst_test_cleanup() {
+	rm -rf /tmp/test_wg_tun.c /tmp/test_wg_tun.ll /tmp/test_wg_tun.o
+	n1 tc qdisc del dev wg0 clsact
+}
+
+# test for md dst on wireguard's egress path
+md_dst_test() {
+	# clang is required for the test
+	if [[ ! -x "$(command -v "clang")" ]]; then
+		return
+	fi
+
+	# attach md dst to the skb on egress using bpf_skb_set_tunnel_key
+	n1 cat > /tmp/test_wg_tun.c <<EOF
+#include <linux/bpf.h>
+
+#ifndef TC_ACT_OK
+# define TC_ACT_OK 0
+#endif
+
+static long (*bpf_skb_set_tunnel_key)(struct __sk_buff *skb, struct bpf_tunnel_key *key, __u32 size, __u64 flags) = (void *) 21;
+
+__attribute__((section("egress"), used))
+int tc_egress(struct __sk_buff *skb)
+{
+	struct bpf_tunnel_key key = {};
+
+        bpf_skb_set_tunnel_key(skb, &key, sizeof(key), 0);
+
+	return TC_ACT_OK;
+}
+
+char __license[] __attribute__((section("license"), used)) = "GPL";
+EOF
+
+	n1 clang -O2 -emit-llvm -c /tmp/test_wg_tun.c -o /tmp/test_wg_tun.ll
+	if [[ ! -f "/tmp/test_wg_tun.ll" ]]; then
+		md_dst_test_cleanup
+		return
+	fi
+	n1 llc -march=bpf -filetype=obj -o /tmp/test_wg_tun.o /tmp/test_wg_tun.ll
+	if [[ ! -f "/tmp/test_wg_tun.o" ]]; then
+		md_dst_test_cleanup
+		return
+	fi
+
+	n1 tc qdisc add dev wg0 clsact
+	if [[ $? -ne 0 ]]; then
+		md_dst_test_cleanup
+		return
+	fi
+	n1 tc filter add dev wg0 egress basic action bpf obj /tmp/test_wg_tun.o sec egress
+	if [[ $? -ne 0 ]]; then
+		md_dst_test_cleanup
+		return
+	fi
+	n1 ping -c 2 -f -W 1 192.168.241.2
+	# if we reach here without a crash the test passed
+	md_dst_test_cleanup
+}
+
 [[ $(ip1 link show dev wg0) =~ mtu\ ([0-9]+) ]] && orig_mtu="${BASH_REMATCH[1]}"
 big_mtu=$(( 34816 - 1500 + $orig_mtu ))
 
@@ -175,6 +236,8 @@ read _ rx_bytes tx_bytes < <(n1 wg show wg0 transfer)
 read _ timestamp < <(n1 wg show wg0 latest-handshakes)
 (( timestamp != 0 ))
 
+md_dst_test
+
 tests
 ip1 link set wg0 mtu $big_mtu
 ip2 link set wg0 mtu $big_mtu
-- 
2.35.1

