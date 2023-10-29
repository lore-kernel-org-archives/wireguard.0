Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95D64C54E76
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 19 Nov 2023 13:45:22 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ac0aa0e8;
	Sun, 19 Nov 2023 13:34:44 +0000 (UTC)
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id c2221eaf
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 29 Oct 2023 19:23:00 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-53df747cfe5so6325980a12.2
 for <wireguard@lists.zx2c4.com>; Sun, 29 Oct 2023 12:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698607380; x=1699212180; darn=lists.zx2c4.com;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=lNLFWGQcY8gYIVtMiFHRcEBxCrJLado4A3Ox6EBfYkM=;
 b=T9CG8MbuCaWIFBJ/51VqlygpO0xScgHdBdWdGODjxO93iceOQ8QJ32ETq7wi4NR+86
 Ug/MtMSXnQDIKZHwjZBoTUs/qZzcvGho3cEtjenLOw2c2J/GzV/1j9cwViB8cCm9+dTd
 LeH3aK3DuZUHEYYOS5xb7Io+Eo2/x+GQHwxaOeOcH6QFYh8nyi2Q3Om4zREExSRW+EeF
 I5bNaIorHpIScaP6XvAi50uGq8P8A48ZbymrNjsj7wzfV0JYvH66ZL9KljiQe2W2UB17
 swP+vBeUu+JaZyeerjhQrhkc4Y+EidnVl5oFnYCbDiA6Qq8WrHrChI83TqUKP+F7glda
 KOiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698607380; x=1699212180;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lNLFWGQcY8gYIVtMiFHRcEBxCrJLado4A3Ox6EBfYkM=;
 b=UmiqkVAclG7bCI5bfYqFRwzR5g1iHx2iqTcaCo4LLwqiBjOAmMKPdwGwXIgArlBowJ
 H6uYauljWL/3cHAwAmYv6NZHAOzgM4go7aJcnVADQJZMQfsvDTtox4G1mQc101ZszLEA
 1VIgQgNQTAWntsCdjQGenQirOk47lEFmmj7pYC0TXMM/wJ49TfOupTGKByKPomL7E/Ox
 iLu3wiY+dS1MSdcuilUfHFLWpIbWUS1idMOVB9beLhhX5Qg+jAKqbQmYwCOCPQ+VRRAc
 esmt/VpxPIllQxlrULeJ5jaYTjcNCxElBbKxnsikqDmdThDEyUvKdH135gURX9imSAqr
 yMJQ==
X-Gm-Message-State: AOJu0YzE6WMn9iHNoxUOp+ERZT4ZSI/M/eAgCldCAJuLJGa2Mv9E5ti3
 kSouSDlN022Blzy4A3HNeXgpFxYEceg=
X-Google-Smtp-Source: AGHT+IEVBMwRhshvCoAWm0XiSHU+Joud+ak0i7m9h9qs4Sy4d/hlU1ESCVQVRPtT5jdqZ4gxNdA2Hw==
X-Received: by 2002:a17:906:fe46:b0:9c3:b3cb:29b2 with SMTP id
 wz6-20020a170906fe4600b009c3b3cb29b2mr6948978ejb.42.1698607379373; 
 Sun, 29 Oct 2023 12:22:59 -0700 (PDT)
Received: from tom.local ([185.195.232.175]) by smtp.gmail.com with ESMTPSA id
 gq4-20020a170906e24400b0099bd0b5a2bcsm4788242ejb.101.2023.10.29.12.22.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Oct 2023 12:22:58 -0700 (PDT)
From: Thomas Brierley <tomxor@gmail.com>
To: wireguard@lists.zx2c4.com
Cc: Thomas Brierley <tomxor@gmail.com>
Subject: [PATCH] wg-quick: linux: fix MTU calculation (use PMTUD)
Date: Sun, 29 Oct 2023 19:22:10 +0000
Message-Id: <20231029192210.120316-1-tomxor@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 19 Nov 2023 13:34:33 +0000
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

Currently MTU calculation fails to successfully utilise the kernel's
built-in path MTU discovery mechanism (PMTUD). Fixing this required a
re-write of the set_mtu_up() function, which also addresses two related
MTU issues as a side effect...

1. Trigger PMTUD Before Query

Currently the endpoint path MTU acquired from `ip route get` will almost
definitely be empty, because this only queries the routing cache.  To
trigger PMTUD on the endpoint and fill this cache, it is necessary to
send an ICMP with the DF bit set.

