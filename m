Return-Path: <SRS0=uCSF=Z7=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9634EC43603
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  9 Dec 2019 15:54:05 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 069382077B
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  9 Dec 2019 15:54:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=mullvad-net.20150623.gappssmtp.com header.i=@mullvad-net.20150623.gappssmtp.com header.b="PK4SvbyM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 069382077B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mullvad.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0b1f4609;
	Mon, 9 Dec 2019 15:53:38 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 57476b29
 for <wireguard@lists.zx2c4.com>; Mon, 9 Dec 2019 15:53:36 +0000 (UTC)
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com
 [IPv6:2607:f8b0:4864:20::244])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5a7deacc
 for <wireguard@lists.zx2c4.com>; Mon, 9 Dec 2019 15:53:35 +0000 (UTC)
Received: by mail-oi1-x244.google.com with SMTP id l136so6762746oig.1
 for <wireguard@lists.zx2c4.com>; Mon, 09 Dec 2019 07:53:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mullvad-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8Fx2q2TrHVkvcgVmDKmAQtSNg0yodu6stjnL4P82Wcg=;
 b=PK4SvbyMxsO+Kg+e7JEJWg4aR8TQoOgdg9uZ/pm31JD9X2I1CaI+dh8tWjZ+GPY3/p
 r0ZtpmqJYNnx4sHXwoJuLX5g4Av1B3t4Znc+gnJ1VFImz70UAxsOCuIEYvitz+YsCeUk
 xakf/n02QrXJH+RF8DZN3NLnLijmiLlhW6KQolVw/bRzqO35YH4nbYV3IMLNtUvGwpjJ
 M++EP02uRHfeiGRrniWDfEv57q9OWyda6qjDJh+LPu3xeLGRLlEdf7+zC/FWpVcIBNrV
 9AT6gSPusMNbcdTRH9XhnnuV1Lv7nEmS9ZfZ0l4K0LJVsCsBu5+aCV0eKGMLvAyQ5xqt
 yrtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8Fx2q2TrHVkvcgVmDKmAQtSNg0yodu6stjnL4P82Wcg=;
 b=qWo59xWuktpPwJY+hqq7C8u6feaqhkJu20+XWtUNPIn8r+ydwWxfw+J6OWV2KQfEUQ
 BWyGEdqfjl0XqDl4MAPWAG4DujJ0QGq8usKcjJ/njUKvKh+wyV7kdSqbhMmKiIvzEuYw
 83eKZ9htlid1Y53d8leurOBGN8Oyq+GM8iSrNdYxR0czTFgCVCxd8tzwkgoB8YOb2b00
 STiDG+IeFta306zkwjasCxlzS2i5KSaXBiFO0CpL7wrZDjMZO9R4kgZizZzJBlz3sTE4
 VrLVGfYbi0oZ8Pzbd4Ob9Q1EMBGrcdgm17hUJQIF1YWeSZagh1UysnreptOAxvSNC2/H
 9XaA==
X-Gm-Message-State: APjAAAXMcTFXhRnwG0idPXPyv7dZ4+P4XFAVu7wkjWnzat87wHqRP5yA
 st2PkDBlK+HcFlmi5mzSXtpn0p1tJZ9uKYD1Pg0ZsV/PzBTBvw==
X-Google-Smtp-Source: APXvYqwAcptCfFAPECJESq5ZkUpoUZjLPSf/pZtLSOgNvhyg0A4U3KL1UqqiYt6R2S81VyCbBFp9svN8ABZCaHQC63s=
X-Received: by 2002:aca:ef85:: with SMTP id n127mr25335078oih.54.1575906814991; 
 Mon, 09 Dec 2019 07:53:34 -0800 (PST)
MIME-Version: 1.0
References: <CAHmME9oRJqvMWF9rnSZejWe9J6ONUMbk108VkH1Qfy513Vp=dg@mail.gmail.com>
 <87lfrlzf55.fsf@fifthhorseman.net>
In-Reply-To: <87lfrlzf55.fsf@fifthhorseman.net>
From: =?UTF-8?Q?Fredrik_Str=C3=B6mberg?= <stromberg@mullvad.net>
Date: Mon, 9 Dec 2019 16:53:24 +0100
Message-ID: <CANTUoed99k59kcEG0XUcsQMmFfixQm846_HDmsxQ0RN6otDf=Q@mail.gmail.com>
Subject: Re: [ANNOUNCE] WireGuard merged to net-next, on its way to Linux 5.6
To: Daniel Kahn Gillmor <dkg@fifthhorseman.net>
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

On Mon, Dec 9, 2019 at 4:46 PM Daniel Kahn Gillmor
<dkg@fifthhorseman.net> wrote:
>
> On Mon 2019-12-09 11:12:23 +0100, Jason A. Donenfeld wrote:
> > I'm happy to announce that WireGuard has been merged into Dave
> > Miller's net-next tree. That means when Linus Torvalds opens up his
> > tree for Linux 5.6, Dave will send a pull request to Linus, and
> > WireGuard will wind up in Linux 5.6.
>
> Congratulations!  This is excellent news.
>
> I know the path to this process is a long and winding one, and involves
> lots of changes and compromises.  but i am really glad that this project
> has stuck through it all.  The additional reach for the project (both in
> terms of users and in terms of developer eyeballs) is huge.
>
> Looking forward to thinking through what possibilities open up next
> here...
>

I couldn't agree more. This is great news. Congratulations!
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
