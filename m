Return-Path: <SRS0=6kAx=MR=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=0.6 required=3.0 tests=DKIM_ADSP_ALL,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D281BC00449
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  5 Oct 2018 10:03:11 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C88D120875
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  5 Oct 2018 10:03:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=toke.dk header.i=@toke.dk header.b="orrYqoEV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C88D120875
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=toke.dk
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9031f345;
	Fri, 5 Oct 2018 10:02:45 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 63c99880
 for <wireguard@lists.zx2c4.com>; Fri, 5 Oct 2018 10:02:42 +0000 (UTC)
Received: from mail.toke.dk (mail.toke.dk [52.28.52.200])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 322bd3fa
 for <wireguard@lists.zx2c4.com>; Fri, 5 Oct 2018 10:02:42 +0000 (UTC)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=toke.dk; s=20161023;
 t=1538733784; bh=a09LPF9adMcRlqdk4hUV1DIE5ULIkA2bVK0vkBXQRf4=;
 h=From:To:Subject:In-Reply-To:References:Date:From;
 b=orrYqoEV4tcUgez9lBgnoT5HxSgJFlU7fimSli1ceKMwx0SLIH9LQfFTn0B9s/aVg
 lCwzEb4sOiLctd5af85AtsdqWdMHJwMSWFXA1e8ej7osBK/crLRRmgZfkan4Cpxv0p
 uN3qvJxGRwcZfR7Vpk+AYv9EKdmSOSPKYiF8dL7hxIrWqIPMMwYGfqmaefE8oQeO3/
 lXAU1C0RF/hgrjDtwVUAMs35yoUSXkJPyUeVChlzOGvGW/3LI43pSTjO32jF1G2uPD
 /0SGGSod/s+/Pc5TkIxGHPn0POi9Xd14TxjT3cXvGXI+8lW1eu0V923LdcdN6DY6oJ
 DjF3MEewn/xmA==
To: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: Sending just ssh traffic via wg
In-Reply-To: <CAHmME9rt2irKq1JFkkWdNLKFTJapCKopkUCpnyXugN=dUWqW=A@mail.gmail.com>
References: <20181004155359.GA5957@puremoods>
 <CAHmME9rt2irKq1JFkkWdNLKFTJapCKopkUCpnyXugN=dUWqW=A@mail.gmail.com>
Date: Fri, 05 Oct 2018 12:03:04 +0200
X-Clacks-Overhead: GNU Terry Pratchett
Message-ID: <874le0d82v.fsf@toke.dk>
MIME-Version: 1.0
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

"Jason A. Donenfeld" <Jason@zx2c4.com> writes:

> Hey Konstantin,
>
> When you're doing policy routing with packets that are being forwarded
> by the system -- a router, for example -- then the prerouting table is
> sufficient. But for locally generated packets, you have to use the
> OUTPUT table and also probably MASQUERADE. I just reproduced
> everything here and confirm this works:
>
> ip route add default dev wg0 table 2468
> ip rule add fwmark 1234 table 2468
> wg set wg0 peer [...] allowed-ips 0.0.0.0/0
> sysctl net.ipv4.conf.wg0.rp_filter=0
> iptables -t nat -A POSTROUTING -p tcp --dport 22 -m addrtype
> --src-type LOCAL -j MASQUERADE
> iptables -t mangle -A OUTPUT -p tcp --dport 22 -j MARK --set-mark 1234

Any reason why you can't just do

ip rule add dport 22 lookup 2468

?

-Toke
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
