Return-Path: <SRS0=pGg3=E7=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B8B4C56202
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 25 Nov 2020 13:04:53 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 312B3206F9
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 25 Nov 2020 13:04:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lindenberg.one header.i=@lindenberg.one header.b="s88s+vqT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 312B3206F9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=lindenberg.one
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 88064fc8;
	Wed, 25 Nov 2020 12:58:56 +0000 (UTC)
Received: from mailarchive.lindenberg.one (mailarchive.lindenberg.one
 [5.45.107.185])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 6cfc3066
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 25 Nov 2020 12:34:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPA id 5E33F28F33D
 for <wireguard@lists.zx2c4.com>; Wed, 25 Nov 2020 13:40:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lindenberg.one;
 s=dkim180429; t=1606308026;
 h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=EoH1OyaTQoYk6eF+k0dWeW5Hsba1UHln3wwOVtaBWFk=;
 b=s88s+vqTSGQWfyJy8iQOWO+aUFJygI9hdwBFwrmosc1ZkEySoAgIZw6DLoHwtECUE1Yy7W
 52RTmBEyuS6NxbmAFnQgAqFRLlcqWMu9V3tFX2MUhhO/Jk/ksPf+Get7cle81pV9cG0F7B
 okkWjJnuA7ODCEoLdBSdKE952132hBVYENOfz8sJtWP5X8814Wr75ZCpPKyMqTZe8cLM8A
 7al4uPEb2OE5q94aTbvuWmiWO3AhYpcejNsqayHSdxxhUOGlSY+DLvGpyTY7B8rL1gzZ5l
 L/ZCS3SZd+Swm9iTyKe53cZeJ+jYTONmpGhz+q+BIbJeM0/hDFoMsgSYF2JRig==
From: "Joachim Lindenberg" <joachim@lindenberg.one>
To: "'WireGuard mailing list'" <wireguard@lists.zx2c4.com>
References: <CAHmME9riWVidRXjORFebv+UF3GyG1Hv+OrDhf4njvhGyQNw=4A@mail.gmail.com>
 <C7BW4WL2LWMH.1A1WYJLENDO9Q@enhorning>
In-Reply-To: <C7BW4WL2LWMH.1A1WYJLENDO9Q@enhorning>
Subject: AW: Using WireGuard on Windows as non-admin - proper solution?
Date: Wed, 25 Nov 2020 13:40:25 +0100
Message-ID: <02ff01d6c328$2635b350$72a119f0$@lindenberg.one>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Language: en-de
Thread-Index: AQFhma/XvtbQSv3YAUIcf84wmWKxcKrDHBBg
X-Last-TLS-Session-Version: None
X-Mailman-Approved-At: Wed, 25 Nov 2020 13:58:54 +0100
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

On Windows home you can almost safely assume the local user is member of =
Administrators, thus testing for membership in S-1-5-32-556 (for Pro and =
up) or S-1-5-32-544 might do the trick.
Regards,
Joachim

-----Urspr=C3=BCngliche Nachricht-----
Von: WireGuard <wireguard-bounces@lists.zx2c4.com> Im Auftrag von =
Riccardo Paolo Bestetti
Gesendet: Wednesday, 25 November 2020 00:43
An: Jason A. Donenfeld <Jason@zx2c4.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Betreff: Re: Using WireGuard on Windows as non-admin - proper solution?

On Sat Nov 21, 2020 at 11:05 AM CET, Jason A. Donenfeld wrote:
> Hi,
>
> Check out the recent changes in git master, still under development,=20
> but functional at this point:
>
> https://git.zx2c4.com/wireguard-windows/about/adminregistry.md
Please note that unfortunately the S-1-5-32-556 group doesn't exist in =
all Windows editions. For example, it does not exist in Windows 10 Home.

The general idea is fine, and that group could very well be the default =
one; however it might be useful to also have a registry key to pick a =
different SID.

Riccardo P. Bestetti


