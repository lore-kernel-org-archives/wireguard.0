Return-Path: <SRS0=tKTr=RX=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED,URIBL_SBL,URIBL_SBL_A autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66B9AC43381
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 20 Mar 2019 22:37:09 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CEF8B20830
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 20 Mar 2019 22:37:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CEF8B20830
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=romanrm.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 951a3821;
	Wed, 20 Mar 2019 22:36:20 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2ecf2594
 for <wireguard@lists.zx2c4.com>;
 Wed, 20 Mar 2019 22:36:18 +0000 (UTC)
Received: from len.romanrm.net (len.romanrm.net [91.121.75.85])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6d4f8dbd
 for <wireguard@lists.zx2c4.com>;
 Wed, 20 Mar 2019 22:36:18 +0000 (UTC)
Received: from natsu (unknown [IPv6:fd39::e99e:8f1b:cfc9:ccb8])
 by len.romanrm.net (Postfix) with SMTP id 1EE7F202E5;
 Wed, 20 Mar 2019 22:36:38 +0000 (UTC)
Date: Thu, 21 Mar 2019 03:36:38 +0500
From: Roman Mamedov <rm@romanrm.net>
To: XRP <xrp@airmail.cc>
Subject: Re: Wireguard fails to start when adding IPv6 to AllowedIP
Message-ID: <20190321033638.1ff82682@natsu>
In-Reply-To: <196a105a94a39c3a2e23338880d647f5825dd97a.camel@airmail.cc>
References: <196a105a94a39c3a2e23338880d647f5825dd97a.camel@airmail.cc>
MIME-Version: 1.0
Cc: wireguard@lists.zx2c4.com
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

On Sun, 03 Mar 2019 08:56:12 +0100
XRP <xrp@airmail.cc> wrote:

> [#] ip link set mtu 1200 up dev wg1
> [#] ip route add fdb8:a70c:b109:9935::/64 dev wg1
> RTNETLINK answers: No such device

IPv6 cannot work with MTU less than 1280 on the device.

-- 
With respect,
Roman
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
