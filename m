Return-Path: <SRS0=0s16=S3=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08FCBC43218
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 25 Apr 2019 19:16:23 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A4BBC206BA
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 25 Apr 2019 19:16:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="IInc3NKc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A4BBC206BA
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5dfeb069;
	Thu, 25 Apr 2019 19:16:04 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7ccd309e
 for <wireguard@lists.zx2c4.com>;
 Thu, 25 Apr 2019 19:16:02 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 723892f3
 for <wireguard@lists.zx2c4.com>;
 Thu, 25 Apr 2019 19:16:02 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ea9ab9d8
 for <wireguard@lists.zx2c4.com>;
 Thu, 25 Apr 2019 18:49:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type:content-transfer-encoding; s=mail; bh=Ne2aHS23wxeI
 bLlOQ+sDPBg9Nlk=; b=IInc3NKcoFhZ1JuYGVPlqW9s1hdgzNOWNIlJ5CwCoUH0
 iXs3CNIFfbPjvCsCtOkbE6WGl8qP6DX56RQVkZMFjOz+bxSQHz5GNgjc8i4UfpDq
 95p9e3OXNZwqbqhDgQj42jTZTbzhCjfeWBiFNKAXWf6rQpqAmHCG/huVgl6/Cbfr
 cx7+7Pf8JAUjJZY2vzOnW+sARSJaG/zla0jgj73CsOG9+3qdHO1dN6KQdpIejG52
 t9idnrv2NVDDNhOBpPAfGXRv6dTADKIAm75XIJv27n/2M14F86z1PDC5awkMYpeL
 izfge+kVBUyv7tZocaFSind/b88JqRiHFh0qHBuqjQ==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id d3308fd3
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 25 Apr 2019 18:49:53 +0000 (UTC)
Received: by mail-ot1-f46.google.com with SMTP id u17so553558otj.1
 for <wireguard@lists.zx2c4.com>; Thu, 25 Apr 2019 12:16:01 -0700 (PDT)
X-Gm-Message-State: APjAAAW62IbnKWJRS7b29+JcQibsBeUcqRysEp1Rbmu7DsHdvQMt9Ag/
 +1skmllKT1P0NPCRuo4tQ7IYUUXLanDuJ1eufic=
X-Google-Smtp-Source: APXvYqwEKXLjvNf73tXWCn4fE15N1ZBemmNWJYpM7tGCaX9VIVYPMvS5krwWO10UDpEZ32rPbEgxlDSOsSS8b+phpeQ=
X-Received: by 2002:a9d:7d0e:: with SMTP id v14mr25773387otn.225.1556219760383; 
 Thu, 25 Apr 2019 12:16:00 -0700 (PDT)
MIME-Version: 1.0
References: <CAHwDNp2KzB7ivO7Y770kRgq60SPsxOjVhVdGtbEVjz0jsy23jg@mail.gmail.com>
 <CAHwDNp3k2pDb-x-Q4yJgHwsJGwVZ3YsO9Y18rhM1FOzGDh+Q-g@mail.gmail.com>
In-Reply-To: <CAHwDNp3k2pDb-x-Q4yJgHwsJGwVZ3YsO9Y18rhM1FOzGDh+Q-g@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 25 Apr 2019 21:15:49 +0200
X-Gmail-Original-Message-ID: <CAHmME9qWzM=qWMKSgD2_SwkiHUj4VubPDjyKyDYmSVa2=rjmKQ@mail.gmail.com>
Message-ID: <CAHmME9qWzM=qWMKSgD2_SwkiHUj4VubPDjyKyDYmSVa2=rjmKQ@mail.gmail.com>
Subject: Re: Table=off behavior (not adding any route *at all*)
To: Alex Davies <alex@davz.net>, Bernhard Froehlich <decke@freebsd.org>
Cc: Alex Davies <adavies@jumptrading.com>, ad@opnsense.org,
 WireGuard mailing list <wireguard@lists.zx2c4.com>,
 Simon Stace <sstace@jumptrading.com>
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

Hi Alex,

