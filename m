Return-Path: <SRS0=QHSY=WV=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	FROM_EXCESS_BASE64,HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	T_KAM_HTML_FONT_INVALID,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C7E5C3A5A1
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 25 Aug 2019 15:51:16 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 028D82080C
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 25 Aug 2019 15:51:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BWHOkQbf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 028D82080C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c9029949;
	Sun, 25 Aug 2019 15:46:57 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 733ba1f5
 for <wireguard@lists.zx2c4.com>;
 Sun, 25 Aug 2019 15:46:55 +0000 (UTC)
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 451d8a2a
 for <wireguard@lists.zx2c4.com>;
 Sun, 25 Aug 2019 15:43:16 +0000 (UTC)
Received: by mail-io1-xd36.google.com with SMTP id t3so31338437ioj.12
 for <wireguard@lists.zx2c4.com>; Sun, 25 Aug 2019 08:43:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=4ALeREK6aY4K3Wl+rF4DFL/UGXjIRr0sbe68j2DEiUk=;
 b=BWHOkQbfnumtdvz9YnKYQtG/FJjcb8PNGpZkUmDIPokuN/yxJIb0Itq5QcXjFJAkGO
 syH7iLkRPK5ks7/lhMTcd1/7LRrZOTmGIHpXKA6bpn2cGUc3wA9sojI2/4Fk8yQMOVTJ
 AVwu0U8P5VZNLM/sUFXS8uExrt+JI6rm9wHs1wIWY+cb4ZMmiQQ9djLrWbN5GZ4PFM78
 gC1PHkf6wbfHFevd3qg7xJC9HKYbD9+gyaoKOFIla/UeDt2TzARkpwcsaZIQ5nxwQujF
 DFo32CHBhKIN1ddqSrbRT6kg9yRL8XNscTj+EYBNQr2O2Zm7Va9LH5BQOyMsm8lwHh/6
 V7hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=4ALeREK6aY4K3Wl+rF4DFL/UGXjIRr0sbe68j2DEiUk=;
 b=F0LVuMAhWKXiJFyqfm5/LW4ctvunWLQklFYIjsEsVS+vYTUKovV4qq5rBHJMZMoHav
 4Gq/0UBarhcgGJp82moFicVUTIOWt3lhCjtYkZOXBQipb4I1AE0+uOG7ydMT+6C1YIQR
 6Etx17vl+Qbn642S+yMoqLEQwctLBax6udX0jKWBR1AWprGg5xIZq0vje8eEOddOVgqP
 X8D+HJ7ywjQrRgJEC2C6Bp9W639Lp4aQMPTGI/l/98rTN2jQIwojniuZqy0dKfD/MA5E
 wBYLa4p5heRoS9YYqkCL5M+XqvWF/Pd6zyMaiQvHZwhY0Siol9BWiHeOVZX9UZzhT2gG
 fXcQ==
X-Gm-Message-State: APjAAAXbpRQMbtKDellm90dhTw6AZCWBTIaJTR86ljKh0JFJj7bCxorn
 KRUr2ZLQ210awausbU9aDVwgv4MmlGSlihabjGhGf25vA0s=
X-Google-Smtp-Source: APXvYqzA7EUCkiCANb3xkJ/dtTBzVleZ17/aO2u658vZLgzKf92YoUoEUt6NU9x9aYmR1BEE5GTQ832Vjxunh7LdtGk=
X-Received: by 2002:a5d:934c:: with SMTP id i12mr7573161ioo.203.1566747795246; 
 Sun, 25 Aug 2019 08:43:15 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?B?5pu554Wc?= <cao88yu@gmail.com>
Date: Sun, 25 Aug 2019 23:43:04 +0800
Message-ID: <CACu-5+1gKi4h0Jft5tMphM5PVOiDhBuqCiE7zbCGMTHvwWW05Q@mail.gmail.com>
Subject: wireguard on openwrt with mwan3 (multi ip address)
To: wireguard@lists.zx2c4.com
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
Content-Type: multipart/mixed; boundary="===============1945707169256144231=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============1945707169256144231==
Content-Type: multipart/alternative; boundary="000000000000c9d4f60590f2e545"

--000000000000c9d4f60590f2e545
Content-Type: text/plain; charset="UTF-8"

Hi,
I'm using wireguard on openwrt, and I have multi wan links. When I use
wireguard as a server with mwan3, the wireguard client won't handshake
because inbound interface and outbound interface is different.

Details please see:
https://github.com/openwrt/packages/issues/9538

How to fix this issue? Thanks.

--000000000000c9d4f60590f2e545
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<br><font face=3D"arial, sans-serif">I&#39;m using wire=
guard on openwrt, and I have multi wan links. When I use wireguard as a ser=
ver with mwan3, the wireguard client won&#39;t handshake because=C2=A0<span=
 style=3D"background-color:transparent;color:rgb(36,41,46)">inbound interfa=
ce and outbound interface is different.</span></font><div><br></div><div>De=
tails please see:</div><div><a href=3D"https://github.com/openwrt/packages/=
issues/9538" target=3D"_blank">https://github.com/openwrt/packages/issues/9=
538</a><br></div><div><div><br></div><div>How to fix this issue? Thanks.</d=
iv></div></div>

--000000000000c9d4f60590f2e545--

--===============1945707169256144231==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============1945707169256144231==--
