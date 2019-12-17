Return-Path: <SRS0=T0jl=2H=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47020C43603
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 17 Dec 2019 15:15:35 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A0DFB218AC
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 17 Dec 2019 15:15:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="uMPEFZmN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A0DFB218AC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id af0f0d76;
	Tue, 17 Dec 2019 15:15:07 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c57a8bda
 for <wireguard@lists.zx2c4.com>;
 Tue, 17 Dec 2019 15:15:05 +0000 (UTC)
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com
 [IPv6:2607:f8b0:4864:20::835])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 133a2649
 for <wireguard@lists.zx2c4.com>;
 Tue, 17 Dec 2019 15:15:05 +0000 (UTC)
Received: by mail-qt1-x835.google.com with SMTP id w47so8994153qtk.4
 for <wireguard@lists.zx2c4.com>; Tue, 17 Dec 2019 07:15:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=Jh0NnxsnZQ/DmpGRnKAwF7RpgpFSssnOcs47nL7U+xk=;
 b=uMPEFZmNBMWLRUzrpqsKYMdcqY3otUpA7myoG8Ll1rXNA99mLu4/DZC/9QijVYB/8e
 81bov9POKqKJlVpWNIeA8BCt+fm1Yo/WgZMCsdbCDhJXDDj2QciGxxt0hKslifqZRh2C
 Q903gkk0PlCQZgo3oVq0NGZLy6jk0o9XdbXcoWtY/rDCCw+8ep/wCyR6duc8auxkJ21k
 0T84gBiMdsOc3+veUybXUyhGJExD1BuDlMrxuUdutAID8PYoZ2223rrkiXmZKQIxBcrM
 zN2UrAAJopZbhwt7SRP2lZj8shIB25IZjRwIMFZrixpWSxn9y42aXl6tfhLT5AmptdJn
 CtQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=Jh0NnxsnZQ/DmpGRnKAwF7RpgpFSssnOcs47nL7U+xk=;
 b=hZHn15f4bsUInP/FPxg3GEUmqfRLsmwZQ57+0eaCPwMNaW413Za9B5/UGOdJtWS4bH
 LZf3ms4uql3/H7u6fGORlZR3mzl60iRp3sba8qs+5VLhvGLqQliXuj/lIJ1ylShoZXdV
 XhxBIJxTIT0aKV823O7HVw1qh15xduKdzvpxx5nf0RbzH5G2+qAYaGth3HG/tu7aGeiH
 95uOSi4HwUfF8Bd2SoxzP6qT75ijhMf0ipwrygH8RpsYD1KObtOzJhqMGy6DaeFoid2H
 Y4CNwaIb84ykYAV8V9H2auRJeDnicF8Wi5avw0jbuHIRpGtfDAOMi1y1ORnnBxzZ8l3C
 TNzw==
X-Gm-Message-State: APjAAAWroq0jpl3c1zajv71TWIfWiqm7NiyqTAru/1qiOvKTFAU3V8wK
 ZLuL2xDqXKi9BXDsnAQLzSda90eU8oVZkov+Bj+TKmQh
X-Google-Smtp-Source: APXvYqz2J5xDyH3bFDeDxdRjBUYzncxEEXItT+QZ9DEDPQZlmqxlaaqGtgKQz4iuEIGuD0BqiOEDyWlYD0Ois7ctofk=
X-Received: by 2002:ac8:138b:: with SMTP id h11mr4878461qtj.153.1576595703944; 
 Tue, 17 Dec 2019 07:15:03 -0800 (PST)
MIME-Version: 1.0
From: Franck MESSAOUDI <frank.messaoudi@gmail.com>
Date: Tue, 17 Dec 2019 16:14:27 +0100
Message-ID: <CAHC_4XPNXxVHD02qDXFpgOdYN0ojpmUWyq4t==DuTSwe6s7fUg@mail.gmail.com>
Subject: Getting some troubles when setting up the VPN
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
Content-Type: multipart/mixed; boundary="===============3958629951356455818=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============3958629951356455818==
Content-Type: multipart/alternative; boundary="000000000000e359530599e7cace"

--000000000000e359530599e7cace
Content-Type: text/plain; charset="UTF-8"

Dear members,

I am using the wireguard to create VPN in order to access my VMs in
openstack.
The thing is that I am getting some troubles when I chage the network or
the access point.
Indeed, I have two wifi networks and one via ethernet. the VPN is working
only for one wifi access network, for the two others it does not work. I do
not understand why this behaviour? is it due the routing tables?

You will be very kind if some of you could reply with an answer.

In advance, thank you.

Best regards,

Franck

--000000000000e359530599e7cace
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Dear members, <br></div><div><br></div><div>I am usin=
g the wireguard to create VPN in order to access my VMs in openstack.</div>=
<div>The thing is that I am getting some troubles when I chage the network =
or the access point.</div><div>Indeed, I have two wifi networks and one via=
 ethernet. the VPN is working only for one wifi access network, for the two=
 others it does not work. I do not understand why this behaviour? is it due=
 the routing tables?</div><div><br></div><div>You will be very kind if some=
 of you could reply with an answer.</div><div><br></div><div>In advance, th=
ank you.</div><div><br></div><div>Best regards, <br></div><div><br></div><d=
iv>Franck<br></div></div>

--000000000000e359530599e7cace--

--===============3958629951356455818==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============3958629951356455818==--
