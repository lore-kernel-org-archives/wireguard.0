Return-Path: <SRS0=uuIP=E5=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79E1EC63798
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 23 Nov 2020 19:56:29 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7112220727
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 23 Nov 2020 19:56:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="mX7fu6Bn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7112220727
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id edf8e9ae;
	Mon, 23 Nov 2020 19:49:30 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 100d2632
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 23 Nov 2020 19:49:27 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b9c11675
 for <wireguard@lists.zx2c4.com>;
 Mon, 23 Nov 2020 19:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=FOvctgsH12mLhh3xISYuQLtaviQ=; b=mX7fu6
 Bnkls3QskcuR2jkEJH8b4XRoYJ3wGnJzVdLo/U2kfigWym73v8k58bd2Zzd/nlJ9
 MoUeyvNjJ2ovrx3Gc/mHCMK0e0rr3fObh8eow3WWywFwbu0PdKm4JkNlTxrdwU5+
 Stc8mfT8eMVgB+A+mpR5/Ze693HQu+tgIst2JFR9Pyd32izQB8NomJOq3Jn3gnOr
 HSie3CKy5TDGRL72VMxU1483nNxPtFzxW06i40/BhpjadFs/yY76rCFOWUGHeN2M
 WfRU71toGItM8S6i+0vimYi0LL3J5GpoLGXuUFPDYVHAZSHEf114GbzeE34Qtzow
 t6hP1rkP9T/kQquQ==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id c1c40b64
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 23 Nov 2020 19:50:13 +0000 (UTC)
Received: by mail-yb1-f171.google.com with SMTP id w5so17021796ybj.11
 for <wireguard@lists.zx2c4.com>; Mon, 23 Nov 2020 11:54:52 -0800 (PST)
X-Gm-Message-State: AOAM530AoeRLvOdtKsp7yHluaqqu+uPdc2VA9VbUtWPOIVtT8YMhU8NE
 PIWc5d1PIVCGSWx9h0LylWrgFd8PCaANWa+rv38=
X-Google-Smtp-Source: ABdhPJwIJGShCYgm3oVLjizBnEwbpLOlErgVIMSAG7IM85DLpTdWlVD2/x20wVWxvzR1ICvjE++/UDpXkOr5nIxTHcw=
X-Received: by 2002:a25:d047:: with SMTP id h68mr1125423ybg.49.1606161292471; 
 Mon, 23 Nov 2020 11:54:52 -0800 (PST)
MIME-Version: 1.0
References: <CACnYWReJC+Ff8G+uWLW6i=rsR1w=O-6aDFBG-yd__ZuuRh83CA@mail.gmail.com>
 <CAHmME9qyVb7kuj+VYAaQRqZ-i_Mptr6_2BGGoz+wf5Ke4WXUMw@mail.gmail.com>
 <CACnYWRdj9ziO7dPvHscpiUNrQoBaENGHHOoyevrWFqU07vKpWg@mail.gmail.com>
In-Reply-To: <CACnYWRdj9ziO7dPvHscpiUNrQoBaENGHHOoyevrWFqU07vKpWg@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 23 Nov 2020 20:54:41 +0100
X-Gmail-Original-Message-ID: <CAHmME9rOLXhyCYVtR8m0TchxzeF_Azs_NL70um0n=y1YZNNe2g@mail.gmail.com>
Message-ID: <CAHmME9rOLXhyCYVtR8m0TchxzeF_Azs_NL70um0n=y1YZNNe2g@mail.gmail.com>
Subject: Re: WSL2 and Wireguard
To: Ruben Di Battista <rubendibattista@gmail.com>
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

On Mon, Nov 23, 2020 at 8:53 PM Ruben Di Battista
<rubendibattista@gmail.com> wrote:
>
> Ehi Jason!
>
> Thanks for the detailed answer. I just checked on the new 0.3 and the
> problem still persists. I'm not a network engineer, but I think it
> might be useful if you can provide more details in the Github issue
> (or the one I link in the second comment) that could help speed up the
> process...

If I can figure out more details, I'll post them. Right now I have
mostly speculation and haven't started dissecting WSL2's networking
quirks. I have subscribed to that issue though.
