Return-Path: <SRS0=pGg3=E7=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B9F2C56202
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 25 Nov 2020 13:08:33 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 34B26206E5
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 25 Nov 2020 13:08:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="2bD2fMy3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 34B26206E5
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2c58d6c9;
	Wed, 25 Nov 2020 13:02:40 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 81748904
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 25 Nov 2020 13:02:38 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0bdca3af
 for <wireguard@lists.zx2c4.com>;
 Wed, 25 Nov 2020 13:03:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=rWV0+72u1dF+goMND3OElm3MT7I=; b=2bD2fM
 y3FeGPyNIierHyduOn6rWflDt6/Yv58VvU7HXuMJMTr2/vrjPXbxQ9D/HQKuTM/8
 aFwoTZtoZ6GGSZnVT0nC1pg514A4Mi+F5z5x6TtxblrV3Sq+hgDNdO4PcO6lBSWi
 2rpddqfF+VQVRrT4ThflTroouOcFdEjRWUF2PLBHkAdprQGfGuBbyZitxXxIuihG
 N2MPU+6IKALwkpJyacg5QfLKFldTYHUoNj7drOOyEq79PwbvHSI+l7iu8oW5+mym
 gRH36+Yk4kY6Vb4lC3YjWmt0W2NpO1lOx2LeHq0+xs/+rJmt6D0qQHF31V/C0uqR
 fMuUekyUmdzFizNg==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 38cef989
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 25 Nov 2020 13:03:24 +0000 (UTC)
Received: by mail-qk1-f181.google.com with SMTP id x25so2945407qkj.3
 for <wireguard@lists.zx2c4.com>; Wed, 25 Nov 2020 05:08:17 -0800 (PST)
X-Gm-Message-State: AOAM532ShC5p3190r+jCcJ6jQpwQnU1zRaDyye6ljtmcfbTHkSW3Ga21
 DRb54/UZLLYuXxwfOP4K3q8F/7hXnLH4hSldQn8=
X-Google-Smtp-Source: ABdhPJzwmtIzHzWHnjvOEzBMe/yZEghYMHF8dCvmbxnOycd2W5VolmdwvpAFlP+EP5YHdY2n2M6do5IVwwSujL0FxMs=
X-Received: by 2002:a25:2054:: with SMTP id g81mr4116270ybg.178.1606309696806; 
 Wed, 25 Nov 2020 05:08:16 -0800 (PST)
MIME-Version: 1.0
References: <CAHmME9riWVidRXjORFebv+UF3GyG1Hv+OrDhf4njvhGyQNw=4A@mail.gmail.com>
 <C7BW4WL2LWMH.1A1WYJLENDO9Q@enhorning>
 <02ff01d6c328$2635b350$72a119f0$@lindenberg.one>
In-Reply-To: <02ff01d6c328$2635b350$72a119f0$@lindenberg.one>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 25 Nov 2020 14:08:06 +0100
X-Gmail-Original-Message-ID: <CAHmME9q5e05VdGcxroq2+PJSh50AVkc8OdWdJcO31TfBM03AKg@mail.gmail.com>
Message-ID: <CAHmME9q5e05VdGcxroq2+PJSh50AVkc8OdWdJcO31TfBM03AKg@mail.gmail.com>
Subject: Re: Using WireGuard on Windows as non-admin - proper solution?
To: Joachim Lindenberg <joachim@lindenberg.one>
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
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

On Wed, Nov 25, 2020 at 2:05 PM Joachim Lindenberg
<joachim@lindenberg.one> wrote:
>
> On Windows home you can almost safely assume the local user is member of Administrators, thus testing for membership in S-1-5-32-556 (for Pro and up) or S-1-5-32-544 might do the trick.

That accomplishes nothing. The full UI is already shown to
administrators. Riccardo's inquiry concerns the limited UI mode, which
is for the NCO group. Conflating the two groups doesn't make any
sense.

And, there's already a solution posted on this thread regarding Home edition.
