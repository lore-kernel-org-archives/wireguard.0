Return-Path: <SRS0=rxz1=SO=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED3B9C10F0E
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 12 Apr 2019 10:18:05 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 43D7F2083E
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 12 Apr 2019 10:18:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KOCYBA2/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 43D7F2083E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 86ad8bb0;
	Fri, 12 Apr 2019 10:18:03 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id be8dc992
 for <wireguard@lists.zx2c4.com>;
 Fri, 12 Apr 2019 10:18:01 +0000 (UTC)
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d6b0bfaa
 for <wireguard@lists.zx2c4.com>;
 Fri, 12 Apr 2019 10:18:01 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id t16so4924854plo.0
 for <wireguard@lists.zx2c4.com>; Fri, 12 Apr 2019 03:18:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=xsd3vSFh5NyDEzrnOzYmSsZYf4Jn66z1+Q9vCY/RjuM=;
 b=KOCYBA2/hj0CGhCKwh9ReyY3z6uFuRWp8McXFbT/W4e20kh6+D++SkUhejnU6Et7JN
 v4oStwOU5L9FjAGjH8CFXmVzaS8jiPRMI2uIS6AFDnXUDAz2tTBL0FMZhunhayLD0Pp1
 eYQ9onpxhtFf9q2mBRgngp5fNL6NmahXILKLClvmhF2WEBdqYk4q7HYLroEaonOz0v/q
 Tm067Fxskr+JzCBavHM1/bzJQGE33oQURODU6hT7FXO+RXUtuft7sGJMgsRtVWK0oYs3
 sdbi9uuaA/xJosvwKC/RRkL2l+W0++m+9+cwJc/7Ga5TSo+ta9EAgLEf7mFGwJsChxwz
 21Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=xsd3vSFh5NyDEzrnOzYmSsZYf4Jn66z1+Q9vCY/RjuM=;
 b=sAN0hGmyHtQO11f4OEOtIjKrMVTlenk32EObtQEGu462RXt1YjLSFOGRa/7f3nEewx
 FJ+Rjh1aANRui/E3nQMG4K0v+pn+vcuzPeaDfEPuQM3o7UdUf8b8Tk25BUyTf8lg8N+7
 NUXTq3D1kVbuGfPOFi3sq5cOlYkvgzT4oVl4EdWMuLIEjh/YfKN7XfNsWz5IQkXoexri
 ndIc/6ixn1zYiUXv6Pb+MiwUhufsi0iQBEIChh0j72HxVcB7wK3w4POATYYlOi/Xi1vr
 D2lImsPiSzrBLFDSbxTFwgKx6okiTItiynRQECltY7gLC9u54nhj+0uwMURugXukGbmi
 nHFA==
X-Gm-Message-State: APjAAAX48VzA8YRxiNlVeT0IwSV2d6Vo8bx83Dv3nU8S7+s2Je3EDBdE
 NEcfilAvkxNLpidLSys2dW6GB2BQ61PtGJY814I=
X-Google-Smtp-Source: APXvYqzMOmGqLdnHH2t7ePEwdO4XR2PuCFrWi2az2w+SMU6w7rtfbN9e1f9rH9KMyu8qGDOQtG+0RdxL8eoupMWgj0w=
X-Received: by 2002:a17:902:d83:: with SMTP id
 3mr32125740plv.125.1555064280556; 
 Fri, 12 Apr 2019 03:18:00 -0700 (PDT)
MIME-Version: 1.0
From: Feng Li <lifeng1519@gmail.com>
Date: Fri, 12 Apr 2019 18:17:34 +0800
Message-ID: <CAEK8JBC_xtDeKo-tswwU+cXBvCdUmWZPYrcrV_Az6NcJZ3Rf6g@mail.gmail.com>
Subject: ipset-dns combined with wg-quick
To: Jason@zx2c4.com, wireguard@lists.zx2c4.com
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

Hello Jason,

I have tried `wg-quick`, it works well but it will pass through all
traffic to the peer.
And I found you have created a small project called "ipset-dns"[1],
which is good for routing traffics by domains.

However, if I combined it with `wg-quick`, it will not work.
The network will connect timeout. And I found the ipset-dns did works well.
So I guess the question is the route table related.
But I'm not familiar with it.

The ultimate aim is like this:
If I want to route google.com/twitter.com/facebook.com to the peer,
just add the domains in the dnsmasq.conf.

The related command looks like this, the marks and route table maybe
have some conflicts.
```
+ sets youtube 1
+ iptables -t mangle -D PREROUTING -m set --set youtube dst,src -j
MARK --set-mark 1
+ ipset -X youtube
+ ipset -N youtube iphash
+ iptables -t mangle -A PREROUTING -m set --set youtube dst,src -j
MARK --set-mark 1
--set option deprecated, please use --match-set
+ routes 1 wg0
+ echo 0
+ ip route flush table 1
+ ip rule del table 1
+ ip rule add fwmark 1 table 1 priority 1000
+ ip route add default via 10.0.0.2 table 1
+ killall ipset-dns
+ ipset-dns youtube '' 1919 8.8.8.8
+ killall -SIGHUP dnsmasq


[#] ip link add wg0 type wireguard
[#] wg setconf wg0 /dev/fd/63
[#] ip address add 10.0.0.4/24 dev wg0
[#] ip link set mtu 1420 up dev wg0
[#] mount `8.8.8.8' /etc/resolv.conf
[#] wg set wg0 fwmark 51820
[#] ip -4 route add 0.0.0.0/0 dev wg0 table 51820
[#] ip -4 rule add not fwmark 51820 table 51820
[#] ip -4 rule add table main suppress_prefixlength 0
[#] iptables -A FORWARD -i eth0 -j ACCEPT; iptables -A FORWARD -o eth0
-j ACCEPT;iptables -t nat -A POSTROUTING -o wg0 -j MASQUERADE
```
Could you give me some helps?
Thanks.

[1]: https://git.zx2c4.com/ipset-dns/tree/README.md
-- 
Thanks and Best Regards,
Feng Li(Alex)
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
