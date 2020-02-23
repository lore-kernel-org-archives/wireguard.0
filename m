Return-Path: <SRS0=ZSUP=4L=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A92E3C35671
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 23 Feb 2020 14:52:46 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E67CE20637
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 23 Feb 2020 14:52:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E67CE20637
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=romanrm.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3ea437f4;
	Sun, 23 Feb 2020 14:49:12 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ea00a133
 for <wireguard@lists.zx2c4.com>;
 Sun, 23 Feb 2020 14:49:10 +0000 (UTC)
Received: from len.romanrm.net (len.romanrm.net [IPv6:2001:41d0:1:8b3b::1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8368c1b5
 for <wireguard@lists.zx2c4.com>;
 Sun, 23 Feb 2020 14:49:10 +0000 (UTC)
Received: from natsu (natsu.40.romanrm.net
 [IPv6:fd39:aa:c499:6515:e99e:8f1b:cfc9:ccb8])
 by len.romanrm.net (Postfix) with SMTP id 011A041E0E;
 Sun, 23 Feb 2020 14:52:24 +0000 (UTC)
Date: Sun, 23 Feb 2020 19:52:25 +0500
From: Roman Mamedov <rm@romanrm.net>
To: Neal Becker <ndbecker2@gmail.com>
Subject: Re: wireguard slow pings
Message-ID: <20200223195225.6210b37f@natsu>
In-Reply-To: <CAG3t+pEeJ_+AUUoA3NvpKPhtp_-G78DJTS3PGZyRHigMCSHyww@mail.gmail.com>
References: <CAG3t+pEeJ_+AUUoA3NvpKPhtp_-G78DJTS3PGZyRHigMCSHyww@mail.gmail.com>
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

On Sun, 16 Feb 2020 07:58:48 -0500
Neal Becker <ndbecker2@gmail.com> wrote:

> I'm testing wireguard
> wireguard-0.0.20191219-2.fc31.x86_64
> between a Fedora 31 client and server, comparing to openvpn.
> 
> Openvpn is running between a linux client outside my lan and a server on my
> router, which is running dd-wrt.
> I'm pinging between that linux client and another linux client within my
> lan.
> 
> wireguard is running between the same linux client outside my lan and the
> same other linux client within my lan.  This
> time router is simply forwarding packets via NAT.
> 
> Openvpn ping times are much lower (about 10ms) and much lower variance than
> wireguard.  Wireguard pings
> are all over the place.
> 
> Packets coming in from the WAN are traversing some firewall that I don't
> control, which may be affecting results.  Openvpn
> is config to use udp.
>
> Any ideas?

Did you try using the same port for WG, as you use for OpenVPN (of course
stopping OpenVPN for a while to try that)?

It is possible that ISPs employ different priorities for particular UDP port
ranges;

Or they might do load-balancing across multiple links by src/dst/port/protocol,
and your WG's combination of that randomly happens to go via some unlucky
overloaded one.

-- 
With respect,
Roman
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
