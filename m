Return-Path: <SRS0=7A7E=3U=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67484C33CB2
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 31 Jan 2020 09:19:00 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C3F2C206F0
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 31 Jan 2020 09:18:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h6TL2yh0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C3F2C206F0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d1f9f3b8;
	Fri, 31 Jan 2020 09:18:05 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 810d3596
 for <wireguard@lists.zx2c4.com>;
 Fri, 31 Jan 2020 09:18:04 +0000 (UTC)
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4ed53815
 for <wireguard@lists.zx2c4.com>;
 Fri, 31 Jan 2020 09:18:04 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id w1so6368616ljh.5
 for <wireguard@lists.zx2c4.com>; Fri, 31 Jan 2020 01:18:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=X1GmIo8PxNRxUkerw3fAYv9Kw7cbY8HJbcN6wIjoyg4=;
 b=h6TL2yh02HDvHQBXh5d4zPrYhqC5D5Xkbyco5sMYkNpv91ZoiX6igyFWiEkdyQm6G7
 uyPbHfcJ9YA+jjVNkocBwfxYQWnWkmm8y2gJg1B4xzqRweEOyroTgkBi3rsyP9cLL+cE
 Akm8GAmEoh28RUKEYXuZSCfmAtt+3SjVDe/gQYPstpAzp4gjV224rU03Bvk7cgpSgSkc
 YRABhMH46TrozIpS9KjlbDNOdIN/L/CYItZArPBUO/jDbOfeYmCzw60+cw9n2uGQ4mXu
 gH58m+xyMMiIwVbrapuTZoz+X2WA7csWCeQATetx8zmIp+qwfaluJZ0mkvD/+ywkCbhF
 D8uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=X1GmIo8PxNRxUkerw3fAYv9Kw7cbY8HJbcN6wIjoyg4=;
 b=tcoQK3iFvSkOih5MsdCwRxafcaI2uZeffWqlRB897Ao6nlkmZLlYhbzHgfyd71P76S
 slea/Eu7O83lLkkr+yO+n9m3jjfVh3wJaO15KrJvO4t83GGCN3h6tqkmmdZfguURwPiX
 HrO4L9dB8NTDIN9Z825MTm3J4z5A8uFOQqneVCq1Qp8pcfJGFEpyDQh6J7D6JZJE7CeY
 7x72lBO1w9QufPWMPNYtakc5yegDewRlvcmyORQiVfC243XkBTMx2F9MnNez1UplODPm
 rbpKOPVd6eIUvZnx54ojr/OzgUBd4ixCJCUfLE0BbPJ4lA0a1+UAZPpc+Xzq+wGDlLDU
 MZaQ==
X-Gm-Message-State: APjAAAX79VEsW9GaY9TvEgF/lJ5LLR3VM1RJq5y0dEm5xiT1cdAI+ySp
 Cx7sUyjo5If274YTbmxzTIQhOQV1sidpgpggURqKwpFbWvA=
X-Google-Smtp-Source: APXvYqwfU6llI0EaZ5dEQyHkgDKyVkh9vVrW/e9boHfkVo9gSRPiVJamK7rKtILJdv3RkfYD9PhaMF9tejqMKc27qsk=
X-Received: by 2002:a2e:87ca:: with SMTP id v10mr5056134ljj.253.1580462298682; 
 Fri, 31 Jan 2020 01:18:18 -0800 (PST)
MIME-Version: 1.0
References: <20200123111825.17435-1-ilie.halip@gmail.com>
 <CAHmME9rTD=zCpw5fkw-baUHBuutWzg18aJ-8KvnPHzNpJDTNHw@mail.gmail.com>
 <CAHmME9pcSBi6XJn0AUHg6YPD+nBCm8pnhS6QC-Dz4Md5YX_dxQ@mail.gmail.com>
In-Reply-To: <CAHmME9pcSBi6XJn0AUHg6YPD+nBCm8pnhS6QC-Dz4Md5YX_dxQ@mail.gmail.com>
From: Ilie Halip <ilie.halip@gmail.com>
Date: Fri, 31 Jan 2020 11:18:07 +0200
Message-ID: <CAHFW8PQ3=-f4aSxfSj1DEPxiM_yJgyiVubLmFdbGxYUDA_ST-w@mail.gmail.com>
Subject: Re: [PATCH] compat: support building for RHEL-8.2
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Hey Jason,

> Do you have any idea on RHEL8.2 release date?
RHEL 8.2 should be released sometime in May 2020 (6 months after 8.1, which
was back in early November).

I was also torn on introducing that macro but since some users wish to run
the newer kernel, I thought it was a good idea to support both.

Thanks,
I.H.
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
