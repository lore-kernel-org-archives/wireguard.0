Return-Path: <SRS0=23NU=3L=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC7D4C2D0DB
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 22 Jan 2020 19:54:00 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6DCF221835
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 22 Jan 2020 19:54:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g0MeI8vY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6DCF221835
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3828ebfd;
	Wed, 22 Jan 2020 19:48:19 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1048a79c
 for <wireguard@lists.zx2c4.com>;
 Tue, 21 Jan 2020 16:31:46 +0000 (UTC)
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f9befd3c
 for <wireguard@lists.zx2c4.com>;
 Tue, 21 Jan 2020 16:31:46 +0000 (UTC)
Received: by mail-io1-xd33.google.com with SMTP id b10so3459037iof.11
 for <wireguard@lists.zx2c4.com>; Tue, 21 Jan 2020 08:31:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=PLRQmXGZo0+zbGladb3n6S1sTuFQfh1hSHMSbqQ9mDo=;
 b=g0MeI8vYPSL34PzFAzFrkiSuLR3nKbKJ+pqqzG3E9ei5hfjLUx6t/aGvKeATEEuQpH
 lGX/2m91Za8a+Eho/4REtk6zPhqA3sdztY0N+1AQZEKyKwvqhbwkX07mwCKt3Q/nnNax
 tFv9662NCcT9AMBS5YBz3H1p9RftcgSep0rE9k9ZQobvQ9RGKiXJhyESQepIS7UbjjM5
 keyMiS3sdXIttYN0IeSNACcYGPdheBoinsZpP08jludpO8igTPkah+tvssOVxnUryVXB
 TKp1BJzLax8PSIL9Qh1/3BLOcRO0scD+uf/hIhGabqA5tIk+U/0YNgtR6JD23xZienCs
 I1UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=PLRQmXGZo0+zbGladb3n6S1sTuFQfh1hSHMSbqQ9mDo=;
 b=rH7Q3Lc8mwS28ZTgoc/pXMRX01M2gHRveHdm3+g5bx48WVnkyksaA6zc9SxXnqTShW
 hAeuFFMbzkvDHv0TlPlVd7VBCk1WJC1aO2hgHXXGOCHypwWez/cgvPzwMTUySIkxpBvK
 Zj10zA7/tbiqR9bV7sgEmhEDKVkNBTD2mL8RuDUPKfqb8Wtrhj4Cd/ZyGMVDcc0hD0Rc
 OVuFeF6h2d1u1tkAVBsAwAHXGBllWFBCxTBPyYTUqH36kxHjKNVuX4WWuhCV5uPmClSS
 bMTEUSl5kO6ZiamE01n6XXekB4IS1oCRtWmeQwc+QfFTUEvL6jlM9CEGXuohxIFIAdpW
 DAeg==
X-Gm-Message-State: APjAAAV8PZXSX1lOsnlLcfnVaCB5Q8LoovizUoJYTJR5jRY6wsROCntf
 fwCr/C7OVMHiuDrtoI3K/LI//zeDG53Ud2YiPG/IGA==
X-Google-Smtp-Source: APXvYqwWeq3DsYW8/qjYFIBTH1N9EUIv184eHE2lRkPLYkX3/PA96GR/lKPKDu+uViPsmOGwb9JpsizfyazgobOtfAs=
X-Received: by 2002:a05:6602:2591:: with SMTP id
 p17mr3816809ioo.38.1579624305233; 
 Tue, 21 Jan 2020 08:31:45 -0800 (PST)
MIME-Version: 1.0
From: David Ventura <davidventura27+wg@gmail.com>
Date: Tue, 21 Jan 2020 16:31:55 +0000
Message-ID: <CA+UPfZ6i3OuMVZ+4TiY5Rv+NtJ0T=mk5Hp27ah-K6kiiF97xxg@mail.gmail.com>
Subject: Split DNS in android app
To: wireguard@lists.zx2c4.com
X-Mailman-Approved-At: Wed, 22 Jan 2020 20:48:08 +0100
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
Content-Type: multipart/mixed; boundary="===============2791280156257801693=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============2791280156257801693==
Content-Type: multipart/alternative; boundary="000000000000979388059ca8f1ef"

--000000000000979388059ca8f1ef
Content-Type: text/plain; charset="UTF-8"

Hey

I'm having an issue when moving between a regular network and a network
with split dns for my wireguard endpoint.
My problem is that the endpoint will not be resolved again when switching
networks, requiring me to turn the tunnel off/on to re-connect.

Is this use case something that can be addressed?

--000000000000979388059ca8f1ef
Content-Type: text/html; charset="UTF-8"

<div dir="ltr"><div>Hey</div><div><br></div><div>I&#39;m having an issue when moving between a regular network and a network with split dns for my wireguard endpoint.</div><div>My
 problem is that the endpoint will not be resolved again when switching 
networks, requiring me to turn the tunnel off/on to re-connect.</div><div><br></div><div>Is this use case something that can be addressed?</div></div>

--000000000000979388059ca8f1ef--

--===============2791280156257801693==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============2791280156257801693==--
