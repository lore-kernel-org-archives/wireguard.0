Return-Path: <SRS0=ej+U=UJ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67FD5C282DD
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 10 Jun 2019 12:34:37 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7046520679
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 10 Jun 2019 12:34:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (4096-bit key) header.d=bartschnet.de header.i=@bartschnet.de header.b="eZigR6uD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7046520679
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=bartschnet.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c935a8f6;
	Mon, 10 Jun 2019 12:34:34 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2a3a0147
 for <wireguard@lists.zx2c4.com>;
 Mon, 10 Jun 2019 12:34:32 +0000 (UTC)
Received: from mail.core-networks.de (mail.core-networks.de
 [IPv6:2001:1bc0:d::4:9])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 370418b1
 for <wireguard@lists.zx2c4.com>;
 Mon, 10 Jun 2019 12:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=bartschnet.de; s=2018030201; h=Content-Transfer-Encoding:MIME-Version:Date:
 Message-ID:From:To:Subject:content-disposition;
 bh=ZeICkrO7T9KE7EeXML5y/1c2bBsgXB13ALuf6+H75po=; b=eZigR6uDLRxyb+mKxM7Ka0NPhn
 wSCYPBa+Spo6e2ui/tfQVikcUE2BzsCRUKVwq9msfRaB/03VUpih6kZ8OcauHN9IacZbrrEikEncA
 lB8Xx6Xi1wfb1PsWDibUA7ecuJxcJmS9f+eg0VkiSGOWVMt4i/2wrUPAfUtZMc4ZBokAEYUiXA9Vf
 gNUJ6uI4CyM5Di7Jn57N7g7CULUCXlPt1cg6SQiV6/ijTLz61JKlITmoTWq75WIA27v8ojPDdAs06
 CXgYKVmowqXoX91QXV5SC/u2xU4ZRl6iW3JaY+3Uu4oGnBvVtlqV1t67kxuYE7r74b4421jh++c/O
 O5n4yEe14mwQJij+UD3I5/+OmbbwPrRUmougFpVAwbKBrxYQ8H6+d7gJb4d5E4dVUMg8FF3G3Btys
 cY5YXpsnvkOZyNo21Ad6HAc8Xy0jhIqLJrvMMMLIVQ241B6oKMKx5gwknjNm8571TFTLwcXOaCsk3
 doCDNp4Wz/Aixm51SdF8SvbJpTDKxTc8Y/hy0v0thCoQWzCVWer4M2yafppeoh/oN7IE2sJxmorBz
 MS+TlKnd+n9qm0Oc1sdafpEfhkwT6TxLVnLvbjv0KEjEaZ5Emckdc4JnM1zEcyVXgLyimm63U6qvv
 9uFY6Gk2NxX/es+shQ9q/0eVjnPRDUMRz329OPwAs=;
Received: from localhost (localhost [127.0.0.1])
 by mail.core-networks.de id 1haJVM-00079Q-Bl
 with ESMTPSA (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 for wireguard@lists.zx2c4.com; Mon, 10 Jun 2019 14:34:30 +0200
Subject: Re: RFC: wg syncpeers wg0 wireguard.conf
To: wireguard@lists.zx2c4.com
References: <6BFBD58C-ACC2-45FD-9986-63CEA1143BA6@lonnie.abelbeck.com>
From: "Rene 'Renne' Bartsch, B.Sc. Informatics" <ml@bartschnet.de>
Message-ID: <d8972aae-0ac5-7386-ddfe-ff0d899a107c@bartschnet.de>
Date: Mon, 10 Jun 2019 14:34:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <6BFBD58C-ACC2-45FD-9986-63CEA1143BA6@lonnie.abelbeck.com>
Content-Language: de-DE
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

Hi Lonnie,

I agree. If a peer could push updated information of a remote peer (e.g. ip address, port) to all other peers it would be great, too.

Regards,

Renne


Am 09.06.19 um 21:59 schrieb Lonnie Abelbeck:
> Hi List, Request For Comments:
> 
> I would find it useful if "wg" would support a "syncpeers" subcommand.
> --
> Usage: wg syncpeers <interface> <configuration filename>
> --
> Available subcommands:
>    syncpeers: Synchronizes a configuration file of peers to a WireGuard interface
> --
> 
> Given:
> - A user creates a wireguard.conf file.
> 
> - Uses "wg setconf wg0 wireguard.conf" to apply the configuration.
> 
> Request:
> - Later, a user edits a wireguard.conf file: adds peers, deletes peers, and/or edits peers.
> 
> - Use "wg syncpeers wg0 wireguard.conf" to synchronize the configuration file of peers with the current state.
> 
> - Synchronize changes with minimal impact, determine peer differences and leave unchanged settings alone.
> 
> - Basically internally using "wg set wg0 ..." to make the minimum changes.
> 
> - If the [Peer] Endpoint is a DNS hostname, the Endpoint will be resolved and IP updated.
> 
> Note: Interestingly, "wg setconf wg0 wireguard.conf" *almost* performs as requested except for a 17 second interruption of the tunnel *if* PersistentKeepalive is 0.  Even if PersistentKeepalive is 3600, a "wg setconf wg0 wireguard.conf" will not effect an active tunnel except for resetting traffic counters.
> 
> I understand a script could be created to perform this as well, but adding it to "wg" lowers the hurdle for many users.
> 
> If the 17 second interruption of active tunnels while using "wg setconf wg0 wireguard.conf" could be eliminated, this request may be moot.
> 
> Comments please.
> 
> Lonnie
> 
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
> 
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
