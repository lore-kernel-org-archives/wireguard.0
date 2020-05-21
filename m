Return-Path: <SRS0=2ld3=7D=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FORGED_YAHOO_RCVD,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34D78C433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 21 May 2020 23:21:22 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7AFC6207D8
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 21 May 2020 23:21:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b="StOkGLyD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7AFC6207D8
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=yahoo.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a56fa1dd;
	Thu, 21 May 2020 23:06:23 +0000 (UTC)
Received: from sonic308-8.consmr.mail.gq1.yahoo.com
 (sonic308-8.consmr.mail.gq1.yahoo.com [98.137.68.32])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 3d8900ff
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 21 May 2020 23:06:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1590103260; bh=vH2XJfbzAO6CBryIZsvKZwZUUajDSFdm86i4l6ntovE=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From:Subject;
 b=StOkGLyDgjHnxfiF0q5oezsRHz6gJrAUJvU43bI03pco7dHrc7PKw/uQrUwUFyhAXRIwSO9e4xb7oWMqXHY0oCrALmH8viPFUuKXwr07MdmnuiXkFMoWeg4D6yGsWkHz4fV0kZcJJslnKlmmJLRWBsamRf3Vj/6JEvUYLenm4S00LEj7/yMtZXsvX2+H4zXuHX3mtQT8LYlZfDQxBnlSV5j7bTIAnPz5ewfe/SOodnE6JAqCgfty5ZrJLFqv3Nnvg870fXTTzTqKRyHNHCF3BpJynFBNKqRDCqdrIs5X3CIDh+T1R4c0bbWglVeJivLg7mFrietYPFA1S6xzznbdng==
X-YMail-OSG: ml0DBYgVM1n7KUM817oUKHcOzITcdvqrQ7YBaaKqmDhSDjasmF7LLKIQMvTvg_V
 EOE.bmdhIin8f0Dshg52WBKyqM31LXwjpJFUYW1tWMdFcav52DetEBD28qCiCsfqOS6WauDWTJXT
 4izoRJLsRBO6aIFFRlq_Akq4Q5.Y0ZIrGI_oAZBYkRE9yeRuK7jTiurrsg4a.4IhYC2OUROxV0u7
 Qm5KHc.JKB.VtpICerJIUXpkdWLULNXdks.XmkCPj9aMQML7R29vyEalK2obq0hS81Cc0nEEq_KI
 qfYP8BQJefDg7Sk9DfHoCmz_0yoOkCBftCqHEqCxVpRqf8N0IP8hmx2SPw2fF5Gro5l7Hr03veoe
 veoyM2dtg5G7ekOTuKLPti9WIXYq7WBBGjf3SR9owRkXjGVELD1ZJ1_moHJAeDDrPJNragQTbuUk
 GXMfh58E0nppdNX.APVfK2YwR8ZlagnggNVLsjegItosWQOPtWPlS.AwvZ6HYmVSt_hz5WIr2tuB
 2sXf6EG4C_3enySYHdlWuuaGe2SfI3DhW2cfULj1cT7dENDrBLkXVCpaF2NT7LBHK1WGvL33R7xG
 Ml6bWoWNQpMfafD0SZ_4LXMY7jBSY2bdXFPfERjq8tb2D53cUxuoIwY93lLVRWlWdMvm9lbruF5C
 qdSfur.NQZpuOnXLdmDkexTcxj1VYdKYcmV9ZEhNqtGOL8GLRTv4O.3jZO_z0_gEO5nLX1c1WrEY
 sLDjXw.RikXFBgTL03TNbvu2A91SuVYvvZunCyt88RlFFlGK18z9haVPNS32p03HIfeg_c5APTAK
 p8er7VcBCMKEjdfW7eEtgUQpcdLivbVEgysvNqoQTnPbaolWHZbNTdc.RfZmO_EVzLGzjM6qs6q.
 au4HTE4.a5jEPmsK6teyPgLxcNuBTuLYV6GdAvDZHeKG5TFToq3jRpg0m7MCfMTYltc6SoSGPadq
 XeXikwvMI48j8k6qfcwlQo0Q3czGVKv2uknJ35.6OJLvdcMhUZ6p7xVxQcxgMfxxy1k9BUMlZXme
 FFKURgcPp2wNq9YvX5jwDKe76CJhBNh5pePY4GW1Sus6OHQbMekOYsZWTDxWf19RQXeZfPEuWIhV
 pAxxhL_qbFPRsAOf8cF4Zy1GJ3iCPst.0rnAnQ8QBToE6kHL5taBi8zEr2dumG2ZKNeWXMVQpKAR
 Sh3yplP2hD0cIZTQvhjeDStCfJiqyHq.WE2t99fJ8G6SFf8PlApq2bvb05tLAW3Y.R1zgGgklZWn
 d86Ls7wF_d0wAUM6E_33LyNIO2dzJdQyk7GwBIOEZAlT06S6lhldv8ZRm3g--
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic308.consmr.mail.gq1.yahoo.com with HTTP; Thu, 21 May 2020 23:21:00 +0000
Date: Thu, 21 May 2020 23:20:59 +0000 (UTC)
From: Jose Marinez <jedi_papi@yahoo.com>
To: Harsh Shandilya <me@msfjarvis.dev>
Cc: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>, 
 Mehdi Sadeghi <mx@43.yt>
Message-ID: <1072606602.3100560.1590103259731@mail.yahoo.com>
In-Reply-To: <F7D8E321-F329-4639-883F-26FB1521ACB3@getmailspring.com>
References: <1797380096.2767339.1590070967097@mail.yahoo.com>
 <F7D8E321-F329-4639-883F-26FB1521ACB3@getmailspring.com>
Subject: Re: Shouldn't devices tethered to a device using Wireguard share
 the same IP?
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailer: WebService/1.1.15960 YMailNorrin Mozilla/5.0 (Macintosh;
 Intel Mac OS X 10_13_6) AppleWebKit/605.1.15 (KHTML, like Gecko)
 Version/13.1 Safari/605.1.15
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

Thank you. I will try it out. Fingers crossed!!!







On Thursday, May 21, 2020, 10:29:12 AM EDT, Harsh Shandilya <me@msfjarvis.dev> wrote: 






On May 21 2020, at 7:52 pm, Jose Marinez <jedi_papi@yahoo.com> wrote:

> Thank you so much Harsh. What's the best way to make my kernel
> available to you? Even if you could allow me to push to the repo I
> wouldn't know where to save it.


The repo is maintained on GitHub so you will have to fork the repository
and create a pull request with your changes, help.github.com has very
beginner friendly documentation if this is your first time around this.

The process for adding a kernel is a bit involved and the documentation
isn't quite fleshed out. You can check the steps out here[1] and an
example of adding a new device to the repository here[2].

1: https://github.com/WireGuard/android-wireguard-module-builder#adding-your-phones-kernel
2: https://github.com/WireGuard/android-wireguard-module-builder/pull/3/files


