Return-Path: <SRS0=xahJ=XF=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED388C49ED9
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 10 Sep 2019 18:53:04 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 70CF32084D
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 10 Sep 2019 18:53:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="LeXBsThp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 70CF32084D
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fcd5c6f2;
	Tue, 10 Sep 2019 18:52:47 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 725ac14a
 for <wireguard@lists.zx2c4.com>;
 Tue, 10 Sep 2019 18:52:45 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4b22bd39
 for <wireguard@lists.zx2c4.com>;
 Tue, 10 Sep 2019 18:52:45 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 12ce3391
 for <wireguard@lists.zx2c4.com>;
 Tue, 10 Sep 2019 18:08:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=+AMjmJvEf0lJN5Ozd1V0LuygYIY=; b=LeXBsT
 hpZl7IQAkLFOz4a8XYwX95ZLS9zZKAX2RgWDIPmfmQU0mv8ioGxU5BKEVvx1+3bv
 FB8VlWQ4g+ABsvuzaQGGrJIO08klsHnm9Taw/Zt0oTsDPoH2QTTir1odaFHgYgCE
 2KHiNkOBNBeXYk0Cs4MW/Fys84aODJbaqYS03pMqj4ODdC/VNZQkUj6O1yGQSleO
 cC6YGnwVGwbbwst4H4Vqpzdx31Fg1hnleAyPdgKBw0zUDIXnU+yw2T0e1imcVUMt
 OLen3u6leOm/KHnJOxl0tWjc8/S5NTmuDPjszjF075frggT9V2M1Kkfhdja7KOBX
 ZkPBdgOtb0BBqzEQ==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id f69f4cb7
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 10 Sep 2019 18:08:52 +0000 (UTC)
Received: by mail-oi1-f181.google.com with SMTP id 12so816305oiq.1
 for <wireguard@lists.zx2c4.com>; Tue, 10 Sep 2019 11:52:44 -0700 (PDT)
X-Gm-Message-State: APjAAAXIFoLS+KYd5Q/p/Tz3h2/hceqwbMCdkQi2ox8pK4Ua2qdzdLL9
 ubD7hhhzmUjie+ZtTut74ULQquuO0ekabyb7H38=
X-Google-Smtp-Source: APXvYqzHyRIvG3+uZAFlI8uV87Ve0xXdjLnn1OJT3L9fcgTXs9+d9Hdr5rd8oCXl2NybW+l8JHf5ZZDyfWH+sjdmA/s=
X-Received: by 2002:aca:6083:: with SMTP id u125mr818906oib.119.1568141563445; 
 Tue, 10 Sep 2019 11:52:43 -0700 (PDT)
MIME-Version: 1.0
References: <87zhjc3rzr.fsf@fifthhorseman.net>
In-Reply-To: <87zhjc3rzr.fsf@fifthhorseman.net>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 10 Sep 2019 14:52:32 -0400
X-Gmail-Original-Message-ID: <CAHmME9rkuwVHo1Egq9r0vtOdR5yJ0xes3_WEWb3ncVnPhXwbmQ@mail.gmail.com>
Message-ID: <CAHmME9rkuwVHo1Egq9r0vtOdR5yJ0xes3_WEWb3ncVnPhXwbmQ@mail.gmail.com>
Subject: Re: wg-quick invoking resolvectl instead of resolvconf on systems
 where that is appropriate?
To: Daniel Kahn Gillmor <dkg@fifthhorseman.net>
Cc: Willem van den Akker <wvdakker@wilsoft.nl>,
 Michael Biebl <biebl@debian.org>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
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
Content-Type: multipart/mixed; boundary="===============0904882309284496111=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============0904882309284496111==
Content-Type: multipart/alternative; boundary="000000000000d8c94a0592376878"

--000000000000d8c94a0592376878
Content-Type: text/plain; charset="UTF-8"

The standard interface for modifying DNS on Linux is resolvconf. It is for
this reason that systemd added the compatibility layer. Debian should
install the proper symlink. WireGuard upstream will support the standard
mechanism of resolvconf.

--000000000000d8c94a0592376878
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>The standard interface for modifying DNS on Linux is =
resolvconf. It is for this reason that systemd added the compatibility laye=
r. Debian should install the proper symlink. WireGuard upstream will suppor=
t the standard mechanism of resolvconf.</div></div>

--000000000000d8c94a0592376878--

--===============0904882309284496111==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============0904882309284496111==--
