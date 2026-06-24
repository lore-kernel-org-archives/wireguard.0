Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 622B2CA5FFD
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  5 Oct 2026 07:26:21 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 64432bd5;
	Mon, 5 Oct 2026 06:56:18 +0000 (UTC)
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com
 [2607:f8b0:4864:20::112e])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 3e5b53e5
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 24 Jun 2026 12:30:27 +0000 (UTC)
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-7ff05e5d009so8478557b3.1
 for <wireguard@lists.zx2c4.com>; Wed, 24 Jun 2026 05:30:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1782304226; x=1782909026; darn=lists.zx2c4.com;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+8k9TIVBzrtkJ+5AdlIoIq3eU8KFjMxgcsnRy+gI+28=;
 b=I2TGYsM9jR9/I9c8ogTJJX6N/C4Oc6/+ZaQCRa15TmlCu3lwKRiypbOH4myLWb+yba
 McPFAVEPWkLyfQNMf4Q8z1uQJK9+HOsmx2SuB3RRoFmaZlGgJKYdMpe1biOVYor9DbwX
 VsOL/U2RXeezrZnwXmHFMUOHRevX28nL17JBDWHrB+hWfZV9XPZ+BbjH/4y+/GX3+neD
 61k+W6r4qiPQtjdYyQANTMLqy62tLtymevbr8BoLijT+NqxlByG9wcGNaPkm3QB521AB
 HLI3EvMwk3SsW/GBZ7UvmAEgVI8ROgXqM4F1FwdqfS6tNJUllFm2SBpcWlsSO2efJL/Z
 Pg3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782304226; x=1782909026;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+8k9TIVBzrtkJ+5AdlIoIq3eU8KFjMxgcsnRy+gI+28=;
 b=LuYWSuusI7na36yWJeVdQpf56avZXUoTJ1e7HrJJz4fbEFalM5ClOLajnN8RpGG8xn
 /GyH1H3uR1D+GHwmgZT5XCTUWP7Oa3K3ftkmucXn2kA5DT05eFjb5y7gdpM9YlZ/mOTK
 DM5OBSxwZN7WKQh06wJ4M8vbh2d/MyAQ5gCvHbs2FXxuxERm0tcF1WXjDUTgc1A7ItuU
 yieL2+83scJCgFJlc724ET5crmb0tIf7fu5H8t04/g9vLaaeA2j3VRN1cpS8YXQeF+6v
 RjbIl8RqnnvtgwPn9a8GMnzDR6IyDVo4VsBgAktDx51sePnVz7nt43cdR/qeuECKbaRu
 h1pQ==
X-Forwarded-Encrypted: i=1;
 AHgh+Ronq004aOaexdBGbYgrEBJOUB65wnT7HYuFbNdGtJ0asDDtbKl/MS7ObrWnJ6Wghit0fxxOwhFgC/k=@lists.zx2c4.com
X-Gm-Message-State: AOJu0Yzb77oPbqtW0ii5+SCa5Hu0N00jItysvaexNLLIF+70TaJfqPox
 kXpd/SbHAGwmc2kCvGk+jnhDSTQMdHpR32wDxfXI2ECok/TrIsAdiDB3
X-Gm-Gg: AfdE7clODf8/bUbip/pQ0qFvF+NB1jGmJOYqExe6LilEe00F4dx00DeRPjXGDU/44NU
 AUIyhlFTM5W32vKWn+2wbUW1mzFuEIj/aQT4edVuKPKjFP0vLXBbv3p21TEaBDyIECWlcgZShAd
 ksYIvCRl2LytXWQ2mbKjPs7KY9rgKY8bmP4bhKIpZBtGXdj4U2Sch37F7IGgcmuk6ceSHLUCaSk
 DYyUbnIuP1ZJa+UeWqPXeKm6joJpRGArl78vDG425mRie+NiOULLDMaw2F3S/aF9bXgNkZAQKo+
 c2uI8KNjweqgig+tG25fl7/I2H4GsBWsRckgsjqAsuPYtbzY9A4O/Gu68t+Cs8ddMYsmcTXw7Nk
 55bcOfNyYD5avgGEdnIACNhcPHwLOnzXDVB39aBoMdypLrqcihaacbw0xun3ek6h1bl7CpUnUUU
 JRKFocoB3CgMrIMl73BpDpP3TsFQ==
X-Received: by 2002:a05:690c:c4f7:b0:7dc:c477:9e98 with SMTP id
 00721157ae682-806c3a1a9ddmr62727187b3.31.1782304225501; 
 Wed, 24 Jun 2026 05:30:25 -0700 (PDT)
Received: from Dev-Null-MSI ([2a0d:3344:52ac:a808:98a4:4381:be45:536f])
 by smtp.gmail.com with ESMTPSA id
 00721157ae682-8025c96fdb3sm57601677b3.1.2026.06.24.05.30.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jun 2026 05:30:25 -0700 (PDT)
From: Yousef Alhouseen <alhouseenyousef@gmail.com>
To: Jason@zx2c4.com
Cc: shuah@kernel.org, wireguard@lists.zx2c4.com, netdev@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 Yousef Alhouseen <alhouseenyousef@gmail.com>
Subject: [PATCH] selftests: wireguard: avoid extglob in netns CPU count
Date: Wed, 24 Jun 2026 14:30:09 +0200
Message-ID: <20260624123009.7008-1-alhouseenyousef@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 05 Oct 2026 06:55:46 +0000
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

netns.sh enables extglob before using cpu+([0-9]) to count CPUs, but
bash -n parses the whole script without executing that shopt command. This
makes syntax checks fail even though the script is intended for bash.

Use the ordinary cpu[0-9]* glob instead. It matches the same CPU directory
names without requiring extglob, and lets bash validate the script syntax.

Signed-off-by: Yousef Alhouseen <alhouseenyousef@gmail.com>
---
 tools/testing/selftests/wireguard/netns.sh | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/tools/testing/selftests/wireguard/netns.sh b/tools/testing/selftests/wireguard/netns.sh
index a8f550aec..98b423494 100755
--- a/tools/testing/selftests/wireguard/netns.sh
+++ b/tools/testing/selftests/wireguard/netns.sh
@@ -22,12 +22,11 @@
 # interfaces in $ns1 and $ns2. See https://www.wireguard.com/netns/ for further
 # details on how this is accomplished.
 set -e
-shopt -s extglob
 
 exec 3>&1
 export LANG=C
 export WG_HIDE_KEYS=never
-NPROC=( /sys/devices/system/cpu/cpu+([0-9]) ); NPROC=${#NPROC[@]}
+NPROC=( /sys/devices/system/cpu/cpu[0-9]* ); NPROC=${#NPROC[@]}
 netns0="wg-test-$$-0"
 netns1="wg-test-$$-1"
 netns2="wg-test-$$-2"
-- 
2.54.0

