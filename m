Return-Path: <SRS0=F0uL=3T=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D44A0C33CB2
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 30 Jan 2020 01:56:07 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 290C0206D5
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 30 Jan 2020 01:56:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=z9.ru header.i=@z9.ru header.b="DCSQ28vS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 290C0206D5
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=z9.ru
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 70c03b56;
	Thu, 30 Jan 2020 01:53:23 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 58a85d55
 for <wireguard@lists.zx2c4.com>;
 Sun, 26 Jan 2020 19:46:44 +0000 (UTC)
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com
 [IPv6:2607:f8b0:4864:20::72e])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5a9b6224
 for <wireguard@lists.zx2c4.com>;
 Sun, 26 Jan 2020 19:46:44 +0000 (UTC)
Received: by mail-qk1-x72e.google.com with SMTP id 21so7660275qky.4
 for <wireguard@lists.zx2c4.com>; Sun, 26 Jan 2020 11:46:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=z9.ru; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=6WewObzQvNrRXpFdiM9JAk3uvbCNV6NglYZ8KMxXHEk=;
 b=DCSQ28vSelJoRNEyfO/0DsIQbAiBRbTgt2hx0bLAV5L4AhFXI6JXBYOtrTvlN6Ay+m
 gwwzsaFhR2wDUIW5qBNtUZdxwcn6HBsJDe440p/laB+zZfkX3GQ5Q1e2rPl/feHo+bNl
 UEkxwkZaizcw1+UoYsxroBi0E3V77sZ8ixKIE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=6WewObzQvNrRXpFdiM9JAk3uvbCNV6NglYZ8KMxXHEk=;
 b=kJAEyO192GPiV4/QUMwQIUmfyQIhzK2hBl12pGEy1P3i/k0UdQpautkoqlUOS/InGE
 me5pFDhUWHYz+i6r7hSNHLxoYSNve8B8y/jdoObNMJEyC9CAlbbFA4cCqH7FW/W7fnYX
 dQ1xG6Lx6T109gmxgvjdxNtgc/4CJEeqlm5ueCOIfWAR5BCuMdk+10e2TiwaM8sm6/wo
 wZ0SFeDYRUypKJaNL85AXv997JCnqrfYuBhmeql/vntjdsdtkW00HsOUCYLMPm97NINa
 4Ayt/EtL4xqdCnYacNarsgknLwdGWgcrePFd7yqFbc7p41tIkAZX+yM3uNA9LcP0FX52
 gJHA==
X-Gm-Message-State: APjAAAXL+UE2CahDiQi37pD2bRxO/ni0UgfB6nzoksPJUbmz3D3iiEVc
 bNA83YGvt0+KXCH3n4izfwQOCF3/GIS6rrJ6HFcPHjtg
X-Google-Smtp-Source: APXvYqx0q4mKJJ1BtxfxDj/XQKKscgSBM1B7p7wEbnVsSHdTIAXhBS2VqGeW2NQmMPYpBtvicjggKZ5fB9EAMPFOKtg=
X-Received: by 2002:a05:620a:81c:: with SMTP id
 s28mr12235626qks.11.1580068003486; 
 Sun, 26 Jan 2020 11:46:43 -0800 (PST)
MIME-Version: 1.0
References: <9420fa01-61b9-73cb-21f4-681bf8015b7b@orlandi.com>
 <ea889cc3-9599-4218-a8cc-6daa9d2965e2@www.fastmail.com>
 <38df62df-2c77-48b1-f020-48a410ff381e@orlandi.com>
In-Reply-To: <38df62df-2c77-48b1-f020-48a410ff381e@orlandi.com>
From: Serge <snp@z9.ru>
Date: Sun, 26 Jan 2020 19:46:26 +0000
Message-ID: <CAN1uEJ2XALrdwaFjCv3557ef6rKcCGXA79kgK+79WOCddc4Nsg@mail.gmail.com>
Subject: Re: Tunnel traffic in VRF
To: wireguard@lists.zx2c4.com
X-Mailman-Approved-At: Thu, 30 Jan 2020 02:53:15 +0100
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
Content-Type: multipart/mixed; boundary="===============5754376120529214597=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============5754376120529214597==
Content-Type: multipart/alternative; boundary="00000000000011b28c059d1040c0"

--00000000000011b28c059d1040c0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 25 Jan 2020 at 14:24, Daniele Orlandi <daniele@orlandi.com> wrote:
> A proper binding to the correct VRF would be a better approach, however.

On user-level it can be done by SO_BINDTODEVICE socket option:

=C2=ABApplications that are to work within a VRF need to bind their socket =
to
the VRF device:
    setsockopt(sd, SOL_SOCKET, SO_BINDTODEVICE, dev, strlen(dev)+1);
=C2=BB

But I am not sure how things work on kernel level.

It would be great to add an option like 'listen-interfaces':

wg set <interface> [listen-port <port>] [listen-interfaces
<interface1>[,<interface2>]... ]

[Interface]
ListenPort=3D54002
ListenInterfaces=3Dvrf-red,vrf-green

This option can be useful in a non-VRF environment too.

--00000000000011b28c059d1040c0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On Sat, 25 Jan 2020 at 14:24, Daniele Orlandi &lt;<a href=
=3D"mailto:daniele@orlandi.com">daniele@orlandi.com</a>&gt; wrote:<br>&gt; =
A proper binding to the correct VRF would be a better approach, however.<br=
><br>On user-level it can be done by SO_BINDTODEVICE socket option:<br><br>=
=C2=ABApplications that are to work within a VRF need to bind their socket =
to the VRF device:<br>=C2=A0 =C2=A0 setsockopt(sd, SOL_SOCKET, SO_BINDTODEV=
ICE, dev, strlen(dev)+1);<br>=C2=BB<br><br>But I am not sure how things wor=
k on kernel level.<br><br>It would be great to add an option like &#39;list=
en-interfaces&#39;:<br><br>wg set &lt;interface&gt; [listen-port &lt;port&g=
t;] [listen-interfaces &lt;interface1&gt;[,&lt;interface2&gt;]... ]<br><br>=
[Interface]<br>ListenPort=3D54002<br>ListenInterfaces=3Dvrf-red,vrf-green<b=
r><br>This option can be useful in a non-VRF environment too.</div>

--00000000000011b28c059d1040c0--

--===============5754376120529214597==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============5754376120529214597==--
