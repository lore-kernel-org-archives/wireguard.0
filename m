Return-Path: <SRS0=QZLZ=PK=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86FD6C43387
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  2 Jan 2019 19:29:13 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2544F218D3
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  2 Jan 2019 19:29:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DuBbNtt2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2544F218D3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2ef8a78a;
	Wed, 2 Jan 2019 19:26:47 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a1d0890e
 for <wireguard@lists.zx2c4.com>;
 Sun, 23 Dec 2018 03:36:43 +0000 (UTC)
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 428a735a
 for <wireguard@lists.zx2c4.com>;
 Sun, 23 Dec 2018 03:36:43 +0000 (UTC)
Received: by mail-io1-xd2e.google.com with SMTP id p7so3658611iog.12
 for <wireguard@lists.zx2c4.com>; Sat, 22 Dec 2018 19:37:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=urFXLT4KjG6G6ACp80TTmA++/HdQHNkZn++Yu6UxMb4=;
 b=DuBbNtt2oR4sKQah0C+BSvYODytXfsMrcsrFcKkIq7MUDgxCemg59SmhFYnC5dgYmJ
 1GcmWQ6qBL0zxg9TbqgSknkaVyhtXatbSLvKWH99Lv77heyJ3cB5CRSfYsfX0t4psrBg
 +lNAbtmHlLcf2JXEOEFGD42FO/vs1ARvsRdDZn/8bmcsJXK8n14S+N7WBWB5LVXEMt4P
 EglMfoOIv5PcsNAUapM4mRQiQroFlGU2d0m0DeoIF3zN92a4CiAglVwnyjK81VwwtrxW
 aVEtdSRoxdSVaEcUftWkB7PFwFZuJcphu8xNTHOYP616JlTOBp6HncjwRFun0pkSUqFr
 Pxsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=urFXLT4KjG6G6ACp80TTmA++/HdQHNkZn++Yu6UxMb4=;
 b=dLbGuI70ypmQElaLOtweo0Sda+uh715AnznNXIELDY0C4pafivp94TAVyj35FaaUFs
 zsLYqgFIZU897GHO88GWdRggNxcW0mFOo3HJxU6ZNJYDnCsPTpYpkeFhYsGIpuKljt5S
 0QNM5t5oGIvIRkU9Sw2jt+XbS9M3BBH9/tpL5IoYCYHj30skqRU99Odt40uxG5wTjPi+
 mWRz3Hdp6sOOAVfudXlyxkn4EceQFwrN49Xa+yKVXkcqqHlCWON1fXHI+JEsAdEfBcku
 MXFkj6ncAq+WmpMCQ/VFpudQPVqBvnAW8HVtIOdnosvvjSIQOCpnwZN3TK/rZa6JwdLf
 mShA==
X-Gm-Message-State: AJcUukdJmGQ8ER3flE9Fy5Sr/eYmuNpWVCI9jsMTCmaV75r67OZbgMsd
 AFuJhMWF9Hwwgl6M5VKQ5bodndZhKpW0csZOCMPmbg==
X-Google-Smtp-Source: ALg8bN630wZQkEfA1ervkuHfur0b+l+K7sC+fVgYn2lNJbMq1f9CXY4BrTpmD7J18PUdTFZGmwt/lO7w4Azy1FYcJ4I=
X-Received: by 2002:a6b:8b0a:: with SMTP id n10mr5502183iod.2.1545536264232;
 Sat, 22 Dec 2018 19:37:44 -0800 (PST)
MIME-Version: 1.0
From: Matt Avery <matthewaveryusa@gmail.com>
Date: Sat, 22 Dec 2018 22:37:35 -0500
Message-ID: <CAJp+990eMsXR1hVwY9Vdtjtz+6d=1SrR8iPHof=9-XaKj9ZZXg@mail.gmail.com>
Subject: Is udp data corruption over wireguard possible?
To: wireguard@lists.zx2c4.com
X-Mailman-Approved-At: Wed, 02 Jan 2019 20:26:46 +0100
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
Content-Type: multipart/mixed; boundary="===============2889864837341972497=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============2889864837341972497==
Content-Type: multipart/alternative; boundary="0000000000000462f1057da8344f"

--0000000000000462f1057da8344f
Content-Type: text/plain; charset="UTF-8"

It dawned to me today that if I write an application that sends udp
datagrams through the wireguard interface that corruption of the data
within the datagram is not possible even if I decide to zero-out my
datagram checksums (assuming the datagram doesn't get intentionally
corrupted within the kernel.)

Is that assumption correct?

Thanks,
-Matt

--0000000000000462f1057da8344f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:monospac=
e,monospace;font-size:small;color:#000000">It dawned to me today that if I =
write an application that sends udp datagrams through the wireguard interfa=
ce that corruption of the data within the datagram is not possible even if =
I decide to zero-out my datagram checksums (assuming the datagram doesn&#39=
;t get intentionally corrupted within the kernel.)</div><div class=3D"gmail=
_default" style=3D"font-family:monospace,monospace;font-size:small;color:#0=
00000"><br></div><div class=3D"gmail_default" style=3D"font-family:monospac=
e,monospace;font-size:small;color:#000000">Is that assumption correct?<br><=
br>Thanks,<br>-Matt</div></div>

--0000000000000462f1057da8344f--

--===============2889864837341972497==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============2889864837341972497==--