We now perform a ping beforehand with a total packet size equal to the
interface MTU, larger will not trigger PMTUD, and smaller can miss a
bottleneck. To calculate the ping payload, the device MTU and IP header
size must be determined first.

2. Consider IPv6/4 Header Size

Currently an 80 byte header size is assumed i.e. IPv6=40 + WireGuard=40.
However this is not optimal in the case of IPv4. Since determining the
IP header size is required for PMTUD anyway, this is now optimised as a
side effect of endpoint MTU calculation.

3. Use Smallest Endpoint MTU

Currently in the case of multiple endpoints the largest endpoint path
MTU is used. However WireGuard will dynamically switch between endpoints
when e.g. one fails, so the smallest MTU is now used to ensure all
endpoints will function correctly.

Signed-off-by: Thomas Brierley <tomxor@gmail.com>
---
 src/wg-quick/linux.bash | 41 ++++++++++++++++++++++++++---------------
 1 file changed, 26 insertions(+), 15 deletions(-)

diff --git a/src/wg-quick/linux.bash b/src/wg-quick/linux.bash
index 4193ce5..5aba2cb 100755
--- a/src/wg-quick/linux.bash
+++ b/src/wg-quick/linux.bash
@@ -123,22 +123,33 @@ add_addr() {
 }
 
 set_mtu_up() {
-	local mtu=0 endpoint output
-	if [[ -n $MTU ]]; then
-		cmd ip link set mtu "$MTU" up dev "$INTERFACE"
-		return
-	fi
-	while read -r _ endpoint; do
-		[[ $endpoint =~ ^\[?([a-z0-9:.]+)\]?:[0-9]+$ ]] || continue
-		output="$(ip route get "${BASH_REMATCH[1]}" || true)"
-		[[ ( $output =~ mtu\ ([0-9]+) || ( $output =~ dev\ ([^ ]+) && $(ip link show dev "${BASH_REMATCH[1]}") =~ mtu\ ([0-9]+) ) ) && ${BASH_REMATCH[1]} -gt $mtu ]] && mtu="${BASH_REMATCH[1]}"
-	done < <(wg show "$INTERFACE" endpoints)
-	if [[ $mtu -eq 0 ]]; then
-		read -r output < <(ip route show default || true) || true
-		[[ ( $output =~ mtu\ ([0-9]+) || ( $output =~ dev\ ([^ ]+) && $(ip link show dev "${BASH_REMATCH[1]}") =~ mtu\ ([0-9]+) ) ) && ${BASH_REMATCH[1]} -gt $mtu ]] && mtu="${BASH_REMATCH[1]}"
+	local dev devmtu end endmtu iph=40 wgh=40 mtu
+	# Device MTU
+	if [[ -n $(ip route show default) ]]; then
+		[[ $(ip route show default) =~ dev\ ([^ ]+) ]]
+		dev=${BASH_REMATCH[1]}
+		[[ $(ip addr show $dev scope global) =~ inet6 ]] &&
+			iph=40 || iph=20
+		if [[ $(ip link show dev $dev) =~ mtu\ ([0-9]+) ]]; then
+			devmtu=${BASH_REMATCH[1]}
+			[[ $(( devmtu - iph - wgh )) -gt $mtu ]] &&
+				mtu=$(( devmtu - iph - wgh ))
+		fi
+		# Endpoint MTU
+		while read -r _ end; do
+			[[ $end =~ ^\[?([a-f0-9:.]+)\]?:[0-9]+$ ]]
+			end=${BASH_REMATCH[1]}
+			[[ $end =~ [:] ]] &&
+				iph=40 || iph=20
+			ping -w 1 -M do -s $(( devmtu - iph - 8 )) $end &> /dev/null || true
+			if [[ $(ip route get $end) =~ mtu\ ([0-9]+) ]]; then
+				endmtu=${BASH_REMATCH[1]}
+				[[ $(( endmtu - iph - wgh )) -lt $mtu ]] &&
+					mtu=$(( endmtu - iph - wgh ))
+			fi
+		done < <(wg show "$INTERFACE" endpoints)
 	fi
-	[[ $mtu -gt 0 ]] || mtu=1500
-	cmd ip link set mtu $(( mtu - 80 )) up dev "$INTERFACE"
+	cmd ip link set mtu ${MTU:-${mtu:-1420}} up dev "$INTERFACE"
 }
 
 resolvconf_iface_prefix() {
-- 
2.30.2

