Return-Path: <SRS0=QHSY=WV=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84AB0C3A5A5
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 25 Aug 2019 15:51:08 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 29DE32080C
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 25 Aug 2019 15:51:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="uxdFIU8m"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 29DE32080C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 662331ce;
	Sun, 25 Aug 2019 15:40:25 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2d12bd18
 for <wireguard@lists.zx2c4.com>;
 Mon, 12 Aug 2019 10:09:00 +0000 (UTC)
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [IPv6:2607:f8b0:4864:20::32b])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d93628aa
 for <wireguard@lists.zx2c4.com>;
 Mon, 12 Aug 2019 10:09:00 +0000 (UTC)
Received: by mail-ot1-x32b.google.com with SMTP id f17so21333304otq.4
 for <wireguard@lists.zx2c4.com>; Mon, 12 Aug 2019 03:08:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:reply-to:from:date:message-id:subject:to;
 bh=5r/XcNkEmDQrm3A1xZDN6DoRTNAdveHfUIHZJPy9BtE=;
 b=uxdFIU8miunb8f3uDn+hgF08TkS8Ojz4KE12v2pVcf+fTKkKYon8q9AuT8tW+tjR36
 lJfyI5hz3HSkw5qv89e0tywnu0xrT2oEVl0BUFEFu02hBJ9Xg3j5d15REPHy4jhi/+3s
 BHP9r24ppfMfCE76Vaau9iOtENxdD/LcAWqP0eZwSk4dQhSY7GyQUjnRj+XWgltfDSmI
 j8N9hjlKsJx9pyANh3jkBHwWDe/fx6crEoWIeOS4Qc0sZ9LFq/VjBbBlcDeSN1QSSXBe
 QfNnGB1ToqOENvukS5dpqQ03wana33WWoXWZpTEC+kvarDQNZJzWGeV58eJN0Qd2zCK1
 M9IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:reply-to:from:date:message-id
 :subject:to;
 bh=5r/XcNkEmDQrm3A1xZDN6DoRTNAdveHfUIHZJPy9BtE=;
 b=e0aSZM3Kwk3+wHujut+Pb0j02CFdbV7zpQ5A9YlZT3X/OvhQogJYxwtB7kZCSfH5cP
 86DrnbqkRCC7fSZztSvgLRegOt5ANGdcCzIo7+1I7UDIJrODe50U2AKoLLXw4yMeLI8t
 QNTaeDOcmTWFDQvd5HfjzwSJGKNfv5n83a66ipXAvLl15UnI0o68vW1chxgN58xXZTqb
 auK1WRJVkLMbCkvE3UWLQ97CmpAnkfaUfGGpZC5fOkVGh06igzQbB8a9shBouGjsdTKe
 sAlJWoAvhIvDzFrhPfpqTEexWFiPNN2OOh8gzkNy1Qd0c2IMd5nQy9kaDRXD8//bgnrJ
 vnGg==
X-Gm-Message-State: APjAAAWsIDUFa48Vb6DXYdAd0EzuMC06OuOoMUBLCQ/zZhtPsq1mJ9Jy
 3XHGgLiMSHjJqnvRJI7AJw8dVNJxT/Dih9jXJNVgWphor9o=
X-Google-Smtp-Source: APXvYqz180vT0scl2b8hExiwSGzKJsDrxTax9Bj9ol6I8AKVTAiMARRPylfK9S0TU4M8/Q9pFNL5mAbjiX+fNNG8bzM=
X-Received: by 2002:a5d:9bc6:: with SMTP id d6mr30712087ion.160.1565604539004; 
 Mon, 12 Aug 2019 03:08:59 -0700 (PDT)
