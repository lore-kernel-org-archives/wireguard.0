Return-Path: <SRS0=8LYU=AY=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC476C433E1
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 13 Jul 2020 23:54:44 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6AA1B20825
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 13 Jul 2020 23:54:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AS6WslZ+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6AA1B20825
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 914dfdd9;
	Mon, 13 Jul 2020 23:31:25 +0000 (UTC)
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com
 [2607:f8b0:4864:20::82a])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 84513fe0
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 10 Jul 2020 00:33:20 +0000 (UTC)
Received: by mail-qt1-x82a.google.com with SMTP id 6so3233902qtt.0
 for <wireguard@lists.zx2c4.com>; Thu, 09 Jul 2020 17:54:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=to:from:subject:message-id:date:user-agent:mime-version;
 bh=LrmLs1S0/kL9bukSS6Yknnwlzs8HhrOcDPYx2gudXhY=;
 b=AS6WslZ+NnSopB03EvzlgMQYw5LwjgFVTX4A3ltUHfUgBCVnXRMK6j3JN7P5ZAZZPC
 899qsDLSXoOA8QO+jaHD2d5AScl95Xm8Bme9zkvmiIKZyB+xitP8C96SV7AmbrFxT0BW
 SbsHvmw65kR0pdWRu+7IUgy0nc/ydj8yshvhI1vfwBjiFUiuN6SgIHvDNBTyep2DyeW9
 iBJgQNMYo3pwjRctu09R9boql1w520AbDYE9/KO/byNA24vp/piqoNU1txeCo0JGMZ4B
 nEBtoYCVbKtLfS8S0QHuPqLEMGw5EGkaeKn6gkllfliEJskcl6/9reM4DMybKE6dptuu
 6r4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:from:subject:message-id:date:user-agent
 :mime-version;
 bh=LrmLs1S0/kL9bukSS6Yknnwlzs8HhrOcDPYx2gudXhY=;
 b=o1PWQlSe+dc0szmKRffhO07CZ3Yybwspza8pVpcPJOtJCahN6J6jKYr4yv0ippMwVg
 mEGA2iODqMVAgMwiBVE+xWlrPH754fzI7Icx5oCYn1K5aXurpegBYdfamGsustKSlTQ8
 eHGUA5Nv65G8OyMpDxmZneryEtqa8Q7kTJ0hZ5abtGrqCIXXCiln90ZCqVRKttxFwFQQ
 pleMqhWKlYFo1IB6F88wo21Xxma/4AS7EKf7xHDzHx6F8dXn/ve4xPW9SxP/fu+HiR1z
 slaFfzAwLV2irEhCnWWP61evTY9AAdxBKKufyM06lfhvDRbdJmJfwR64w5bFmgEFcfin
 q6lA==
X-Gm-Message-State: AOAM530Izg3V9agod37wLUkkHcGbi5JWsAsVZlbrQhgvAvXuQWG3Zs+L
 nku3MdC+3ApAJGwOxOg1AbFhx4cG
X-Google-Smtp-Source: ABdhPJzMph8/9Zr/Q8TMvo3ZnqJ/c5C6Qrt0t82lV0QsvSYXyuGcsaDhP2+wDrT7+HI4QQthPRsEQQ==
X-Received: by 2002:ac8:7650:: with SMTP id i16mr24004254qtr.215.1594342460703; 
 Thu, 09 Jul 2020 17:54:20 -0700 (PDT)
Received: from [127.0.0.1] ([66.115.173.166])
 by smtp.gmail.com with ESMTPSA id i22sm5329714qki.4.2020.07.09.17.54.18
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Jul 2020 17:54:19 -0700 (PDT)
To: WireGuard <wireguard@lists.zx2c4.com>
From: "Demi M. Obenour" <demiobenour@gmail.com>
Subject: conntrack nftables rules from wg-quick
Message-ID: <2b87f1ac-547a-a198-a452-e5d9921923d0@gmail.com>
Date: Thu, 9 Jul 2020 20:54:15 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="5QbsP0WPvDkxpryTHoF3GVpxGZn5jjJ86"
X-Mailman-Approved-At: Tue, 14 Jul 2020 01:31:20 +0200
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.30rc1
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--5QbsP0WPvDkxpryTHoF3GVpxGZn5jjJ86
Content-Type: multipart/mixed; boundary="BmUuFQHsuCfDhVvobhrazzHl4C9JrmZu3";
 protected-headers="v1"
From: "Demi M. Obenour" <demiobenour@gmail.com>
To: WireGuard <wireguard@lists.zx2c4.com>
Message-ID: <2b87f1ac-547a-a198-a452-e5d9921923d0@gmail.com>
Subject: conntrack nftables rules from wg-quick

--BmUuFQHsuCfDhVvobhrazzHl4C9JrmZu3
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

What is the purpose of the premangle and postmangle chains created
by wg-quick(8)?  Is it to ensure that rogue packets cannot bypass
stateful firewall rules?

More precisely, I am using wg-quick in a Qubes VM.  I want all
traffic on vif interfaces to go through WireGuard, which will
ultimately send the packets on eth0.  All incoming traffic on eth0
that is not protected by WireGuard should be blocked.  I currently
use hand-written nftables rules to ensure this, but I am wondering
if the default QubesOS firewall is sufficient.  The default QubesOS
IPv4 firewall rules follow:

