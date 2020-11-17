Return-Path: <SRS0=xb9C=EX=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E834C2D0E4
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 17 Nov 2020 22:03:42 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4820D222E9
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 17 Nov 2020 22:03:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="2gUPYqGV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4820D222E9
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9a0b4ba4;
	Tue, 17 Nov 2020 21:58:34 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 71914f57
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 17 Nov 2020 21:58:32 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 23da3111
 for <wireguard@lists.zx2c4.com>;
 Tue, 17 Nov 2020 21:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=nnN1O0BnHhkIXLRclpZ7seWX2S4=; b=2gUPYq
 GV6Xyz2egF5ws91k7m/weZRX93TYQSPwDMYqJW/yvROK+hsiI9t9Uo6G788upb9V
 kS3LDkY67Zp1vjSI2GWF7YJobjuYXFZ+OX4RmanTGszvqzXFV0dMg/UHs++RGV6p
 +EW+3dFBp5P9BCeIGGxgP6kZU/jmS04d2IGet29JbySNoVIW5+MOE4dcN3i8WAJQ
 BLMsfyPjAvzjjhg/DJPXBdBYqQ7CtQ+e2UPkizpK3bq/n68lzG3O7KTZZH+SzWiO
 +zv7nNexbW2ICvBL63PEuc8CoGQzkN2suLk1TxOx5wtNMdf8p34HXxFqfgptzyx6
 2PHsbckhouNgdRTQ==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 3ed06b52
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 17 Nov 2020 21:59:18 +0000 (UTC)
Received: by mail-yb1-f170.google.com with SMTP id i193so20437793yba.1
 for <wireguard@lists.zx2c4.com>; Tue, 17 Nov 2020 14:03:11 -0800 (PST)
X-Gm-Message-State: AOAM531gA0b2Lv+x6IhP9h6ZVpw/j1ZNmYzoOa8yoTGiGRNdJ1BFXyRj
 /H+C7iXzWSalXcPSTFKzLmHpBuXDgUsm+qS9Rng=
X-Google-Smtp-Source: ABdhPJx430qWwr6gQzdOXb4Qy4zJAPcgsv56c+5ENUEe+CKECpK7gkmaJEKs9kn10z8xzC52U9QFWhtc2yCve3naoC8=
X-Received: by 2002:a25:481:: with SMTP id 123mr1842336ybe.123.1605650591040; 
 Tue, 17 Nov 2020 14:03:11 -0800 (PST)
MIME-Version: 1.0
References: <CALaUSuvDgxsr99R2qiOrXM20btnvnaiyAx7197jfcTauOt5CTA@mail.gmail.com>
 <CAHmME9oeZc7cruN2fayu+F+8BO0RiwGuA+dqzQRr5spnvhY6GA@mail.gmail.com>
 <CALaUSuuzQhTcDE_b6PPf=fXuOjbmVf7Tgzdz9DbWMxCJ8-2WUQ@mail.gmail.com>
 <CAHmME9oZvNQjCoShdMTQ2n0soTA0wNVVm9rPFcma0fP-6_9tsw@mail.gmail.com>
In-Reply-To: <CAHmME9oZvNQjCoShdMTQ2n0soTA0wNVVm9rPFcma0fP-6_9tsw@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 17 Nov 2020 23:03:00 +0100
X-Gmail-Original-Message-ID: <CAHmME9rm6iq+xD+K6b9N1D9VmiKXkOiw+6Wpscnau6Mu+OEevQ@mail.gmail.com>
Message-ID: <CAHmME9rm6iq+xD+K6b9N1D9VmiKXkOiw+6Wpscnau6Mu+OEevQ@mail.gmail.com>
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

On Tue, Nov 17, 2020 at 10:56 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> If so, my current best guess is that:
> - MSI stops manager, stops tunnel, installs new version, starts new
> manager (thereby initiating the config migration), starts new tunnel.
> - New tunnel fails to start [a]. We flipped on the MSI rollback switch
> in v0.2, so that tunnel bug now causes the installer to move in
> reverse [b].
> - New manager stopped, old version installed, old manager started, old
> tunnel started, but config has been migrated already [c], so the
> tunnel doesn't come up and you can't see it.
> - You press update again, stops manager, new version installed, starts manager.
> - You start the tunnel service manually.

Alternative interpretation would be that the MSI starts new tunnel,
which uninstalls old Wintun, then old MSI tries to uninstall old
Wintun and fails, and then new installer jumps into rollback mode.
Either way, it seems like the solution is to go back to disabling
rollback.
