Return-Path: <SRS0=x2E1=EQ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27125C388F7
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 10 Nov 2020 13:05:35 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 65A1F2064B
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 10 Nov 2020 13:05:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MTlIS1y9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 65A1F2064B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 725e8cc8;
	Tue, 10 Nov 2020 12:59:05 +0000 (UTC)
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com
 [2607:f8b0:4864:20::82f])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 894d34b6
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 10 Nov 2020 12:54:24 +0000 (UTC)
Received: by mail-qt1-x82f.google.com with SMTP id t5so8422547qtp.2
 for <wireguard@lists.zx2c4.com>; Tue, 10 Nov 2020 04:58:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YDboq6OTgyyg6Ut1gweBXJttt7B4AjRoe4qYddIg2qc=;
 b=MTlIS1y90u1/37DcVtQ20nfps/LMDmIqn7zAgE3zg6Jq7vXg5HcLEsw7/T6amCunaz
 J9/tzrUWCMb/DlM/hiOff65EieHhzPUP7jeTJpfzm1JHg3efkVpOygLhD2XlMPlDQkqY
 rLR8V3IoIew8pqbOYFOu9aGTfELRk2l5bBQ5auDwOI9XgSIVp9jGSiMUkL0ETquOD5tX
 lZFRp7jGBpAREy1IjE/7/oNRwrmZUmRvx3mcU+r+lJ5VDyS8bElu20SffA1jNzbT3qdt
 uARZXq4ywgT9WGtkSBIVowDc3u+TYpUlyyM/csvZL0RXp2fX8WWjy33g0O4AEzP3Nd4a
 MNPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YDboq6OTgyyg6Ut1gweBXJttt7B4AjRoe4qYddIg2qc=;
 b=PwRmrN8mdyshhzRgEMzpyx5B7ktmBhnPp5ctknEyGiH9pohPazlg6dpQevFmzxKYWO
 tPMtGvuSWAod3hxH4YwFJAh5KvhIlNoreosV+mK8Bz3Tu6qvo/TDStH3tqOIR26OC5wr
 VNJAYj47FenBslcjU5vWJbuE8NsM5PIXDT1UXsdfBZw7HkI/Hq6tfU+gJpeFK02+94z9
 OyN6S1A9iKYIZQWZbINOoQ/1ms16DtiougUX78zV8sEMHhgrCKBZsjQjtU6UW88qlCvs
 KwbWXaEqZRQgBrdNEm2a9IG1y8g9ED7DSBki8Wh8VEe1UFvDEXhguqGfhLZcGw1M2QNa
 ooeA==
X-Gm-Message-State: AOAM531Rr063KA1vPexIaQYXs4HGH/HnwYjl1BuAqtcRM7023iatJOzX
 7PlKNWy7nmMccOCPWWLNeLG1DPm4Z2nPqwIRQPEoEJOG
X-Google-Smtp-Source: ABdhPJz2C8AIEWtDyQbqQrUc5F8sLWkdf2EYu4kQFfNxiv9hT/LR5qqHmk7nRJjkOS//aD2iyD0vdFvbihRIwSLvOQY=
X-Received: by 2002:ac8:4e14:: with SMTP id c20mr18311092qtw.5.1605013085564; 
 Tue, 10 Nov 2020 04:58:05 -0800 (PST)
MIME-Version: 1.0
References: <CAHmME9rW1e+rRc8q+-_eLR=U9OTn+Sn84ECJtGFY=Hjg8kzfEQ@mail.gmail.com>
In-Reply-To: <CAHmME9rW1e+rRc8q+-_eLR=U9OTn+Sn84ECJtGFY=Hjg8kzfEQ@mail.gmail.com>
From: Isaac Boukris <iboukris@gmail.com>
Date: Tue, 10 Nov 2020 13:57:54 +0100
Message-ID: <CAC-fF8Q8VV7Y1-xPfU7XAfAsGddANfuB8i1oC7uYP9MJQix6yg@mail.gmail.com>
Subject: Re: Should we sunset Windows 7 support?
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Tue, 10 Nov 2020 13:58:56 +0100
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

Hello,

New to the list :)

On Tue, Nov 10, 2020 at 1:30 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> Hi,
>
> Windows 7 has been EOL'd by Microsoft since January of this year. It
> is no longer receiving security updates or fixes. This email is to get
> the conversation started about doing the same with WireGuard for
> Windows.
>
> Supporting Windows 7 is an ongoing maintenance burden. For example, we
> use SHA2 signatures instead of SHA1 signatures for our drivers, which
> is not something we want to compromise on, and as a result Windows 7
> users must have KB2921916 installed. But Microsoft never supplied
> KB2921916 via Windows Update and it removed all Windows 7 hotfixes
> from its webpage last year. So in order to keep supporting this, we're
> forced to add clunky disgusting code like this:
> https://git.zx2c4.com/wireguard-windows/commit/?id=b63957dc830e39c94844d2f0d32ba29575991e44
> Keen readers will wince at all the layering violations there. Do we
> really want to keep maintaining gross stuff like this? It makes me
> uncomfortable to have kludges like that sitting around in the code.
> Shouldn't I write an auto-downloader that then checks hashes?
> Shouldn't I build this into the installer? Shouldn't I.... waste tons
> of time supporting Windows 7 better?
>
> Probably not.
>
> But I know so many users are still using Windows 7. I'd like to hear
> from you to understand why, in order to assess when is the right
> moment to sunset our Windows 7 support.

I've had some experience in the past (~5 years ago) with VPN on ATMs,
and we had to support Windows XP at the time since the ATM software
didn't support anything else and was very slow to get updated (several
vendors).

Regards.
