Return-Path: <SRS0=2DBL=OO=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE2A3C04EB9
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  5 Dec 2018 13:59:46 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 039EF2084C
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  5 Dec 2018 13:59:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 039EF2084C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lonnie.abelbeck.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 332e554f;
	Wed, 5 Dec 2018 13:51:41 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c1c2a04a
 for <wireguard@lists.zx2c4.com>; Wed, 5 Dec 2018 13:51:38 +0000 (UTC)
Received: from ibughas.pair.com (ibughas.pair.com [209.68.5.177])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 61ec009e
 for <wireguard@lists.zx2c4.com>; Wed, 5 Dec 2018 13:51:38 +0000 (UTC)
Received: from ibughas.pair.com (localhost [127.0.0.1])
 by ibughas.pair.com (Postfix) with ESMTP id 8061B1E301B;
 Wed,  5 Dec 2018 08:59:40 -0500 (EST)
Received: from macpro.priv.abelbeck.com (wsip-174-76-218-225.om.om.cox.net
 [174.76.218.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ibughas.pair.com (Postfix) with ESMTPSA id 471731E3011;
 Wed,  5 Dec 2018 08:59:40 -0500 (EST)
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.1\))
Subject: Re: sysctl of Alpine standard 3.8.1 doesn't support option -r.
From: Lonnie Abelbeck <lists@lonnie.abelbeck.com>
In-Reply-To: <CAMbARA6yEQvHEL+X-1+pfOPePu_1ULLLZdr81wC7SW65j=ep+w@mail.gmail.com>
Date: Wed, 5 Dec 2018 07:59:39 -0600
Message-Id: <F1235903-2773-425E-97B1-45D981E4751E@lonnie.abelbeck.com>
References: <CAMbARA6yEQvHEL+X-1+pfOPePu_1ULLLZdr81wC7SW65j=ep+w@mail.gmail.com>
To: Du Felix <boost.subscribing@gmail.com>
X-Mailer: Apple Mail (2.3445.9.1)
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


> On Dec 3, 2018, at 1:28 AM, Du Felix <boost.subscribing@gmail.com> wrote:
> 
> I use alpine standard 3.8.1, which has kernel 4.14.82-0-vanilla.
> When I start wireguard as client peer with wg-quick up client, It says:
>  
> [#] ip link add client type wireguard
> [#] wg setconf client /dev/fd/63
> [#] ip address add 10.0.0.4/24 dev client
> [#] ip link set mtu 1420 dev client
> [#] ip link set client up
> [#] resolvconf -a client -m 0 -x
> [#] wg set client fwmark 51820
> [#] ip -4 route add 0.0.0.0/0 dev client table 51820
> [#] ip -4 rule add not fwmark 51820 table 51820
> [#] ip -4 rule add table main suppress_prefixlength 0
> sysctl: unrecognized option: r
> BusyBox v1.29.3 (2018-11-21 11:45:56 UTC) multi-call binary.
> 
> Usage: sysctl -p [-enq] [FILE...] / [-enqaw] [KEY[=VALUE]]...
> 
> Show/set kernel parameters
> 
>     -p    Set values from FILEs (default /etc/sysctl.conf)
>     -e    Don't warn about unknown keys
>     -n    Don't show key names
>     -q      Quiet
>     -a    Show all values
>     -w    Set values

In your "wg-quick" script, try changing the line:
-- from --
done < <(sysctl -a -r '^net\.ipv4.conf\.[^ .=]+\.rp_filter$')
-- to --
done < <(sysctl -a 2>/dev/null | sed -n -r 's#^(net\.ipv4.conf\.[^ .=]+\.rp_filter).*$#\1#p')
--

Lonnie



_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
