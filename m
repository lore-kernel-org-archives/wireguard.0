Return-Path: <SRS0=n59I=76=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 337CFC433DF
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 17 Jun 2020 05:20:28 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9A5CD20663
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 17 Jun 2020 05:20:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JGYZw6jd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9A5CD20663
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5de11832;
	Wed, 17 Jun 2020 05:01:57 +0000 (UTC)
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [2a00:1450:4864:20::231])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 58cd4f5a
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 17 Jun 2020 05:01:54 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id i27so1215592ljb.12
 for <wireguard@lists.zx2c4.com>; Tue, 16 Jun 2020 22:19:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=eFDL4agsqHF7qHgQpgsX4cyz59mDl2LHBO3+nJsZCAk=;
 b=JGYZw6jd18mdQgGOS9crY8ii25EHXrRsYKJPJmclzibqlBpNxe//NYUSdDmzwC9TLu
 iwY/yE3idiFa1luX2sotVp4lHDKHbyZFPVMd2lbqQgf4IwJYSz54VGIhWIfoAC1Uw06S
 xyciGKWZ8Ss48WSP3Z0+OsHpJyx+IC3pom2hI4cWnHz1zI3SdCJRF+/gMjTNf5zuNroP
 OkVRsvLXymoHsbMZhrDg3p91jpbKpPkTgpaTlY8kREzRXT0OCcXXERDgpRWqi9LSFFnt
 RcOug3q9xx5BRSssuhf00arhFH7occKKmfwZdUlqOhgBNkm7NS6MpIUYolPLtJXtKD7Q
 e5Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=eFDL4agsqHF7qHgQpgsX4cyz59mDl2LHBO3+nJsZCAk=;
 b=sh3vu4NWd2e35yiZbuTKLIjeLwGiDW7dJpT6ZPsatEl0LdpcRQHegLWeYpQJ2rMZMT
 v17njg6e5EBfAvx/XuSQFkgqv1srvrMITz5mwJbTnX23J9KZCTVNUkbtnywmf4e3jNpA
 vqUC/v05xa6TmE4NIGukAjJjB1B1/lUstTgrq8+3PyZr+p1ilozePD0NZU1SNyWVH+YX
 C++Gm9IvFZz+5CZzyVeL/XIverxyqszgVFrR0+uOP4/9ZKS1sq9y6Hc3+Y21EcYnWAZw
 Wx7Dzk2sm3OjB6omw6qpzlO1HKq4BBEmXthiDqJlzpuDk7h2C1G4pzThmgpsGzM8UAS/
 +UVA==
X-Gm-Message-State: AOAM530gSQPP7e18e+Hs5tPErM4aHdK3TtKiQzqXKwcU7mtgOSM4BP18
 q2aM3Nry3SIRQ6RdI4pcDmVp8iZag6iMyBU95UnRebX2WPI=
X-Google-Smtp-Source: ABdhPJyoCwhHG76+fZdkLdQbBDjSTNxQG9MXvIUZnDXDrpSdjJG9ZSvjuhwE7djeC/gqetlaHeB4m0BuPcTagLVddfs=
X-Received: by 2002:a2e:2ac2:: with SMTP id q185mr3021820ljq.131.1592371195917; 
 Tue, 16 Jun 2020 22:19:55 -0700 (PDT)
MIME-Version: 1.0
References: <CABtXGiBwT8xqHUP-L818UeNEG+2RcR165Kkxc9f6sMSZKJRd2g@mail.gmail.com>
In-Reply-To: <CABtXGiBwT8xqHUP-L818UeNEG+2RcR165Kkxc9f6sMSZKJRd2g@mail.gmail.com>
From: Phillip McMahon <phillip.mcmahon@gmail.com>
Date: Wed, 17 Jun 2020 07:18:44 +0200
Message-ID: <CABtXGiB17ofxts38zaWOzyWEwsgYyT5MDkuaZ6XEFN+PPWZb2g@mail.gmail.com>
Subject: Re: Windows Client - UI improvement
To: wireguard@lists.zx2c4.com
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

Would this small improvement be possible in a future Windows client update?


On Mon, 30 Mar 2020 at 08:38, Phillip McMahon <phillip.mcmahon@gmail.com> wrote:
>
> Would it be possible to pin the context items from the taskbar icon
> rather than having to scroll through the list of tunnels to get there?
>
> The context items are
>
> Manage tunnels...
> Import tunnel(s) from file...
> About WireGuard...
> Exit
>
> I have over 150 tunnel definitions and getting to those options is
> awkward, to say the least.
>
> Thanks in advance,
>
> Phill
>
> --
> Use this contact page to send me encrypted messages and files
>
> https://flowcrypt.com/me/phillipmcmahon
>
> P.S. Drowning in email? Try SaneBox and take back control:
> http://sanebox.com/t/old3m. I love it.



--
Use this contact page to send me encrypted messages and files

https://flowcrypt.com/me/phillipmcmahon

P.S. Drowning in email? Try SaneBox and take back control:
http://sanebox.com/t/old3m. I love it.
