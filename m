Return-Path: <SRS0=Yiz6=SI=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFAABC10F06
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  6 Apr 2019 12:03:48 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 58AFC2087F
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  6 Apr 2019 12:03:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="INTuGRVZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 58AFC2087F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2be7e3a1;
	Sat, 6 Apr 2019 12:01:08 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d61544c0
 for <wireguard@lists.zx2c4.com>;
 Fri, 29 Mar 2019 22:16:19 +0000 (UTC)
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1165e9c0
 for <wireguard@lists.zx2c4.com>;
 Fri, 29 Mar 2019 22:16:19 +0000 (UTC)
Received: by mail-io1-xd2d.google.com with SMTP id u12so2992233iop.11
 for <wireguard@lists.zx2c4.com>; Fri, 29 Mar 2019 15:17:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=KrX1ndPp7T2yV9omBvlRGc/6G6z2G6KfQaOquKqVBDU=;
 b=INTuGRVZFax6zDVIU2KmFN5cbUC8OQp7McSEJDpQ1ogzBKFOwvUAMxSzLwKls07voa
 oXHYpwXDjid8qwtTh1s0IiqiwxLybaoifWTdCyYyOYteD/Qb3xnQTLYWcjomO78Kuq6h
 vj58XCumRd1xP+I5jOoIYHJVfMmsP3ueSGoOnjL24Ecw50Ou1mBgS8LTB3nflAvXb3F+
 DTF64FfML2I8il/u89KopZByGHbOwpZK/sC2EyqxPOsBq68zpLOrsrAyjSIN7BlkXol8
 DfFUhDP7o4wsicGPXhYquh+lhlNMjDJeThHjp/bScN0N1ifcqkbhBTLWBcDwZNL4USzn
 xbtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=KrX1ndPp7T2yV9omBvlRGc/6G6z2G6KfQaOquKqVBDU=;
 b=dwSqTsvI2rEkq662xYKMWzCIuUFYXvFYJWeWHApwDMzJycISkVh/rgYr7DXHgYODCB
 Jx21AGnscv5/Y5W1o8go5R256RVnl1AUUmDhiqyE64MD4OMo7iKkW47ddsyFtdsRIY2W
 h6D/AXx+3oggMO/+ceQ+e+Vg85asxEMsWyJxo2z+FoGGZXOrlons4RvWcfNjtXChEuze
 x6zXdlu0WgRQCDu8BrK9WcW1AW+7U/N/X56lM4z0U9P0wV25Q1UOkJeBlDLdb54DlmLj
 P+MbDeKa3+pOsW4OK+JAAcF85VGMBhnOwYHKW01PozJXe27PztMw2DfizCh3s6Xsdiq7
 G6nQ==
X-Gm-Message-State: APjAAAXvH+zzutK9haFC4kzV2G9uuT5xDIubG2N4Z1cuwnlD1EX3Y5r3
 +AR0fBFdgAnLpcuY8S+x3rv7Np+umvxzzKJu0vaOSZPV
X-Google-Smtp-Source: APXvYqzjaDsFCSB/s3QtfN3uLsWOEiNVNLMSFkCD+9fXz16+DWBCvEvESRJeCuuG0kwGRthXUwDOG9FxvuExpnHuV2E=
X-Received: by 2002:a5e:8e03:: with SMTP id a3mr35356774ion.126.1553897868442; 
 Fri, 29 Mar 2019 15:17:48 -0700 (PDT)
MIME-Version: 1.0
From: Terry Burgess <terryburgess604@gmail.com>
Date: Fri, 29 Mar 2019 16:17:37 -0600
Message-ID: <CAPoiM-3=bmSJOe0pGgTYv4bR=zRbXrOvQxHAAxqDKnfsrN+w0g@mail.gmail.com>
Subject: Ubuntu 19.04 'Disco Dingo' - No Wireguard PPA
To: wireguard@lists.zx2c4.com
X-Mailman-Approved-At: Sat, 06 Apr 2019 14:01:07 +0200
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
Content-Type: multipart/mixed; boundary="===============3746362208512741818=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============3746362208512741818==
Content-Type: multipart/alternative; boundary="0000000000007740790585430a61"

--0000000000007740790585430a61
Content-Type: text/plain; charset="UTF-8"

Hi folks;

Title says it all. 'Disco' final beta was March 28. I installed it on a
test machine today and found that Wireguard doesn't have a Disco PPA yet.
Will one be on it's way soon?

Cheers!

--0000000000007740790585430a61
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:verdana,=
sans-serif">Hi folks;</div><div class=3D"gmail_default" style=3D"font-famil=
y:verdana,sans-serif"><br></div><div class=3D"gmail_default" style=3D"font-=
family:verdana,sans-serif">Title says it all. &#39;Disco&#39; final beta wa=
s March 28. I installed it on a test machine today and found that Wireguard=
 doesn&#39;t have a Disco PPA yet. Will one be on it&#39;s way soon?</div><=
div class=3D"gmail_default" style=3D"font-family:verdana,sans-serif"><br></=
div><div class=3D"gmail_default" style=3D"font-family:verdana,sans-serif">C=
heers!<br></div></div>

--0000000000007740790585430a61--

--===============3746362208512741818==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============3746362208512741818==--
