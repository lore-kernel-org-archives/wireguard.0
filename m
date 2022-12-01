Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EBA5C43217
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  1 Dec 2022 14:53:43 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6f96eda8;
	Thu, 1 Dec 2022 14:53:40 +0000 (UTC)
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [2607:f8b0:4864:20::1035])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id ff555776
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 1 Dec 2022 14:26:44 +0000 (UTC)
Received: by mail-pj1-x1035.google.com with SMTP id
 w4-20020a17090ac98400b002186f5d7a4cso5425264pjt.0
 for <wireguard@lists.zx2c4.com>; Thu, 01 Dec 2022 06:26:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=3pExKTiZKQ+qAB0RE07gBOMN+F5kJNMDB+C4LtR7+GU=;
 b=MjsSUJJQ11xm3/l8xt5PEr8QiuYAPlZMUT5cXd5e4K2j7f718r9xOsIr0O6+sXPvTR
 UnXvKQw7MmSuQsyk/pe8N5nuWFTVXUp7oWWHENJ5KXH9M7S0vLiUvz4rj54egRcZBMjB
 Ja/7UvHVvjmgAtJyuNaNieo4EOqKX8DO6P7aCnWYKTCE3s1WLdmxMus4/9hJ5tlKd0DY
 US8B36ns7Rgy5i8w5n1iTfkKmLjiU+RgWv1OGAveC6s5O1+JztnofQAIqijPXg3cGCcF
 cwnll2mOP7QjtjM8KHyKC3Xwqe15LubZJZc6Ce+Caq7afaz8QLT2eYxcfcmOeYtqekEY
 v8hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3pExKTiZKQ+qAB0RE07gBOMN+F5kJNMDB+C4LtR7+GU=;
 b=zCKifFBrx5hIvJ0FaWBJln35ls++hxPpUW20afB0EL1e0qdh0apj9meHQMFJYxgHcw
 DHAtUR1q4LEUwVH0QoFVmErqXGvamSOWaSi34giUERus86rpwKi9RHUGF5SBeQ32Ju0t
 fb1eunwgtvlHjc1tZPJ9tOmNQGUKv/XRs6WbUyBelmdtPbPHRnvY9+F1xsMnUSoyBLQ/
 hgm4ZRWdIkT/VpXy5cR4+dE3IHBJOrkm70Ij6+gPUTLIOlNJCNW/0V282oRJqiTv8fjv
 wRi2T9ByxQsGNnoaUoVON2v566mUjMoBnjL7NLjmSDdrEvgDJbZfNG+LntaUEmLDCaGH
 hArQ==
X-Gm-Message-State: ANoB5pmoB4ExBU1jpDatJpIILul4M2StaANn7CLuQwtO9x6Vx5sq7ERf
 nteo2kRnRKWvicFYGNl+5HGwgOYpJnnRIhLzE4g=
X-Google-Smtp-Source: AA0mqf6sP78RlrDGgpZwDpG7CpdbWUv30hxr1vA959sIqv/slu/J6RcQRHn4jg9/n/L/SJ/DLFTLGneNfV/A0xA3n0c=
X-Received: by 2002:a17:903:22c4:b0:187:4ace:e1fd with SMTP id
 y4-20020a17090322c400b001874acee1fdmr48542352plg.54.1669904803131; Thu, 01
 Dec 2022 06:26:43 -0800 (PST)
MIME-Version: 1.0
References: <0ac435a3-95f4-c005-9834-ffb44360536c@tootai.net>
 <Y4inPePWAWCQ/Ejp@zx2c4.com>
In-Reply-To: <Y4inPePWAWCQ/Ejp@zx2c4.com>
From: Luna Jernberg <droidbittin@gmail.com>
Date: Thu, 1 Dec 2022 15:26:29 +0100
Message-ID: <CADo9pHij0DqLsHswwquhesi3N1L8v1n7-eaCjNQ=rV1vgO_Y-A@mail.gmail.com>
Subject: Re: Wireguard on Asahi Debian
To: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Luna Jernberg <droidbittin@gmail.com>
Cc: Daniel <tech@tootai.net>, wireguard <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Thu, 01 Dec 2022 14:53:39 +0000
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

Thats Asahi with Arch Linux however and not Debian

On Thu, Dec 1, 2022 at 2:10 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> On Thu, Dec 01, 2022 at 01:24:07PM +0100, Daniel wrote:
> > Hi All,
> >
> > I installed Asahi/Debian Bookworm from
> >
> > https://git.zerfleddert.de/cgi-bin/gitweb.cgi/m1-debian/
> >
> > and face a problem: installing wireguard shipped the Debian arm kernel
> > and I can't get wg to work.
> >
> > Is there a solution for this ?
>
> Appears to be available in Asahi's kernel:
> https://github.com/AsahiLinux/PKGBUILDs/blob/9fb6fddfdd388190c099a723f046acf7b8b6bd39/linux-asahi/config#L2462
