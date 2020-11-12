Return-Path: <SRS0=GTIq=ES=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC88FC5519F
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 12 Nov 2020 17:38:43 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E629921D40
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 12 Nov 2020 17:38:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UUDOTmGf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E629921D40
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9ce0cc46;
	Thu, 12 Nov 2020 17:34:42 +0000 (UTC)
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com
 [2607:f8b0:4864:20::12c])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 9f4bb513
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 12 Nov 2020 17:34:39 +0000 (UTC)
Received: by mail-il1-x12c.google.com with SMTP id k1so5999127ilc.10
 for <wireguard@lists.zx2c4.com>; Thu, 12 Nov 2020 09:38:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:reply-to:from:date:message-id
 :subject:to:cc;
 bh=qdJo88WHZ3ygQFj5r05Qt+oa6n8DKRTart/7jypJUNI=;
 b=UUDOTmGfcH37xzRU1NMac/6OwfJgs7kL6f8fhnoIOAs+HLYgIlnTucF2j/4N8oq9y3
 JOAMxS4NFwueTblN7HbzUoeEnHnZ4jU5j4GWWeMkD7jBC6se1SS9mbWdC0i2Tp6FeFzl
 8gpg7lHkJ0Ht3Cwz0oWfqA6RKNKwTtenwXZUaBZdheThygLm6mjY1Am2vMmHvgHwDzra
 qDDJQ0y2AqCwIbYTc5Fzo2aWc/GuWGbboG3qOZYyhOUTA4fsek+JHlgMoy8h0SlJ0blu
 3nY+IvqDhsJRd8u8Xa33zZ522djEnipj44nlN+3cxo/0gYJ7r8xV6+/KQQcL69ZT6r+r
 8x0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc;
 bh=qdJo88WHZ3ygQFj5r05Qt+oa6n8DKRTart/7jypJUNI=;
 b=ttgkv3RjvHGtFDPgHvWxisE+6xOoHk5+mY4lVa5XJAAli08soa9oOy6BC9SK9QbiqN
 GRAdLGhmCv8mZmeGTF397Rqe63DGoV/iVUZnnSaEXdPJ7q8LyXjFf8inBUuh2U0xsPnn
 MVvl0EDucbGo6iIBetNqAEd5KYctokXJuMzxYmCAV23yGg4OVt5cfVgV+0y6kqRoyHZ3
 ajI9N49pJQnE1ykkoJgCXB+SXyWqcmdNV6Hr8KtdoM0yGEyP2BAx9v0DMWAKWZE4x5zo
 WYIQw5wMqlUtbbkZpeZOmfFcCWX0fmA+N7byBVfyrx6KZq70SeRp0iKj/IZTvZZWOzRC
 7dtg==
X-Gm-Message-State: AOAM531MDmfwIxNf8B+hjCQgGT+al83XFeZvNh6olJ1TUF1in18NKALj
 BNxQ81CZ66jPfuRbnyp4j/e6gAKyR5jw9YYc5PE=
X-Google-Smtp-Source: ABdhPJwWjjTulodAsp9+W5VYaVEhcxK0fSwDxRCaHmbXCVMk7HPizl58SJISn1JqdD5SRBcmzHaRTyit03YQ4FFQeAE=
X-Received: by 2002:a92:9641:: with SMTP id g62mr551313ilh.166.1605202717558; 
 Thu, 12 Nov 2020 09:38:37 -0800 (PST)
MIME-Version: 1.0
References: <CAHmME9rW1e+rRc8q+-_eLR=U9OTn+Sn84ECJtGFY=Hjg8kzfEQ@mail.gmail.com>
In-Reply-To: <CAHmME9rW1e+rRc8q+-_eLR=U9OTn+Sn84ECJtGFY=Hjg8kzfEQ@mail.gmail.com>
From: Jeffrey Walton <noloader@gmail.com>
Date: Thu, 12 Nov 2020 12:38:26 -0500
Message-ID: <CAH8yC8=tJD0ZKKTsRjynTqusRWr3m8YL0xoLNJe8AcR2BAHu4A@mail.gmail.com>
Subject: Re: Should we sunset Windows 7 support?
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
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
Reply-To: noloader@gmail.com
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

On Tue, Nov 10, 2020 at 7:29 AM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> Windows 7 has been EOL'd by Microsoft since January of this year. It
> is no longer receiving security updates or fixes. This email is to get
> the conversation started about doing the same with WireGuard for
> Windows.

Microsoft does not determine when an operating system is obsolete. The
market does.

Windows 7 still has a 24.79% market share.
https://www.netmarketshare.com/operating-system-market-share.aspx.

Jeff
