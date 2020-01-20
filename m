Return-Path: <SRS0=RHSj=33=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C099C3F68F
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  7 Feb 2020 11:21:53 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3707820726
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  7 Feb 2020 11:21:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3707820726
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=lists.m7n.se
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7c49338f;
	Fri, 7 Feb 2020 11:20:41 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 88168462
 for <wireguard@lists.zx2c4.com>;
 Mon, 20 Jan 2020 07:19:03 +0000 (UTC)
Received: from bond.m7n.se (bond.m7n.se [IPv6:2a00:1a28:1251:46:246:28:121:1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8f9de9eb
 for <wireguard@lists.zx2c4.com>;
 Mon, 20 Jan 2020 07:19:03 +0000 (UTC)
Received: from [IPv6:2001:470:de17:1200:ec9f:87b4:6502:b4f6] (unknown
 [IPv6:2001:470:de17:1200:ec9f:87b4:6502:b4f6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by bond.m7n.se (Postfix) with ESMTPSA id 15F30600A1D7;
 Mon, 20 Jan 2020 07:19:00 +0000 (UTC)
Date: Mon, 20 Jan 2020 08:18:57 +0100
User-Agent: K-9 Mail for Android
In-Reply-To: <87iml7fsyn.fsf@ungleich.ch>
References: <87iml7fsyn.fsf@ungleich.ch>
MIME-Version: 1.0
Subject: Re: Trying to fix the address family problem
To: wireguard@lists.zx2c4.com, Nico Schottelius <nico.schottelius@ungleich.ch>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
From: Mikma <mikma.wg@lists.m7n.se>
Message-ID: <26602915-6F2A-47C2-9AEF-5B1384662878@lists.m7n.se>
X-Mailman-Approved-At: Fri, 07 Feb 2020 12:20:37 +0100
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



On 19 January 2020 14:58:56 CET, Nico Schottelius <nico.schottelius@ungleich.ch> wrote:

>I wanted to write a script that checks "which address family of my
>endpoint is reachable" and use wg set to update the configuration.
>
>However, it seems it is not as easy as that: inside the tunnel I am
>always using IPv6 networks and if wireguard is active with the IPv4
>family endpoint, but when I am in an IPv6 only network, I cannot reach
>the Internet due to the default rule of wg-quick:
>
>[#] ip -6 route add ::/0 dev wgungleich table 51820
>[#] ip -6 rule add not fwmark 51820 table 51820

>ping -c3 $v6_addr >/dev/null && v6_ok=yes
>ping -c3 $v4_addr >/dev/null && v4_ok=yes

It seems App-Route-Jail should be useful. Try

MARK=51820 LD_PRELOAD=./mark.so ping...

https://github.com/Intika-Linux-Firewall/App-Route-Jail/blob/master/README.md
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
