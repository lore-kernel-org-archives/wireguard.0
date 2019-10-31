Return-Path: <SRS0=OnWR=ZT=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3A8BC432C3
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 27 Nov 2019 09:04:27 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7E50620678
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 27 Nov 2019 09:04:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZLcqbMFq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7E50620678
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3b52c64e;
	Wed, 27 Nov 2019 09:04:26 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8e93d30c
 for <wireguard@lists.zx2c4.com>;
 Thu, 31 Oct 2019 23:40:16 +0000 (UTC)
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5fc6512b
 for <wireguard@lists.zx2c4.com>;
 Thu, 31 Oct 2019 23:40:16 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id t1so2138980wrv.4
 for <wireguard@lists.zx2c4.com>; Thu, 31 Oct 2019 16:40:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:message-id:mime-version;
 bh=YmrKKb+fr32lv6Oyu8u3wlvC4w7Cd6vPkq9OoIb8EXQ=;
 b=ZLcqbMFqFDJDgUODjm9g1iZQ6lREHueQi8w18iKgQc16+G2+gFmiAgppNFrTA88elb
 DGuyfMeh0QtuyPB/NWTFul0ftqZ/pHfVeOQdMhLffXZfnyt5pFisO84gk3voGzM9LTV5
 gx9c1cTFkbu+L6Hkgn0zilsW7THwWG1AjX40CJKPWzaZtlQlFKAFCBL9N0KNYJD/NnE8
 H6oyGHtdG8c/ytTmXa8YBLap/3frDz+e5sT+doS66OU4mMmc2t60ub6JEYsU8JTYmzMe
 mqXA5ncbq+2OtbOGml57N6HySPgn6/ZQH0w55GMpd7LGi0rE7FuejmFDxQ9H31GdT5bM
 f5Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:message-id:mime-version;
 bh=YmrKKb+fr32lv6Oyu8u3wlvC4w7Cd6vPkq9OoIb8EXQ=;
 b=Ae4wlH0JblITGPLEC0u4/ufJO6Xs1ANmAz69cRnP2tjydkmq53jAqNaHK09v59+hSD
 rB81dvULek+8VqJh6BjH6F5nQmtv3kqv4nsB5BtZLtuKHvMXbvPR614aOzsRj5swKSRt
 gHKDpsKTwPTcM7lezWIlucjhiw7dlqoZl/uZKjkD8om1PtkxchV5i3DxtB5dUmkTfwvF
 Wxf2tNDcGuqDel/kur+LcEiU99Kx2CaFqAnbjaSPAyjT/5u3615AHmalByclJ0dssKED
 XT10+Bux7GrkSyo0Ld2AyI5GLNLOhqyCqF1EVNcB5MpF/dZqNlyaNqIYbMutn6saIpCB
 ix9A==
X-Gm-Message-State: APjAAAXx5bg3vE+rasQdTQTE0pRBcyIJyuoNPy7oalBVfh+ylm2t80Ou
 85+9nJA0yaAoM0fGqpfCxINvqH0l
X-Google-Smtp-Source: APXvYqyrFHsHsuFS+I2YNpfWiK8jBW5EVx1OU1ry3cAKDl9BWKEqQeuRMmwBbjlM4icGSYl25M6XoA==
X-Received: by 2002:a05:6000:11d2:: with SMTP id
 i18mr8396078wrx.109.1572565215568; 
 Thu, 31 Oct 2019 16:40:15 -0700 (PDT)
Received: from [10.1.1.7] ([86.86.15.212])
 by smtp.gmail.com with ESMTPSA id t134sm6021949wmt.24.2019.10.31.16.40.14
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Oct 2019 16:40:15 -0700 (PDT)
Date: Fri, 01 Nov 2019 00:40:14 +0100
From: Arjen Runsink <arjenrr@gmail.com>
Subject: remove an unnecessary call to unset_dns
To: wireguard@lists.zx2c4.com
Message-Id: <1572565214.3.2@gmail.com>
X-Mailer: geary/3.34.1
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 27 Nov 2019 10:04:23 +0100
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

The below patch removes an unnecessary call to unset_dns. It is already 
called in del_if and causes an error message since the interface does 
not exist anymore when called here.
Regards, Arjen


diff --git a/src/tools/wg-quick/linux.bash 
b/src/tools/wg-quick/linux.bash
index e690944..d2c7753 100755
--- a/src/tools/wg-quick/linux.bash
+++ b/src/tools/wg-quick/linux.bash
@@ -300,7 +300,6 @@ cmd_down() {
    execute_hooks "${PRE_DOWN[@]}"
    [[ $SAVE_CONFIG -eq 0 ]] || save_config
    del_if
- unset_dns
    execute_hooks "${POST_DOWN[@]}"
 }




_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