# Generated by iptables-save v1.4.5 on Mon Sep  6 08:57:46 2010
*nat
:PREROUTING ACCEPT [0:0]
:OUTPUT ACCEPT [0:0]
:POSTROUTING ACCEPT [0:0]
:PR-QBS - [0:0]
:PR-QBS-SERVICES - [0:0]
-A PREROUTING -j PR-QBS
-A PREROUTING -j PR-QBS-SERVICES
-A POSTROUTING -o vif+ -j ACCEPT
-A POSTROUTING -o lo -j ACCEPT
-A POSTROUTING -j MASQUERADE
COMMIT
# Completed on Mon Sep  6 08:57:46 2010
# Generated by iptables-save v1.4.5 on Mon Sep  6 08:57:46 2010
*filter
:INPUT DROP [0:0]
:FORWARD DROP [0:0]
:OUTPUT ACCEPT [0:0]
:QBS-FORWARD - [0:0]
-A INPUT -m state --state INVALID -j DROP
-A INPUT -i vif+ -p udp -m udp --dport 68 -j DROP
-A INPUT -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT
-A INPUT -i vif+ -p icmp -j ACCEPT
-A INPUT -i lo -j ACCEPT
-A INPUT -i vif+ -j REJECT --reject-with icmp-host-prohibited
-A INPUT -j DROP
-A FORWARD -m state --state INVALID -j DROP
-A FORWARD -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT
-A FORWARD -j QBS-FORWARD
-A FORWARD -i vif+ -o vif+ -j DROP
-A FORWARD -i vif+ -j ACCEPT
-A FORWARD -j DROP
COMMIT
# Completed on Mon Sep  6 08:57:46 2010

And for IPv6:

*nat
:PREROUTING ACCEPT [0:0]
:OUTPUT ACCEPT [0:0]
:POSTROUTING ACCEPT [0:0]
:PR-QBS - [0:0]
:PR-QBS-SERVICES - [0:0]
-A PREROUTING -j PR-QBS
-A PREROUTING -j PR-QBS-SERVICES
-A POSTROUTING -o vif+ -j ACCEPT
-A POSTROUTING -o lo -j ACCEPT
-A POSTROUTING -j MASQUERADE
COMMIT
*filter
:INPUT DROP [0:0]
:FORWARD DROP [0:0]
:OUTPUT ACCEPT [0:0]
:QBS-FORWARD - [0:0]
-A INPUT -m state --state INVALID -j DROP
-A INPUT -i lo -j ACCEPT
-A INPUT -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT
-A INPUT -i vif+ -p icmpv6 --icmpv6-type router-advertisement -j DROP
-A INPUT -i vif+ -p icmpv6 --icmpv6-type redirect -j DROP
-A INPUT -i vif+ -p icmpv6 -j ACCEPT
-A INPUT -i vif+ -j REJECT --reject-with icmp6-adm-prohibited
-A INPUT -p icmpv6 -j ACCEPT
-A INPUT -j DROP
-A FORWARD -m state --state INVALID -j DROP
-A FORWARD -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT
-A FORWARD -j QBS-FORWARD
-A FORWARD -i vif+ -o vif+ -j DROP
-A FORWARD -i vif+ -j ACCEPT
-A FORWARD -j DROP
COMMIT

Sincerely,

Demi


--BmUuFQHsuCfDhVvobhrazzHl4C9JrmZu3--

--5QbsP0WPvDkxpryTHoF3GVpxGZn5jjJ86
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAl8HvDgACgkQsoi1X/+c
IsGWvw//RGpthzEFPw22LoDBZn1F2/DuPLilrIqBh/Jz2lgtkQ4lUijyqxFg1qLN
1vXgfEN9/0bgROUwvI+2IJsmJkPgLbU1rF4dqOARMeH6+M0KiZCb/lG4btfnz2JJ
DQU/FwZh/avVf/hkAqWy4q2fskVUL2N+FOh75KYM1C1pBPEHjBD4WOw0asCDaSY7
CJ8QlIiIY3/+KuG18lXit/s+4ineXnYV0ajQNRbHm5gYU9RxGyh8VSahxL8JaQoh
OS76/dCmT3jsES9LVr1nMQNGebEzABTdRdkhkCf9FI3Eo9XBsPB4PWE7TRzd4I5t
NrZwrL5Snwx5rpq5ICCJ6mqRgZdB6c+Umds39h6T+up8u0AdlG2BOLvQSKnC4L0h
riZg1sVxq98PSCzYM0hmBOpg2HazCbwuR//FA4zj0cTzQmydIKXeD0Y/70LB7brk
Qi5s2VJuTd8vzRz6TB3aIxbuliB2o8SqdmpONEWTy0st/qzuGhUKQZ7d3ZHppZBP
zoK/9btm2sBksdUerWaR0RSiyPysbgMKxRCmruLRChnj3tUwWxfcgXp86Dt1UJyC
Md247iYNZ95v1i0q98WSk/fShsgp8SncrPB5M05z47v2NPYSlT7C0mVV3FZCAuAK
zoll1FROyUY3qQGcuwq86sFDP+xJgxwbv01brgthZROwjcnF3wU=
=icWb
-----END PGP SIGNATURE-----

--5QbsP0WPvDkxpryTHoF3GVpxGZn5jjJ86--
