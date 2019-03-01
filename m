Return-Path: <SRS0=/nf9=RE=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7B9AC43381
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  1 Mar 2019 10:08:58 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 603F42186A
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  1 Mar 2019 10:08:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DOxeNxqx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 603F42186A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2750d48b;
	Fri, 1 Mar 2019 09:59:08 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6b73a092
 for <wireguard@lists.zx2c4.com>; Fri, 1 Mar 2019 09:59:06 +0000 (UTC)
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b48d8b54
 for <wireguard@lists.zx2c4.com>; Fri, 1 Mar 2019 09:59:06 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id c17so8084657plz.13
 for <wireguard@lists.zx2c4.com>; Fri, 01 Mar 2019 02:08:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kgrTXkfQjGRFYaGpIbrk0EXmbiiihUYpSJVTeMbPIhQ=;
 b=DOxeNxqxjVi0gwZ+LzxgUP74eFH5KTqpEw9SO1B7dgnOk3jhf8ugHS1mrBSHxQUVr6
 e/89oSTfhJrlVa4cZlhtGJZMWh2WKKmAlopZfwUhczRAwmkUQkeXbH7+I5+9Y04Ofp5u
 WdJSti7+i+l1iBxQJSrmrnr6eD4P416k40EkoOygsjSVwJasLSNC16Bt8W60+sbArGIl
 wYUO5wTA1JdjHVx2s9Dsz/NraB5cA1bPzR0QpAAn506TlnQPoSfqyLyLkgj891/1w8/+
 P0kn++VNdmY+b/Wpev52WNtgBpLj8Qz/MT0xRFkvOqNJRzDeMCndOGvfO9bi6P6sImsD
 VQ+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kgrTXkfQjGRFYaGpIbrk0EXmbiiihUYpSJVTeMbPIhQ=;
 b=WzOvx46W9XMkqH9oB8xQkfHkgiq1fdliNNMWkOsXouBTWMRL+Ig47t0m8eDmAS9hcw
 MnNGwms/Xz0CqPKYBDo1oZmkIzNLL4zcY0XWkihu2L2rreb8QsMPbPgXfEZmjro+oIyO
 h6L4sF759bIWPHR+qEWPbipey7zERTxe+/Rhx9plKfoOrsnAe9ufq1QPNTwNIPj9yhmC
 1ZSGJkmpiPYUxC7KyE6dHZWlJHhhJAVth8ekGQBuNWuzGB53ImDGnipvdx6qcwvq3Hq+
 pJqxNtPtB+uTl35Jd4SDLpNEaHqXoUngHRyHkxGNplGlLhFTsdfYTFRiNBhrBo44/i3z
 2oHw==
X-Gm-Message-State: APjAAAWTs2RbZX2C5kCdkEQ4T7Uyzf7DM7lfJAtVw6KVFCy1n7Pwd8u5
 Nu/+CMPvA4Cjfhq/yOk7OGK7llYXkd8rShMDaOs=
X-Google-Smtp-Source: APXvYqywZ94VCEuhKwRKYX3bDyvo1Gv+qZZBLv4YIcSVaJeH5r5p0vJHwTPOdO1JkjxvXbjdR+bokq0H6wDajiUEmHY=
X-Received: by 2002:a17:902:9683:: with SMTP id
 n3mr4677537plp.333.1551434934358; 
 Fri, 01 Mar 2019 02:08:54 -0800 (PST)
MIME-Version: 1.0
References: <zk1gAdr9rlJCh4vzh4DYSc11v_Ja4r_9xYurdAcwFsa50g2zMxHskd5Nb0leXZKUZrCqV3YIZFI5pNYptUGXTyQBIl5zWoF_N306lQKO_tg=@protonmail.com>
In-Reply-To: <zk1gAdr9rlJCh4vzh4DYSc11v_Ja4r_9xYurdAcwFsa50g2zMxHskd5Nb0leXZKUZrCqV3YIZFI5pNYptUGXTyQBIl5zWoF_N306lQKO_tg=@protonmail.com>
From: Kalin KOZHUHAROV <me.kalin@gmail.com>
Date: Fri, 1 Mar 2019 11:08:43 +0100
Message-ID: <CAKXLc7dop2Q7cS0FJ=c0fA4os6HTZQHWuuqPxzb4bygsiRNu6Q@mail.gmail.com>
Subject: Re: iOS WG Battery Life
To: kolargol <kolargol@protonmail.com>
Cc: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
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

On Fri, Mar 1, 2019 at 11:03 AM kolargol <kolargol@protonmail.com> wrote:
> I am testing WG on varius OSes and devices and I have noted severe battery drain on iOS (12.2, iPhone 8). Typically battery drops 40% during night-time (that is 7 hours of inactivity on the phone) when WireGuard is engaged.
>
Compared to how much during night without activated WireGuard?

> Is this some kind of known issue? I did not had chance to test previous iOS version without SIMD ChaCha20 support so i cannot tell if it is becouse of the last update.
>
> Anything i can do to track issue here?
>
Is there anything using the interface, or just wg keep-alive?
May be try to change the keep-alive to a longer period.
Also (and I have 0 experience with iOS), a keep-alive packet my wake
up the phone, and let it stay awake for some longer-than-needed
interval (e.g. 5 minutes).
Try to have a look at what actually eats the battery: CPU, radio, screen?

Cheers,
Kalin.
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
