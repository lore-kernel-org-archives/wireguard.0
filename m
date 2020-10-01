Return-Path: <SRS0=Zpbp=DI=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19845C4727C
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  1 Oct 2020 11:14:43 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 47F2D2087D
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  1 Oct 2020 11:14:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="K49hgqBP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 47F2D2087D
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9cf89fbe;
	Thu, 1 Oct 2020 10:42:51 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id a15cca36
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 1 Oct 2020 10:42:48 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e4b2898d
 for <wireguard@lists.zx2c4.com>; Thu, 1 Oct 2020 10:42:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=Mlc2SpKocWmZakVIjthE1zrBrB0=; b=K49hgq
 BPQtwPFA9fgHGMIRXov/4Z703E+OEedtPb8j4w6KJRRIA3OP4lyLcEpKOpNMqDQS
 KGo6DX+JmZwnqTWJ/1SZ3XlXDhuB0YThVyC5WTzBnJhXRjTNTPmIb2lMA8Iy/fyl
 +1BQHLldYKkkT4y3nSo0Y2WzCeLVmXBc7cVxqITO5l/B1iUVPtlbMqiIagV61PS5
 1sUBkupTwOx3aldG69IiLMEmOd0NPR84o8Jt6DsJJA2o47xjJBFW0oUUXmZH9xTH
 O5zBnskYxZgPghLREpxJSJQ/UoWH53jZ92NyB/eSW4duS9jH8H6fQ+q/EiZTlTL3
 ILG8tSialUBgM65g==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 4e861bd3
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 1 Oct 2020 10:42:48 +0000 (UTC)
Received: by mail-il1-f172.google.com with SMTP id o18so1468892ilg.0
 for <wireguard@lists.zx2c4.com>; Thu, 01 Oct 2020 04:14:38 -0700 (PDT)
X-Gm-Message-State: AOAM532hDaBoFc82KVvSpbQZ+jnoG+WtbXGPlsF5ub0QCSoUBaE6j0T2
 MkUq2oqlP+OB2iYQvz7gb0P8Mo85WSP/1OXnERQ=
X-Google-Smtp-Source: ABdhPJxTolF9dRsJjEYstmGHl4Yp92pblfnSCMHfsz5c7w6CyhqErl/sZ8xe2N6TthsJcjcESIs/6HzBCY9DyqTWEg8=
X-Received: by 2002:a92:d289:: with SMTP id p9mr1264178ilp.224.1601550878198; 
 Thu, 01 Oct 2020 04:14:38 -0700 (PDT)
MIME-Version: 1.0
References: <RO0eYtp8TKtVxKltNMcmKXS8FhbJRiFU1fBuG8XmE3h8AtjY2_JlRSw_k29pm-3r70B_3pQHIF1nk252-3wHqVMlnbGbub2GiCU3DN7arLY=@protonmail.ch>
In-Reply-To: <RO0eYtp8TKtVxKltNMcmKXS8FhbJRiFU1fBuG8XmE3h8AtjY2_JlRSw_k29pm-3r70B_3pQHIF1nk252-3wHqVMlnbGbub2GiCU3DN7arLY=@protonmail.ch>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 1 Oct 2020 13:14:27 +0200
X-Gmail-Original-Message-ID: <CAHmME9oWhiOsQqpnOawT5Or8fzFM+gSAsyC3_=byEmeuwa+Q+A@mail.gmail.com>
Message-ID: <CAHmME9oWhiOsQqpnOawT5Or8fzFM+gSAsyC3_=byEmeuwa+Q+A@mail.gmail.com>
Subject: Re: Two small Wireguard frustrations on Mac & Apple iOS
To: Laura Smith <n5d9xq3ti233xiyif2vp@protonmail.ch>
Cc: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
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

Hi Laura,

We're actually trying to respond to these events using Apple's new
network extension notification APIs. But it seems like the behavior
can be a bit inconsistent and has changed between versions. We'll
devote some development cycles to improving this hopefully not before
too long.

Jason
