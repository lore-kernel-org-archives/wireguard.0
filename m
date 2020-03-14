Return-Path: <SRS0=PRBc=47=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F267DC0044D
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 14 Mar 2020 15:33:51 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4D2F020775
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 14 Mar 2020 15:33:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="vYHM6Gc8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4D2F020775
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d8a5d801;
	Sat, 14 Mar 2020 15:27:58 +0000 (UTC)
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [2a00:1450:4864:20::343])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 48c8c2f9
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 14 Mar 2020 15:27:56 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id 11so13021244wmo.2
 for <wireguard@lists.zx2c4.com>; Sat, 14 Mar 2020 08:33:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:autocrypt:to:subject:message-id:date:user-agent:mime-version
 :content-transfer-encoding:content-language;
 bh=wUV6q1z7E7SDttC9xGjBmnUy4zNDyqkGwy/W+/F/N0k=;
 b=vYHM6Gc8RR/bQj7LXoTJ7ZbHYIhzDq09pwCwexKZpKzMcRM4u4oUVTf5NOJ5jUXi1X
 OKzMTqvHNMkwljv6XgMlkDDxMu1lquwMlone4J7wr1gzgaMeU7jhpzjsmAUPwPADIIt4
 y1Qox+ycrrBKfO7j3L/ulO4ITtQF/xGB/MAxthaLNnPYJVCrb2U9p+RehhZZQivX0u/7
 CqSpJzcAZJprqwCNZ+KtPhw9rv097wyyEqn5jZMWLW2dgtSwUBy6g07tI47NC8I6M+Mo
 vdZZTnNddaZQezEbZfC1x4e2TajlfbunXAMscsNvbAh6eGkn8Xpha8Fkkb5qiM2GPkVQ
 PlxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:autocrypt:to:subject:message-id:date
 :user-agent:mime-version:content-transfer-encoding:content-language;
 bh=wUV6q1z7E7SDttC9xGjBmnUy4zNDyqkGwy/W+/F/N0k=;
 b=Jif/FvKL3SHg5EZJLM1bbVABfIFx7tnC1usRxJapsJahws6nMaK7kqBhjeuFs5jrqm
 FPZa/apiKO9j0HcMr1t5IX0QTiypxMfHh6ZlsFO+CyjaUwZYJM9ZYxjEBZH7bfEET1kP
 5iFI0Ru/5ymDNVfO80W9gGjceXznBW3csCAXm0BPJS1UkY3B5Oo9N2bUyujOZ1/iYvOI
 2TrFcNYMK0LMS91DmKtanS+30ZIECf6QV/p/fx3Q1FG2FJt/fmYILGr8oIiAxHSeWwxP
 GreJft3dnU5Vl3N/f0i3BUDJN3MpXUQHRjZu8DPMAE1muVbh9+UQJdepFDm+MXdtMURT
 yrwg==
X-Gm-Message-State: ANhLgQ0n0CEBU18H5N8cNMisfO0I6viHxKlIVywJsWYUT974NvLiuk76
 D6xdrWxzw2DENFnZTQK9cmA4EngQ
X-Google-Smtp-Source: ADFU+vsYkKsMqFUISYmTwSLUsc540e7tovrRtu8gjFdWGNqtqsXIsoufrFJkO7XNkAGp+uZGNWNdKA==
X-Received: by 2002:a1c:b4d4:: with SMTP id d203mr17362434wmf.85.1584200025523; 
 Sat, 14 Mar 2020 08:33:45 -0700 (PDT)
Received: from [192.168.1.129] ([95.235.14.189])
 by smtp.googlemail.com with ESMTPSA id i67sm63355925wri.50.2020.03.14.08.33.44
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 14 Mar 2020 08:33:45 -0700 (PDT)
From: Germano Massullo <germano.massullo@gmail.com>
Autocrypt: addr=germano.massullo@gmail.com; prefer-encrypt=mutual; keydata=
 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
 YljxTJc=
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: WireGuard connecting hosts WAN->LAN
Message-ID: <c3b5c2e5-d77b-1984-107d-6f6a56b67f84@gmail.com>
Date: Sat, 14 Mar 2020 16:33:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
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

A simple question to Wireguard developers, since while asking for help
in OpenWRT forum[1] I have been told that I am asking a thing that
Wireguard cannot do, so I want to ask upstream if it is possible or not

Scenario:
A =3D internet (WAN) host (WireGuard IP 10.1.1.3)
B =3D OpenWRT router (WireGuard IP 10.1.1.1)
C =3D LAN host (WireGuard IP 10.1.1.2)

I want to:
1) connect A to C passing through B. I don't want to expose C to
internet at all, (so no things like port forwarding)
2) A must have C public key (and viceversa), so in case of B being
compromised, the A<->C VPN will not be compromised.

In a few words, I want B to just route forwards packages from A to C.

I have been told:
=3D=3D=3D=3D=3D
In your scenario A is not connected to C. Having peer entries for A and
C at each end are completely pointless because they're not doing
anything. The keys you have in those entries will only ever be used if A
and C are connected directly. As long as you have B in the middle then
packets will be sent from A (or C) to B which will decrypt then with the
appropriate public key. B will then re-encrypt them with it's own
private key before sending them on to C (or A). If you don't want that
to happen then you'll need to connect A and C directly.
=3D=3D=3D=3D=3D

