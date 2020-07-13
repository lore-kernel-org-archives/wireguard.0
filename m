Return-Path: <SRS0=8LYU=AY=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97FF6C433E2
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 13 Jul 2020 04:06:47 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 369E72070B
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 13 Jul 2020 04:06:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="p2GC09ds"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 369E72070B
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f30c70c9;
	Mon, 13 Jul 2020 03:44:53 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 8cb68005
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 13 Jul 2020 03:44:52 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4affbeba
 for <wireguard@lists.zx2c4.com>;
 Mon, 13 Jul 2020 03:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to
 :content-type; s=mail; bh=a4SRArd9K9u5dsHLaFZg0zRBpVU=; b=p2GC09
 dscZGgB8/qlzSN9FB5U1BZrd6bgxLEAmCAhml2qwzNg/brgVFyD3TNmhd7BkasBv
 tfb8vdJEuU9WdlbzR76ruCT6qOIJacvYoSwRg/w38lCDLxC3A1j+CvGjVBXnHSSh
 0sXHHYUh/YL911yk4tocutzCfPaEVddwiv8bg9Crv+UnQPQlfHrXc2nQfXeN1hno
 yxZY57wAV+UXS98mcOlWdwhenBYkJ3MwBlMmDeIz/VwswEn2B0fssfo/FQZJp+MD
 K7U9VK9W6fTGxtsxhy2+Et0wEM58V/FlLFQyHeQreaBHOigJZyWmZFljDHfYexDl
 e0HoeZrYaRBzQAtQ==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id cd466c18
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 13 Jul 2020 03:44:52 +0000 (UTC)
Received: by mail-io1-f48.google.com with SMTP id v8so12039455iox.2
 for <wireguard@lists.zx2c4.com>; Sun, 12 Jul 2020 21:06:18 -0700 (PDT)
X-Gm-Message-State: AOAM533Ia9Jyvk+r/aexSGNLuCCsJsiEaZHLa8s/fp9QzQYL0Ki4lWwD
 B2espzXX3+I/wjiHfqe825We4y0E/LmBwkg4XjA=
X-Google-Smtp-Source: ABdhPJz0dydcf+FfYerWJbxyzCYLBzxGnqVRU03s8QbA7t/NTop1KFv/EWqqi6EiNvq9ddEnyW7RvBjVlqazB2WQ2hE=
X-Received: by 2002:a02:9f8e:: with SMTP id a14mr92220595jam.95.1594613177853; 
 Sun, 12 Jul 2020 21:06:17 -0700 (PDT)
MIME-Version: 1.0
References: <913e8149b5a5c3a6@mail.zx2c4.com>
In-Reply-To: <913e8149b5a5c3a6@mail.zx2c4.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sun, 12 Jul 2020 22:06:06 -0600
X-Gmail-Original-Message-ID: <CAHmME9qDW7CLDzQhwHQ7bb==dKAdgtbZfEtzmNaxB-atwCguag@mail.gmail.com>
Message-ID: <CAHmME9qDW7CLDzQhwHQ7bb==dKAdgtbZfEtzmNaxB-atwCguag@mail.gmail.com>
Subject: Re: [ANNOUNCE] wireguard-linux-compat v1.0.20200712 released
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
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

On Sun, Jul 12, 2020 at 9:34 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>   * compat: SUSE 15.1 is the final SUSE we need to support
>
>   >=15.2 is in SUSE's kernel now. We'll be dropping 15.1 support in a
>   few weeks after people have had time to upgrade.

As said above, SUSE backported WireGuard into their kernel for 15.2,
both on the OpenSUSE variant and on their enterprise distro. This is
terrific news.

I'm considering making this compat module release the last release
that supports the now-old 15.1 release. `zypper update` automatically
puts people on 15.2, as far as I can tell, and it seems like the
general path for SUSE is to update. Plus, people who tend to use
WireGuard tend to like to update.

I put this in the git repo a few minutes ago:
https://git.zx2c4.com/wireguard-linux-compat/commit/?id=2a1b895ec2f529a75a6bc63fd5b6baee2b1735b3

If anybody thinks that 15.1 support would be worth preserving for more
releases (how many?), this would be the time to speak up. I'm happy to
have my presumptions about SUSE user update habits proved wrong and to
change course accordingly.

Jason
