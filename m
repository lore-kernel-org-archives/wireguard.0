Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C081AD10F5A
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 18 Nov 2024 03:47:14 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2b2e748e;
	Mon, 18 Nov 2024 01:39:08 +0000 (UTC)
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [2607:f8b0:4864:20::62e])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 56572dda
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 7 Nov 2024 02:44:40 +0000 (UTC)
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-20ce5e3b116so4588855ad.1
 for <wireguard@lists.zx2c4.com>; Wed, 06 Nov 2024 18:44:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730947479; x=1731552279; darn=lists.zx2c4.com;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=loG8eJYDFPVgMwg8ZCVGVs1Bg+cc695VBtfdcMG/Pbs=;
 b=cB/MKIYS6j2jpx5GK5u0cM/i3C/FvM3Ip15R06D0bTh9VFJYw7fE7hM98EHaEFqYHm
 ciK8mgNgwMFaMJOQJSIQtsblecwX6VqJikPYtsDYGuf2WWsJgLL5aVRt4ieGD7jm+RII
 98pnNjSF8fsFKwrE2TuRfCCHrbMcmEiTCArtKIcbLgzI3gCeP36CKeGrEeZwXOUumFxT
 qJ+Jx2oa4c6Mln+4H5MAWB8QP50NZotIBaQxC8L39v4mQmUt3sSm5t8hL1RZQfhMCI4B
 72fv5xIfEPs28kxYCbSl/cczm7rsrRvTQe9Z1hAaVfdIFzlQ3m9Jr6rHG/oWfGb97rsF
 0d1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730947479; x=1731552279;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=loG8eJYDFPVgMwg8ZCVGVs1Bg+cc695VBtfdcMG/Pbs=;
 b=oQaDAbFHovXzH91y5NPKB+9CbXHW8QRKDhr8Jx2USDRhHCp+owX4DSdEbzseV9YadS
 vTRY2f/NICNG15Zka2c76mjHfw+5Z7W6Myl87avkP+QhWR0J6CvZE/yXNVqudzzIk127
 jI+6q9iziHLqGMDW1y5kJEjnPuEiZ1bQeBs5wnciBgpmYYOlp3mhntujlouPYs1nRdwV
 6Skzqats6NMJ187ybf42qbqOar3pk1tbVYEtK2mA3kVBj8AxwmTNcP+h50cwhkhFdQF1
 3t0Rz8M+bxK4Rx2V5L6KGTVbE6YCkCu/TgeQgtycMYOKP/sKD8uC3X5hvMGdcZPHFFBU
 y07w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVJulIutaECTi5poNLkIK4PIvTDtGc3VY88KYyGYH5SajZuSxMTIQNKWEZDH64W9YbeR3LScMUktJw=@lists.zx2c4.com
X-Gm-Message-State: AOJu0YyFx/8R2hiY0ub9IoUxu3Wk3RxaEJ2ayqOm9dWrtZcpi+NLqVrY
 Mr2iga/d8rwYY5Iq/9iH8xaV12zrAMjfT6HEKV0tTptcEldE9jCY
X-Google-Smtp-Source: AGHT+IF3faaaeb+GfUqpTBgS0NbMgnK0qUQoAqDyAmNXEFBW9+dVkjBxUwprxn00asTAcUf/YG6TQw==
X-Received: by 2002:a17:903:1c6:b0:20c:c15c:96ab with SMTP id
 d9443c01a7336-2111afd6c30mr320340815ad.48.1730947478876; 
 Wed, 06 Nov 2024 18:44:38 -0800 (PST)
Received: from fedora.dns.podman ([43.228.180.230])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21177de0578sm1816545ad.89.2024.11.06.18.44.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Nov 2024 18:44:38 -0800 (PST)
From: Hangbin Liu <liuhangbin@gmail.com>
To: netdev@vger.kernel.org
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, Shuah Khan <shuah@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, wireguard@lists.zx2c4.com,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 Hangbin Liu <liuhangbin@gmail.com>
Subject: [PATCH net] selftests: wireguard: load nf_conntrack if it's not
 present
Date: Thu,  7 Nov 2024 02:44:18 +0000
Message-ID: <20241107024418.3606-1-liuhangbin@gmail.com>
X-Mailer: git-send-email 2.46.0
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

Some distros may not load nf_conntrack by default, which will cause
subsequent nf_conntrack settings to fail. Let's load this module if it's
not loaded by default.

Fixes: e7096c131e51 ("net: WireGuard secure network tunnel")
Signed-off-by: Hangbin Liu <liuhangbin@gmail.com>
---
 tools/testing/selftests/wireguard/netns.sh | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/testing/selftests/wireguard/netns.sh b/tools/testing/selftests/wireguard/netns.sh
index 405ff262ca93..508b391e8d9a 100755
--- a/tools/testing/selftests/wireguard/netns.sh
+++ b/tools/testing/selftests/wireguard/netns.sh
@@ -66,6 +66,7 @@ cleanup() {
 orig_message_cost="$(< /proc/sys/net/core/message_cost)"
 trap cleanup EXIT
 printf 0 > /proc/sys/net/core/message_cost
+lsmod | grep -q nf_conntrack || modprobe nf_conntrack
 
 ip netns del $netns0 2>/dev/null || true
 ip netns del $netns1 2>/dev/null || true
-- 
2.46.0

