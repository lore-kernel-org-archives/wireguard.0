Return-Path: <SRS0=gmne=R2=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9233CC43381
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 23 Mar 2019 11:15:23 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C8369218E2
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 23 Mar 2019 11:15:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C8369218E2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nordberg.se
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4293d436;
	Sat, 23 Mar 2019 11:14:25 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 29e9f6bb
 for <wireguard@lists.zx2c4.com>;
 Sat, 23 Mar 2019 11:14:22 +0000 (UTC)
Received: from blaine.gmane.org (195.159.176.226 [195.159.176.226])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4a759d28
 for <wireguard@lists.zx2c4.com>;
 Sat, 23 Mar 2019 11:14:22 +0000 (UTC)
Received: from list by blaine.gmane.org with local (Exim 4.89)
 (envelope-from <gnw-wireguard@m.gmane.org>) id 1h7ec9-000IwE-EF
 for wireguard@lists.zx2c4.com; Sat, 23 Mar 2019 12:15:01 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: wireguard@lists.zx2c4.com
From: Linus Nordberg <linus@nordberg.se>
Subject: Re: Dealing with large number of IPv4 clients
Date: Sat, 23 Mar 2019 11:56:09 +0100
Message-ID: <877ecprh9y.fsf@nordberg.se>
References: <1RaAYaEHv_QRKUXdQO3U-bVTh2ZRb_kfhN62pX42RFyL_Jq_Y0Shl1V2t8s665ddlQpXQ80NBzQ4Bi5CUql18GkiZbunLbtDX1qz6yZbWkw=@protonmail.com>
Mime-Version: 1.0
User-Agent: Gnus/5.13 (Gnus v5.13)
Cancel-Lock: sha1:QKtgWXbKMB6LUJmBUDB1VPDUT2c=
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

David Weinberger <cubicalpie@protonmail.com> wrote
Thu, 21 Mar 2019 12:35:05 +0000:

> What's the proper way to deal with large number of IPv4 clients?
>
> (We're aware of the wg-dynamic project, but it seems it's IPv6 only.)

wg-dynamic will support dynamic IP address allocation for both IPv4 and
IPv6.

It will use a link local IPv6 address for communications between client
and server daemons. Maybe this can explain the misconception that it
would be handling IPv6 addresses only?

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