On Thu, Apr 25, 2019 at 2:01 PM Alex Davies <alex@davz.net> wrote:
>
> Hi,
>
> We have been trying to use WireGuard on FreeBSD (we are using the WG plugin inside the open source opnsense.org software). These run FreeBSD 11.2-RELEASE-p9-HBSD (OPNsense 19.7.a_288-amd64).
>
> We noticed that by default (i.e. no Table=) wireguard-go wg0 adds default routes (as two /31's) as expected. However, if table=off, we get no route at all - not even to the VPN peer.
>
> The announcement for the Table= option[1] stated:
>
>   In collaboration with Luis Ressel, wg-quick(8) grew an option! We generally
>   do not like to add things to wg-quick or allow feature-creep, but this was
>   basic enough and mostly involves disabling functionality. Specifically,
>   wg-quick now accepts a Table= parameter with these semantics:
>
>     ~ Table=auto (default) selects the current behaviour
>     ~ Table=off disables creation of routes from allowed ips altogether
>     ~ All other values are passed through to "ip route add"'s table option
>
>   This should enable people to do basic policy routing. It also matches the
>   functionality provided by LEDE/OpenWRT's uci config as well as NixOS's
>   networking configuration.
>
> Ignoring the "creation of routes from allowed ips", it does not even add the subnet defined in [Interface]. netstat -r | grep wg returns nothing.
>
> As a concrete example, if I take the trivial config at https://wiki.archlinux.org/index.php/WireGuard:
>
> [Interface]
> Address = 10.200.200.2/24
> PrivateKey = [FOO's PRIVATE KEY]
> DNS = 10.200.200.1
>
> [Peer]
> PublicKey = [SERVER PUBLICKEY]
> PresharedKey = [PRE-SHARED KEY]
> AllowedIPs = 0.0.0.0/0, ::/0
> Endpoint = my.ddns.address.com:51820
>
> I would (naively) expect this:
> Table=auto: inject route for 10.200.200.2/24 *and* 0.0.0.0/0 via wg0
> Table=off: inject route for 10.200.200.2/24 *only* via wg0
>
> What actually happens is:
> Table=auto: as above/expected
> Table=off: no route out wg0
>
> This mean with Table=off, you are in the extremely confusing situation that you cant even ping the other peer.
>
> Testing on Linux (Kernel 4.15.0-1032-aws inside a 18.04 AMI (public AMI - ami-07dc734dc14746eab)) shows that the behavior is different - its as I expect for both Table values. With this wg0.conf:
>
> root@ip-172-31-39-185:~# cat /etc/wireguard/wg0.conf
> [Interface]
> Address = 192.168.2.1/24
> PrivateKey = eEIwdXp8jKV9/2MEwxYBqQLu4TZqBv9YWvG9fbMuaG4=
> Table = off
>
> [Peer]
> PublicKey = pHQfWzLAUM85vDO6+MZAneBYhapOHUkPAuxr0lJdZlY=
> AllowedIPs = 0.0.0.0/0
> Endpoint = 18.130.138.71:51820
>
> I get this route:
>
> root@ip-172-31-39-185:~# ip route show | grep wg0
> 192.168.2.0/24 dev wg0 proto kernel scope link src 192.168.2.1
>
> Note the /24 route (as expected). With Table undefined or set to auto, I get the 0.0.0.0 route (also as expected).
>
> I dont know much about FreeBSD, but I launched a test EC2 instance (FreeBSD 12.0-RELEASE based on public ami-0d244633039d93966 with kernel reported as 12.0-RELEASE-p3) and I think I see the same thing (i.e. no /24 route):
>
> root@freebsd:/etc/wireguard # netstat -rn | grep wg0
> 192.168.2.5        link#3             UH          wg0
> fe80::%wg0/64                     link#3                        U           wg0
> fe80::1427:e888:767c:dce1%wg0     link#3                        UHS         lo0
> root@freebsd:/etc/wireguard # ping 192.168.2.5
>
> Somebody more expert than me can comment on whether this is expected or not. At the very least, hopefully this post is useful for somebody else.  For our specific problem, we have fixed this by putting a static route in for the "Address" subnet across wg0.
>
> -Alex
>
> [1] https://lists.zx2c4.com/pipermail/wireguard/2017-December/002231.html

Sounds like a FreeBSD bug. I've CC'd the maintainer there. We're
adding the IP address with the subnet, via:

ifconfig "$INTERFACE" inet "$1" "${1%%/*}" alias

In your case, this expands to something like,

ifconfig wg0 inet 192.168.2.5/24 192.168.2.5 alias

Bernard - is there a FreeBSD reason why this wouldn't add the
automatic subnet route? Also, rather than using ${1%%/*}, is there a
way for us to just specify the interface directly?

Jason
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
