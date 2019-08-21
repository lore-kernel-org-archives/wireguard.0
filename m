Return-Path: <SRS0=EGLd=WR=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D3A8C3A59E
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 21 Aug 2019 13:15:09 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 903DA2082F
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 21 Aug 2019 13:15:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rcSZRUDS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 903DA2082F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 028a03c0;
	Wed, 21 Aug 2019 13:15:07 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5915a077
 for <wireguard@lists.zx2c4.com>;
 Wed, 21 Aug 2019 13:15:05 +0000 (UTC)
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com
 [IPv6:2607:f8b0:4864:20::82f])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 159cb403
 for <wireguard@lists.zx2c4.com>;
 Wed, 21 Aug 2019 13:15:05 +0000 (UTC)
Received: by mail-qt1-x82f.google.com with SMTP id t12so2910865qtp.9
 for <wireguard@lists.zx2c4.com>; Wed, 21 Aug 2019 06:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=n5LLhYdefd4TmYf9edY64Z5+29OTZhnlX7F7jTt4+XA=;
 b=rcSZRUDSWA4GJ3rbquyjwpcmDXMrj86FagELPPQtCq4yza6NIkWxwF9RVd254TrEpb
 UuY7y7bYSeisDoYuZTfvoWZuS2fLGcyMR+pnnsNTnHqhuoOCEbhCeoKxISCbQuA1AbvO
 6vyzwMw0GQt28Cmtq7iDbvHJyMOrJKSFyflhNCOQJ5RWHvb+ZR3k3upv1wtfWPUYaRY8
 8Aehk2XA4RpIlnT3Ik9kb6ZudPzdJUqQS737cKtC5nBccaIWcksm+i46Im0HG+ldV+vd
 dNu0kjHpuf0a9Ont7OQYWKAjV14W5KbGVIK9NqFC0IFfCOzwgUuqvo2BIXWmBH0lV8q+
 nFAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=n5LLhYdefd4TmYf9edY64Z5+29OTZhnlX7F7jTt4+XA=;
 b=XRdRSqlIqNQ6+WTacP9XAxRF+TqrjTxeKmSMVXoD2jLg6KPb6cEcD4smBLJwJtoGT4
 43Msw/lycca+kXPhHS/9hvZZ5mTdPV4p6+cfaZ6LJZH/MBhyXJd9URqnGiMzF4U9Jj0Z
 qZNzB8vJ/i2Kw5zB4IDeZvR102186eAkfOKg0L3MdPtLC7dpDSASLNDjUixQnQCi3kz8
 1ImqM36h77DI+CbU3KBanwMmQllL7X6I9dSu4h3joo0V4Dvdbnax5mE9j37PBKWDvS0S
 Fyh2tdNVuh8dyWLkLL5b9nWreIj4TwwyN/ID3XzpbGFUslcKGJkdgkOwDlP0ZmaRV/o+
 qaEA==
X-Gm-Message-State: APjAAAXOM54vtc3cDVLk1GWHaOonMt3wDu5GYbNDw6CnI0pL8uOe12XN
 p44qdOkEhjU3j9Q7nuEC1PEN2NHY+VFNIYzKwW9q3PuI
X-Google-Smtp-Source: APXvYqzjNrZffW0y/gY9zV4hA443kMbsZDFjU+wpJTwWG+xeqdI+5d9aP3gtDRGvrDbImIHQ6FJ2rer5cxVdl12EXF0=
X-Received: by 2002:a0c:fcd2:: with SMTP id i18mr4556734qvq.223.1566393304634; 
 Wed, 21 Aug 2019 06:15:04 -0700 (PDT)
MIME-Version: 1.0
References: <CAGyAFMWzGbheVD6iOm=UZxbkmHOWCPHq7QzCi3_BpGbZT4f2kA@mail.gmail.com>
 <CAHmME9pOPkhYnE2D7-RhSVyECosL8NcrhsAL05C9SPSYiqVG5g@mail.gmail.com>
In-Reply-To: <CAHmME9pOPkhYnE2D7-RhSVyECosL8NcrhsAL05C9SPSYiqVG5g@mail.gmail.com>
From: Lev Stipakov <lstipakov@gmail.com>
Date: Wed, 21 Aug 2019 16:14:53 +0300
Message-ID: <CAGyAFMUYDP3fXx4tvaCW+SLvPYSWeRV-+gUNc=9HBsWweCOOTQ@mail.gmail.com>
Subject: Re: Volatile in Wintun
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
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
Content-Type: multipart/mixed; boundary="===============4880338645647588556=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============4880338645647588556==
Content-Type: multipart/alternative; boundary="000000000000805e7f0590a05cca"

--000000000000805e7f0590a05cca
Content-Type: text/plain; charset="UTF-8"

Hi Jason,

we don't assume that volatile implies a memory
> barrier. We could probably switch to /volatile:iso.
>

Does it mean that hardware reordering like writes reordered after reads
on x86/amd64 and everything else on ARM are not considered to be a problem?

Should barriers generated by WaitForSingleObject / SetEvent be enough?

-- 
-Lev

--000000000000805e7f0590a05cca
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Jason,<div><br></div></div><div class=
=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">we don&#=
39;t assume that volatile implies a memory<br>
barrier. We could probably switch to /volatile:iso.<br>
</blockquote></div><div><br></div>Does it mean that hardware reordering lik=
e writes reordered after reads<div>on x86/amd64 and everything else on ARM =
are not considered=C2=A0to be a problem?</div><div><br></div><div>Should ba=
rriers generated by WaitForSingleObject / SetEvent be enough?<br clear=3D"a=
ll"><div><br></div>-- <br><div dir=3D"ltr" class=3D"gmail-m_574988589408956=
4801gmail_signature">-Lev</div>
</div></div>

--000000000000805e7f0590a05cca--

--===============4880338645647588556==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============4880338645647588556==--