What do you think about?
For information completeness, below I attach the configuration of the
three hosts
In past I had a similar configuration with 3 Fedora/CentOS machines,
where A had just the B public key and I could connect to C because in A
configuration, the allowed IPs of B had a /24 mask. Now I would like to
setup a more strict configuration

Thank you for your time

[1]: https://forum.openwrt.org/t/wireguard-connecting-hosts-wan-lan/



**Host A - WireGuard configuration file (Fedora)**

```
[Interface]
Address =3D 10.1.1.3/24
PrivateKey =3D censored
ListenPort =3D 51820

# Host B
[Peer]
PublicKey =3D censored
Endpoint =3D tom.foo.bar:51820
AllowedIPs =3D 10.1.1.1/32

# Host C
[Peer]
PublicKey =3D censored
AllowedIPs =3D 10.1.1.2/32
```

**Host B - OpenWRT /etc/config/network configuration file**

```
root@OpenWrt:/etc# cat config/network

config interface 'loopback'
=A0=A0=A0=A0=A0=A0=A0 option ifname 'lo'
=A0=A0=A0=A0=A0=A0=A0 option proto 'static'
=A0=A0=A0=A0=A0=A0=A0 option ipaddr '127.0.0.1'
=A0=A0=A0=A0=A0=A0=A0 option netmask '255.0.0.0'

config globals 'globals'
=A0=A0=A0=A0=A0=A0=A0 option ula_prefix 'censored::/48'

config interface 'lan'
=A0=A0=A0=A0=A0=A0=A0 option type 'bridge'
=A0=A0=A0=A0=A0=A0=A0 option ifname 'eth0.1'
=A0=A0=A0=A0=A0=A0=A0 option proto 'static'
=A0=A0=A0=A0=A0=A0=A0 option ipaddr '192.168.1.1'
=A0=A0=A0=A0=A0=A0=A0 option netmask '255.255.255.0'
=A0=A0=A0=A0=A0=A0=A0 option ip6assign '60'

config interface 'wan'
=A0=A0=A0=A0=A0=A0=A0 option ifname 'eth0.2'
=A0=A0=A0=A0=A0=A0=A0 option proto 'pppoe'
=A0=A0=A0=A0=A0=A0=A0 option username 'censored'
=A0=A0=A0=A0=A0=A0=A0 option password 'censored'
=A0=A0=A0=A0=A0=A0=A0 option ipv6 'auto'

config device 'wan_dev'
=A0=A0=A0=A0=A0=A0=A0 option name 'eth0.2'
=A0=A0=A0=A0=A0=A0=A0 option macaddr 'censored'

config interface 'wan6'
=A0=A0=A0=A0=A0=A0=A0 option ifname 'eth0.2'
=A0=A0=A0=A0=A0=A0=A0 option proto 'dhcpv6'

config switch
=A0=A0=A0=A0=A0=A0=A0 option name 'switch0'
=A0=A0=A0=A0=A0=A0=A0 option reset '1'
=A0=A0=A0=A0=A0=A0=A0 option enable_vlan '1'

config switch_vlan
=A0=A0=A0=A0=A0=A0=A0 option device 'switch0'
=A0=A0=A0=A0=A0=A0=A0 option vlan '1'
=A0=A0=A0=A0=A0=A0=A0 option ports '2 3 4 5 0t'

config switch_vlan
=A0=A0=A0=A0=A0=A0=A0 option device 'switch0'
=A0=A0=A0=A0=A0=A0=A0 option vlan '2'
=A0=A0=A0=A0=A0=A0=A0 option ports '1 0t'

config interface 'wg0'
=A0=A0=A0=A0=A0=A0=A0 option proto 'wireguard'
=A0=A0=A0=A0=A0=A0=A0 option private_key 'censored'
=A0=A0=A0=A0=A0=A0=A0 option listen_port '51820'
=A0=A0=A0=A0=A0=A0=A0 option route_allowed_ips '1'
=A0=A0=A0=A0=A0=A0=A0 list addresses '10.1.1.1/24'
# Host A
config wireguard_wg0 'wg_client_host_A'
=A0=A0=A0=A0=A0=A0=A0 option public_key 'censored'
=A0=A0=A0=A0=A0=A0=A0 list allowed_ips '10.1.1.3/32'
# Host C
config wireguard_wg0 'wg_client_host_C'
=A0=A0=A0=A0=A0=A0=A0 option public_key 'censored'
=A0=A0=A0=A0=A0=A0=A0 list allowed_ips '10.1.1.2/32'
```

**Host C - WireGuard configuration file (CentOS)**
```
[Interface]
Address =3D 10.1.1.2/24
ListenPort =3D 51820
PrivateKey =3D censored

# Host B
[Peer]
PublicKey =3D censored
Endpoint =3D 192.168.1.1:51820
AllowedIPs =3D 10.1.1.1/32

# Host A
[Peer]
PublicKey =3D censored
AllowedIPs =3D 10.1.1.3/32
```