MIME-Version: 1.0
From: Kai Hendry <kai.hendry@gmail.com>
Date: Mon, 12 Aug 2019 18:08:46 +0800
Message-ID: <CAF8XF0cO6h2f3dtWOKtPX-EFg0ne4cUor65VzVg_9Gdg9y85xA@mail.gmail.com>
Subject: Sanity test forwarding
To: wireguard@lists.zx2c4.com
X-Mailman-Approved-At: Sun, 25 Aug 2019 17:40:17 +0200
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
Reply-To: hendry@iki.fi
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

Sorry, there is more of iproute2 / iptables question I guess, though
in the context of using Wireguard I've never had a problem with
wg-quick, except on my voidlinux / muslc machine!!

hendry@knuckles /etc/wireguard $ sudo grep -vi private wg0.conf
[Interface]
Address = 192.168.2.1
ListenPort = 51820

PostUp = iptables -A FORWARD -i %i -j ACCEPT; iptables -t nat -A
POSTROUTING -o enp3s0 -j MASQUERADE
PostDown = iptables -D FORWARD -i %i -j ACCEPT; iptables -t nat -D
POSTROUTING -o enp3s0 -j MASQUERADE

[Peer]
PublicKey = 9ZyNE3if3j5hNcBY9ZnEHOGqLNRQNE5BnWFqkiQLSgo=
AllowedIPs = 192.168.2.2/32
hendry@knuckles /etc/wireguard $ ip route
default via 192.168.1.1 dev enp3s0
172.17.0.0/16 dev docker0 proto kernel scope link src 172.17.0.1
192.168.1.0/24 dev enp3s0 proto kernel scope link src 192.168.1.5
192.168.2.2 dev wg0 scope link
hendry@knuckles /etc/wireguard $ sudo modinfo wireguard
filename:       /lib/modules/5.0.21_1/kernel/net/wireguard.ko.gz
alias:          net-pf-16-proto-16-family-wireguard
alias:          rtnl-link-wireguard
version:        0.0.20190702
author:         Jason A. Donenfeld <Jason@zx2c4.com>
description:    WireGuard secure network tunnel
license:        GPL v2
srcversion:     1A86B7E30E05E9B1FD6681E
depends:        udp_tunnel,ip6_udp_tunnel
retpoline:      Y
name:           wireguard
vermagic:       5.0.21_1 SMP preempt mod_unload modversions


I can connect to the machine just fine, but the forwarding doesn't
work! Docker is fine. Bizarre!

hendry@knuckles /etc/wireguard $ cat /proc/sys/net/ipv4/ip_forward
1
hendry@knuckles /etc/wireguard $ sudo iptables -L -t nat
Chain PREROUTING (policy ACCEPT)
target     prot opt source               destination
DOCKER     all  --  anywhere             anywhere             ADDRTYPE
match dst-type LOCAL

Chain INPUT (policy ACCEPT)
target     prot opt source               destination

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination
DOCKER     all  --  anywhere            !127.0.0.0/8          ADDRTYPE
match dst-type LOCAL

Chain POSTROUTING (policy ACCEPT)
target     prot opt source               destination
MASQUERADE  all  --  172.17.0.0/16        anywhere
MASQUERADE  all  --  anywhere             anywhere
MASQUERADE  tcp  --  172.17.0.2           172.17.0.2           tcp dpt:http
MASQUERADE  tcp  --  172.17.0.3           172.17.0.3           tcp dpt:9115
MASQUERADE  tcp  --  172.17.0.4           172.17.0.4           tcp dpt:hbci

Chain DOCKER (2 references)
target     prot opt source               destination
RETURN     all  --  anywhere             anywhere
DNAT       tcp  --  anywhere             anywhere             tcp
dpt:ddi-tcp-1 to:172.17.0.2:80
DNAT       tcp  --  anywhere             anywhere             tcp
dpt:9115 to:172.17.0.3:9115
DNAT       tcp  --  anywhere             anywhere             tcp
dpt:cisco-sccp to:172.17.0.4:3000


So any tips how to debug this. I tried creating a veth interface, but
I don't quite grok how veth0@veth1 & veth1@veth0 is supposed to work.


Thanks in advance!
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
