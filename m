Return-Path: <SRS0=QHSY=WV=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDAE6C3A5A1
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 25 Aug 2019 18:51:30 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8462A206BA
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 25 Aug 2019 18:51:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JQ1tiBaP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8462A206BA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 86f1f1b8;
	Sun, 25 Aug 2019 18:51:29 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 73706727
 for <wireguard@lists.zx2c4.com>;
 Sun, 25 Aug 2019 16:59:29 +0000 (UTC)
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 11dfbe39
 for <wireguard@lists.zx2c4.com>;
 Sun, 25 Aug 2019 16:59:29 +0000 (UTC)
Received: by mail-io1-xd2c.google.com with SMTP id q22so31716114iog.4
 for <wireguard@lists.zx2c4.com>; Sun, 25 Aug 2019 09:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=XPiEuOVS5Jbl/6NlL8+h+1mEb6WRcE4HgoWN1je4nWA=;
 b=JQ1tiBaPW5A5U/NNmrd/G8BjgIcyLWd7Ich/EDfNRw4Z7nXPW4cP72uRRHiMQ1qf2I
 JltZp3STd7FiymiVn6/VxB2gQfeZrSHx/e1FRIddssSU4mieWG9cDaiN+ykSiKVTrfDB
 mztgJrTxRVyW5+3zjbs+unGpUeUG9HXbrU8h906szVGXDItE/5aIC1c7RfP/nr4ut2i6
 12+t0UNKgBI09ZkDTTF8xP480Du3AM0n4UmOrcMfiIzv1LgMOHFe/TB07eoSviRk4TdB
 NKtogug/spo73dWzIlAZ0ycwLSFCJ9FG4jCBTlu0VSJC+8ZGUqcUlODtiABHUMWobrKf
 H4dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=XPiEuOVS5Jbl/6NlL8+h+1mEb6WRcE4HgoWN1je4nWA=;
 b=ZguVe1LXyt6Zl1kEOCKyLkbbrwvmAKk7iXD81UCCd4/DzTdU6ImIh+VkpO2hTzTqV/
 FUXXS5Yx8b/ogZErhsNcLWGadP8u55AwhidShvkMgceK+VUl9oVqhJeFQxGT89C6lJcY
 6RIkmg2+xx+3i65CyEg7g3DN3VBseDyHfJr/DZIIG+9JtgbGBnliVijqEZ47RL6kc+MG
 ri/9djNIfWfq0baqhwqyglfdSLyFMzxU3QUj5K6VaqSHE6aVxED/pnoOG6kVWRMfg88T
 LFBBrLbiAz9x07Y0P0WcxEnp/phiMu3xgDC8YAJ27y32jCOAizRJ1oQ+wOy4OvECDXvN
 V3vw==
X-Gm-Message-State: APjAAAXxcMROogiZSXhIrxKkKBiZusOpGbMrPIOIsBMSWVP0IzBsxZOg
 dz/Mkw1pcD/vCtUS/x4V0e5/XxLg/yaC2JeNl3GMGZeh5a8=
X-Google-Smtp-Source: APXvYqzSv/m+qQ2ixRhvXkBsxSqZSi5ffiQWkpENWWSy3Cy9Z0bNuxRf33ewlhqx2LUH7jJcPTdDl82fwA/pwrJQWUQ=
X-Received: by 2002:a6b:3b57:: with SMTP id i84mr20176652ioa.145.1566752369057; 
 Sun, 25 Aug 2019 09:59:29 -0700 (PDT)
MIME-Version: 1.0
From: Vasili Pupkin <diggest@gmail.com>
Date: Sun, 25 Aug 2019 19:59:32 +0300
Message-ID: <CANH_QeanVTjMG1gsps0Boj2vOUBCQqReH+u84su1--_t-QyiJA@mail.gmail.com>
Subject: Linux kernel 5 different behavior
To: wireguard@lists.zx2c4.com
X-Mailman-Approved-At: Sun, 25 Aug 2019 20:51:28 +0200
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

In the newest kernel version, Wireguard encrypted packets are sent
from the same user credentials as the user that created original
packets. I have a firewall setup that limits programs run from a
particular user to wireguard tun interface, it worked in kernel 4.18
and is broken in kernel 5.0. In the new kernel encrypted packets are
also marked as owned by this user and routed to the tun interface
generating a recursion.
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
