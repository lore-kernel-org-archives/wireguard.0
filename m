Return-Path: <SRS0=xb9C=EX=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F031C2D0E4
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 17 Nov 2020 21:57:11 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 28E5E222E9
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 17 Nov 2020 21:57:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="YysQYNgC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 28E5E222E9
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 47576258;
	Tue, 17 Nov 2020 21:52:03 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 6ae80a7a
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 17 Nov 2020 21:52:01 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 185bde8a
 for <wireguard@lists.zx2c4.com>;
 Tue, 17 Nov 2020 21:52:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=5TjU5PsPk7I7hgiSgZ8fZW2dKAg=; b=YysQYN
 gCF74MBon+Ny172MBRCAXS5C9PgbMzmy+rRfhEUBsNX1DkRgFsvvhtMWQGASc/up
 S47Zs6Hr+ulRu3b6oVmjBhAJwwfqke4Far0VRciazgxSpHET6Hy18P9HukPSuyPB
 myvwbGYSuUcsEbd1JPPF/YbQSPZ0ZTUpgzLuXpXUElxZMk/9+p16+Y62t6DP9NtB
 0tlsw39Q0RpQIR590BiYZ5dFz8Ao29zrgr30QNhClgxjgcxZrWsbY2iBk+TxfGYa
 Ici/RFqtRxgk74xaVBfe1VLblp6TybYzycRQbYGnFe2TMBshW2wTvWf3D1qvEWwk
 tNloPmtnlUiG/N+w==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 33501ea6
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 17 Nov 2020 21:52:47 +0000 (UTC)
Received: by mail-yb1-f173.google.com with SMTP id l14so16284608ybq.3
 for <wireguard@lists.zx2c4.com>; Tue, 17 Nov 2020 13:56:40 -0800 (PST)
X-Gm-Message-State: AOAM532g90t3iZa6GL92eMESAWvrTlj1WFbeoGDB7u+pfb4AullClzwx
 ApNswRI1aO/qs0x+Jo+N0queAdBYRb8kjobMEjU=
X-Google-Smtp-Source: ABdhPJw8js2Yfntq0cJuJE4b9z88PsV18rSgg4ikQQxFdp2fUZaVh0kuqyQ4wFWj4MEj0MHrJAWcmqEZqyy4ceR4s9o=
X-Received: by 2002:a25:d047:: with SMTP id h68mr2206101ybg.49.1605650199785; 
 Tue, 17 Nov 2020 13:56:39 -0800 (PST)
MIME-Version: 1.0
References: <CALaUSuvDgxsr99R2qiOrXM20btnvnaiyAx7197jfcTauOt5CTA@mail.gmail.com>
 <CAHmME9oeZc7cruN2fayu+F+8BO0RiwGuA+dqzQRr5spnvhY6GA@mail.gmail.com>
 <CALaUSuuzQhTcDE_b6PPf=fXuOjbmVf7Tgzdz9DbWMxCJ8-2WUQ@mail.gmail.com>
In-Reply-To: <CALaUSuuzQhTcDE_b6PPf=fXuOjbmVf7Tgzdz9DbWMxCJ8-2WUQ@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 17 Nov 2020 22:56:29 +0100
X-Gmail-Original-Message-ID: <CAHmME9oZvNQjCoShdMTQ2n0soTA0wNVVm9rPFcma0fP-6_9tsw@mail.gmail.com>
Message-ID: <CAHmME9oZvNQjCoShdMTQ2n0soTA0wNVVm9rPFcma0fP-6_9tsw@mail.gmail.com>
Subject: Re: WireGuard for Windows failed to start after update to v0.2.1
To: Joshua Sjoding <joshua.sjoding@scjalliance.com>
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

Hi Joshua,

On Tue, Nov 17, 2020 at 10:20 PM Joshua Sjoding
<joshua.sjoding@scjalliance.com> wrote:
>
> I think they're separate issues both related to the new version, which
> is why I opted to send in separate emails. The other email is about an
> issue first encountered on two other computers within the company.
>
> In my case I was able to get WireGuard working again. Here's what happened:
>
> 1. I manually started the WireGuard desktop app. It immediately
> prompted for elevated privileges, which is atypical. I provided it
> with administrative credentials.
> 2. The WireGuard desktop app launched, but lacked any of my configured
> tunnels and still was prompting me to upgrade. I see that there's a
> config data migration recorded in the log, so my guess is that
> WireGuard was still running the old executable and didn't know to look
> for the configuration data in the new location yet.
> 3. I told WireGuard to run the updater again and this time it went through fine.
> 4. When WireGuard came back up it had the tunnel configuration again.
> The tunnel was left in a shut off state, even though it was on prior
> to the first upgrade attempt. I switched the tunnel back on and it
> seems to be working fine now.

It's unclear to me where the timeline begins in this one. Here's my
present understanding:

1. It's a normal Tuesday at SCJ, the coffee is roasting, the pens are
clicking, when WireGuard innocently informs you that there's an update
available.

2. You click update, it downloads the installer, and runs it. After
hanging for a bit, the installer seems to run in reverse, and you're
kicked back to the WireGuard app, not-updated, except all your config
files are gone, which is weird.

3. You click update again. It succeeds, and the new WireGuard version
comes up, and your configs are all there.

4. The tunnels aren't started, so you press start, and everything
works, but there are these messages in your log, which you sent me in
the other thread.

Is that an accurate story?

If so, my current best guess is that:
- MSI stops manager, stops tunnel, installs new version, starts new
manager (thereby initiating the config migration), starts new tunnel.
- New tunnel fails to start [a]. We flipped on the MSI rollback switch
in v0.2, so that tunnel bug now causes the installer to move in
reverse [b].
- New manager stopped, old version installed, old manager started, old
tunnel started, but config has been migrated already [c], so the
tunnel doesn't come up and you can't see it.
- You press update again, stops manager, new version installed, starts manager.
- You start the tunnel service manually.

Current status based on the above is:
- [a] and [c] were fixed by
https://git.zx2c4.com/wireguard-windows/commit/?id=2edb9007c820656514a0e9b07c9f83ad86593866
and https://go-review.googlesource.com/c/sys/+/270897 .
- [c] is fixed by
https://git.zx2c4.com/wireguard-windows/commit/?id=2edb9007c820656514a0e9b07c9f83ad86593866
.
- [b] we can either fix by getting rid of rollback again, or keeping
it, and arguing that [c] is the more proper fix.

Can you confirm this corresponds?

Jason
