Return-Path: <SRS0=XHON=BN=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,LOTS_OF_MONEY,MAILING_LIST_MULTI,
	NORMAL_HTTP_TO_IP,NUMERIC_HTTP_ADDR,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D3F2C433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  3 Aug 2020 11:41:19 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0153120738
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  3 Aug 2020 11:41:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UziRFeYR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0153120738
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a11d33ff;
	Mon, 3 Aug 2020 11:16:39 +0000 (UTC)
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 1793ef4a
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 3 Aug 2020 08:53:27 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id o18so37844283eje.7
 for <wireguard@lists.zx2c4.com>; Mon, 03 Aug 2020 02:17:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=frSh5tVn38xA/oXbRuHLr9krMSz0oc9CZpPyttnbQDQ=;
 b=UziRFeYRMnTMMAbi0xHot140103HCdPrmtIBOUqOYR8czyzNhLbkXjM16+yyEOTANk
 p5+SJ1nP+zJ0A0EOTGBXZzITnn2EMNsVR1tJuH1xVbTh1z2ICdsYIq9U10Y52/k0rr9a
 qWYmtBJtFjlBoDGiG3wXkbvWZalBXzTA2V9N4/VZhcO0HrMgjipnvAJE/tMZk3OpXpIP
 TidC7/1pkdrdCYL8AmEkirNlWbuPyDdVG3yXu39ODVrz49qNJeAsh6/c0R8xsUyy9Oq6
 RNdkSX8hA4srTLBbjXspg1WMIM9doH/abkQcYDD1Unj2A4vbpwen1PQMqdTe7G+oc50T
 JgZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=frSh5tVn38xA/oXbRuHLr9krMSz0oc9CZpPyttnbQDQ=;
 b=i+SFLN2BF6Wsq4CjA9fpuFcPwkPH10bnPpOO5v+JUlZvo9daHwL10JzJbJ6XfgHfPy
 U/85C5w9vlQeCoe/FlqWY+ZJwWa+pHMcly+QVfAxHhp+kQxH+3+LIJlrw2yayfiZMnIu
 Z7DLV9zjkqBilkVBbmJxH09tKsiqGMBN+4o4gqlxtabO+bOR45U9lNF0smYTJLDCN45D
 pB1UXNARPfOfRlOMsefQFdT/5Up0udMNJvgxr6JMzxojUtHJaDnG1EoSfZO1SJxEctEJ
 cZ6odc+RIjhP/NEPCnrhX+Sf8tt/ylrkqME+WMCjE0KmjMcqwNfpI4KyRjY5IwBSdsJ6
 j6pA==
X-Gm-Message-State: AOAM5302juAOR7ltDFcXBI+8+w7DKXQ5li/h5X+p3/sqi36EHkDApLu+
 gbXmNjm8O+RcMnNn2R3GEN0RpJaH2s3jbwVoMhuwiIsu6QI=
X-Google-Smtp-Source: ABdhPJzoS0g4Gx7hvl9/ldhFX7qevpfZupLKAv5wkZyrdNzFMRIMy0AwovC+S6ag5r31TvrXumga4YH8HnClwwxgFwo=
X-Received: by 2002:a17:906:198e:: with SMTP id
 g14mr15451472ejd.266.1596446256817; 
 Mon, 03 Aug 2020 02:17:36 -0700 (PDT)
MIME-Version: 1.0
From: Alexander Skwar <alexanders.mailinglists+nospam@gmail.com>
Date: Mon, 3 Aug 2020 11:15:21 +0200
Message-ID: <CAO8prk+D0zuzExJ9KcD5xJT1tGiVVHQO1Bs3ExBoUy7=Y0mhoQ@mail.gmail.com>
Subject: WireGuard macOS App doesn't set system default DNS
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Mon, 03 Aug 2020 13:16:38 +0200
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

Hello

I'm having issues with the macOS App. tl;dr: It doesn't set the system
DNS to the IP of my resolver which is only reachable once the tunnel
is up.

Here's my "clients" (macOS) configuration:

#####################################################################
[Interface]
PrivateKey =3D ...=3D
Address =3D 172.31.0.3/24
DNS =3D 10.136.16.2

[Peer]
PublicKey =3D ...=3D
AllowedIPs =3D 10.136.16.0/22, 169.254.169.253/32
Endpoint =3D wg.....ch:51820
#####################################################################

Matching "server" configuration (Debian 10):

#####################################################################
[Interface]
Address =3D 172.31.0.1/24
Listenport =3D 51820
PrivateKey =3D ...=3D
PostUp =3D iptables -A FORWARD -i wg0 -j ACCEPT; iptables -A FORWARD -o
wg0 -j ACCEPT; iptables -t nat -A POSTROUTING -o ens5 -j MASQUERADE
PostDown =3D iptables -D FORWARD -i wg0 -j ACCEPT; iptables -D FORWARD
-o wg0 -j ACCEPT; iptables -t nat -D POSTROUTING -o ens5 -j MASQUERADE

[Peer] # alexander-mac-1
PublicKey =3D kw6A7iN/sF0k2bePr15M10e6Ufhp7sJVWhZcZvGcrT8=3D
AllowedIPs =3D 172.31.0.3/32
#####################################################################

When I activate this tunnel on my mac and do a "dig" or "host" query
for some name which only the private resolver 10.136.16.2 knows, I get
an NXDOMAIN (query failed).
When I do "dig @10.136.16.2 $sameName", the name gets resolved (ie.
when I manually s). This shows that the routing is working fine.

As some extra tests, I set "DNS =3D 208.67.222.222" (OpenDNS) and tried
to resolve their test site www.internetbadguys.com. It resolves to
146.112.61.108, which means that OpenDNS is used (I'm normally not
using it). It also shows on https://welcome.opendns.com/.
Same result with setting "DNS =3D 1.1.1.1" and then going to
https://1.1.1.1/help - DNS is set.

This means that the macOS App *IS* able to set the system default
DNS, but for some reason doesn't set it to my private DNS IP of
10.136.16.2.
There is ONE (bad) work around: When I set "AllowedIPs =3D 0.0.0.0/0",
then the App DOES set the system default DNS to 10.136.16.2.

The log of the application doesn't show anything regarding DNS.
Pasted at https://paste.ee/p/ziqrg.

Well=E2=80=A6 Why does the macOS App refuse to set the DNS to 10.136.16.2?

Versions used:
App version: 0.0.20191105 (16)
Go backend version: 0.0.20191013
macOS: Catalina 10.15.5 (19F101)


Cheers,
Alexander
