Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54AFFD49212
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 18 Nov 2024 12:35:44 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ad683930;
	Mon, 18 Nov 2024 12:35:42 +0000 (UTC)
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 15f8840a
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sun, 4 Feb 2024 10:10:42 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-40fd26d4f92so7060255e9.0
 for <wireguard@lists.zx2c4.com>; Sun, 04 Feb 2024 02:10:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707041441; x=1707646241; darn=lists.zx2c4.com;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=YnK5Oa8kb7CgSyAbum4t1svCfP6IMFnHlJOgLAgYyLY=;
 b=WRSJGcS0CKdrmbx3BSMThfHo9CfTDcUurlv2bYfNFn1yP5kgBfY665ZbqHDqIafqV9
 5p5Icj9nSpoJrlfGHjcymmZGPV3XKLGRaPedgXJPDEvmLTkVBM005N7uhv0zJTU9HmwM
 IzEHlRRn+Hzl+4YOLHpqyfT5oHbgvuZcidi1ZFLmNzyRiUObyMu1h3hijw0posr3X1xI
 Vqh58CqTpwV5j0GfpZVLU6RbbAfAQM++SlN5DZj17ZbmUytcAKvyMryi4JRCIV7O1UFh
 q9W+0K3WHSx9Xl4VeVkoD/j1rooIdxyIAd7AHAKDGkPP8yfFVP5dDjXq0DC1BucLLHnR
 QLbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707041441; x=1707646241;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YnK5Oa8kb7CgSyAbum4t1svCfP6IMFnHlJOgLAgYyLY=;
 b=N+QRsxQHmwPFaDbwyaoFXs/6zUy5JtixIfFi8Em2aqcOYM/iq/COqnOrO38EqhHnCx
 vgmAwhESDna7ZF7DaDYykE2Yuz6rvjMFsxrHSsl2PMi1Q5gf2yiF/QUOBffU3yhVmogu
 Fg7CQl8c/4fzhvB2I9nsoRFzLA2P8gF5hZbPF/EwDOtA+KrYaTtf8xrlxrx1QU2vFxzI
 N+d5xwURvZmf7WJsP/zTfASswosTdsVPexcGL1ZPSVRhhg/+JegmaHgE3fgWQl5SeN7g
 +WMk2JMT1eqcYVojy9w7TYTdlIETjEvGHBoqVFvHzdOMF60wvOmHf9/VwIY8KATS/NOp
 xfiQ==
X-Gm-Message-State: AOJu0YwDYs2D1V1c1qgNDIzTFUW2vAlcECJ8Oww1wklaPF5Bi8cST8ES
 nNt9pY9odh3JbbqNWd1YSGlFdncU4MNJ5S03rzHm6l6EvCNL8TJtplueeZqG8KPv
X-Google-Smtp-Source: AGHT+IFSDRe6kZPlmKmYsPmFAHCkBvdLCsE6XC8/O4Jdk79v2pW9/vLRcUAfHECCQW1QJ3r/BEk56A==
X-Received: by 2002:adf:e7cc:0:b0:33b:287d:412c with SMTP id
 e12-20020adfe7cc000000b0033b287d412cmr3173744wrn.43.1707041441090; 
 Sun, 04 Feb 2024 02:10:41 -0800 (PST)
Received: from images.net ([2001:41d0:2:c72a::])
 by smtp.gmail.com with ESMTPSA id
 n12-20020a5d400c000000b0033b3c2e73e2sm231660wrp.113.2024.02.04.02.10.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Feb 2024 02:10:40 -0800 (PST)
From: Athanasios Oikonomou <athoik@gmail.com>
To: wireguard@lists.zx2c4.com
Cc: Athanasios Oikonomou <athoik@gmail.com>
Subject: [PATCH] wg-quick: linux: check iptables existance prior trying restore
Date: Sun,  4 Feb 2024 12:10:29 +0200
Message-Id: <20240204101029.1805-1-athoik@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 18 Nov 2024 12:35:39 +0000
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

This commit is adding a check for iptables existance prior restoring iptables rules.
Testing the existable of iptables already applied in remove_firewall.
https://git.zx2c4.com/wireguard-tools/tree/src/wg-quick/linux.bash?id=13f4ac4cb74b5a833fa7f825ba785b1e5774e84f#n197

Without fix applied wg-quick fails.

$ wg-quick up wg0
[#] ip link add wg0 type wireguard
[#] wg setconf wg0 /dev/fd/63
[#] ip -4 address add 10.100.0.2/32 dev wg0
[#] ip -6 address add fd08:4711::2/128 dev wg0
[#] ip link set mtu 1420 up dev wg0
[#] resolvconf -a wg0 -m 0 -x
[#] wg set wg0 fwmark 51820
[#] ip -6 route add ::/0 dev wg0 table 51820
[#] ip -6 rule add not fwmark 51820 table 51820
[#] ip -6 rule add table main suppress_prefixlength 0
[#] ip6tables-restore -n
/usr/bin/wg-quick: line 32: ip6tables-restore: command not found
[#] resolvconf -d wg0 -f
[#] ip -6 rule delete table 51820
[#] ip -6 rule delete table main suppress_prefixlength 0
[#] ip link delete dev wg0

With fix applied wg-quick works.

wg-quick up wg0
[#] ip link add wg0 type wireguard
[#] wg setconf wg0 /dev/fd/63
[#] ip -4 address add 10.100.0.2/32 dev wg0
[#] ip -6 address add fd08:4711::2/128 dev wg0
[#] ip link set mtu 1420 up dev wg0
[#] resolvconf -a wg0 -m 0 -x
[#] wg set wg0 fwmark 51820
[#] ip -6 route add ::/0 dev wg0 table 51820
[#] ip -6 rule add not fwmark 51820 table 51820
[#] ip -6 rule add table main suppress_prefixlength 0
[#] ip -4 route add 0.0.0.0/0 dev wg0 table 51820
[#] ip -4 rule add not fwmark 51820 table 51820
[#] ip -4 rule add table main suppress_prefixlength 0
[#] sysctl -q net.ipv4.conf.all.src_valid_mark=1

Signed-off-by: Athanasios Oikonomou <athoik@gmail.com>
---
 src/wg-quick/linux.bash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/src/wg-quick/linux.bash b/src/wg-quick/linux.bash
index 4193ce5..0d85840 100755
--- a/src/wg-quick/linux.bash
+++ b/src/wg-quick/linux.bash
@@ -240,7 +240,7 @@ add_default() {
 	[[ $proto == -4 ]] && cmd sysctl -q net.ipv4.conf.all.src_valid_mark=1
 	if type -p nft >/dev/null; then
 		cmd nft -f <(echo -n "$nftcmd")
-	else
+	elif type -p iptables >/dev/null; then
 		echo -n "$restore" | cmd $iptables-restore -n
 	fi
 	HAVE_SET_FIREWALL=1
-- 
2.20.1

