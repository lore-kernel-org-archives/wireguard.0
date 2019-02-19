Return-Path: <SRS0=i+YM=Q4=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DA08C43381
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 21 Feb 2019 07:13:04 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 71BCA20675
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 21 Feb 2019 07:13:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 71BCA20675
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=boxdan.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a4813e58;
	Thu, 21 Feb 2019 07:04:00 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9bc72c20
 for <wireguard@lists.zx2c4.com>;
 Tue, 19 Feb 2019 13:29:17 +0000 (UTC)
Received: from mxout012.mail.hostpoint.ch (mxout012.mail.hostpoint.ch
 [IPv6:2a00:d70:0:e::312])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ae3a4880
 for <wireguard@lists.zx2c4.com>;
 Tue, 19 Feb 2019 13:29:17 +0000 (UTC)
Received: from [10.0.2.46] (helo=asmtp013.mail.hostpoint.ch)
 by mxout012.mail.hostpoint.ch with esmtp (Exim 4.91 (FreeBSD))
 (envelope-from <seclists@boxdan.com>)
 id 1gw5al-000G1C-RQ; Tue, 19 Feb 2019 14:37:47 +0100
Received: from exit1.ipredator.se ([197.231.221.211] helo=localhost)
 by asmtp013.mail.hostpoint.ch with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.91 (FreeBSD))
 (envelope-from <seclists@boxdan.com>)
 id 1gw5al-0000we-4p; Tue, 19 Feb 2019 14:37:47 +0100
X-Authenticated-Sender-Id: seclists@boxdan.com
Date: Tue, 19 Feb 2019 20:37:49 +0700
From: Frank Beuth <seclists@boxdan.com>
To: Fredrik =?utf-8?Q?Str=C3=B6mberg?= <stromberg@mullvad.net>
Subject: Re: Rohde & Schwarz Adds Emerging WireGuard VPN Protocol to its Deep
 Packet Inspection (DPI) Software Library, R&S(R) PACE 2
Message-ID: <20190219133749.cjcisv6g2kmwg3li@web.local>
References: <168C4A39-3DFB-4AD8-839B-BA7C4D8D8F40@gmail.com>
 <CANTUoecQ71BaE-38-qk4CQRXPRTabEEedmsybQb==Y9jaa6epg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CANTUoecQ71BaE-38-qk4CQRXPRTabEEedmsybQb==Y9jaa6epg@mail.gmail.com>
X-Mailman-Approved-At: Thu, 21 Feb 2019 08:03:58 +0100
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
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
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

On Thu, Jan 24, 2019 at 12:01:54PM +0100, Fredrik Str=F6mberg wrote:
>It will however be a problem for those blocked by this equipment. Like
>all technology, this DPI equipment is a double-edged sword. Will it be
>sold to a government so they can block privacy-seeking dissidents from
>using WireGuard, or will it be sold to an organization that has a more
>legitimate need to block WireGuard traffic?
>
>The solution is to use an obfuscation protocol that encapsulates
>WireGuard, just like Tor users in censored countries do.

Are there any WireGuard-compatible obfuscation protocols that could be =

considered production ready for use with WireGuard?
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
