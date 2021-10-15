Return-Path: <SRS0=FZ0+=PD=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A6B9C433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 15 Oct 2021 07:58:05 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6562C61037
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 15 Oct 2021 07:58:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6562C61037
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ntrv.dk
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1f18d1aa;
	Fri, 15 Oct 2021 07:58:02 +0000 (UTC)
Received: from mail-relay.contabo.net (mail-relay.contabo.net [161.97.176.84])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 2f731333
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 15 Oct 2021 07:58:00 +0000 (UTC)
Received: from pxmg2.contabo.net (localhost.localdomain [127.0.0.1])
 by mail-relay.contabo.net (Proxmox) with ESMTP id 3EAF01013B6
 for <wireguard@lists.zx2c4.com>; Fri, 15 Oct 2021 09:58:00 +0200 (CEST)
Received: from m14060.contaboserver.net (m14060.contabo.net [213.136.93.170])
 by mail-relay.contabo.net (Proxmox) with ESMTPS id 5EC351013CE
 for <wireguard@lists.zx2c4.com>; Fri, 15 Oct 2021 09:57:59 +0200 (CEST)
Received: from mail-qk1-f179.google.com ([209.85.222.179]:36517)
 by m14060.contaboserver.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94.2)
 (envelope-from <ch@ntrv.dk>) id 1mbI6K-0000Wd-11
 for wireguard@lists.zx2c4.com; Fri, 15 Oct 2021 09:57:59 +0200
Received: by mail-qk1-f179.google.com with SMTP id p4so7840343qki.3
 for <wireguard@lists.zx2c4.com>; Fri, 15 Oct 2021 00:57:56 -0700 (PDT)
X-Gm-Message-State: AOAM531CaANDfwWgltE0fIzEOF/zf6LHjm/BtLj9icGNzkYEURqVjLz8
 FE0KoGvKxDA6bqvmgRI+0q8xmcCgF1VqHVcf1zw=
X-Google-Smtp-Source: ABdhPJwgRdbUfp8Yc1jTBAAGFa2FyhHF20tuDoiO6VM+vgN1r8MVmLqkHpL80/zlr6dBPKGmDsqb+LVuWrNF7Us1J0Y=
X-Received: by 2002:a37:c83:: with SMTP id 125mr8825282qkm.453.1634284676208; 
 Fri, 15 Oct 2021 00:57:56 -0700 (PDT)
MIME-Version: 1.0
References: <d0e1773d-80d5-7676-7943-2eff8d57beaa@kracon.dk>
 <87wnmfj9kq.fsf@proton.d.airelinux.org>
In-Reply-To: <87wnmfj9kq.fsf@proton.d.airelinux.org>
From: Chriztoffer Hansen <ch@ntrv.dk>
Date: Fri, 15 Oct 2021 09:57:20 +0200
X-Gmail-Original-Message-ID: <CA+cYV6t=doigei7mH-77oZrq=_uMmCn_kRxhfXku+XC75moU=A@mail.gmail.com>
Message-ID: <CA+cYV6t=doigei7mH-77oZrq=_uMmCn_kRxhfXku+XC75moU=A@mail.gmail.com>
Subject: Re: Source IP for multihomed peer
To: Benda Xu <heroxbd@gentoo.org>
Cc: Svenne Krap <svenne@kracon.dk>, 
 "WireGuard List (wireguard@lists.zx2c4.com)" <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - m14060.contaboserver.net
X-AntiAbuse: Original Domain - lists.zx2c4.com
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - ntrv.dk
X-Get-Message-Sender-Via: m14060.contaboserver.net: authenticated_id:
 ch@ntrv.dk
X-Authenticated-Sender: m14060.contaboserver.net: ch@ntrv.dk
X-Source: 
X-Source-Args: 
X-Source-Dir: 
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

On Fri, 15 Oct 2021 at 04:39, Benda Xu <heroxbd@gentoo.org> wrote:
> > From the documentation Listenport only seems like the portnumber and
> > there seems to be no way to set the source ip.
>
> It has been discussed on the list several times.  But Jason seems not
> convinced of the necessity of address binding.
>
>   https://lists.zx2c4.com/pipermail/wireguard/2017-May/001280.html
>   https://lists.zx2c4.com/pipermail/wireguard/2019-March/003938.html
>   https://lists.zx2c4.com/pipermail/wireguard/2018-June/003013.html
>   https://lists.zx2c4.com/pipermail/wireguard/2017-November/002017.html
>
> Rulin and I tried to implement an address binding feature at,
>
>   https://github.com/FireflyTang/linux-wireguard-bind
>
> It was verified to work with Linux-5.7.

In the prototyping patch you developed for WireGuard, did you consider
prototyping being able to bind to an interface, instead of explicitly
specifying an IP address? An example case for being able to bind to an
interface could be a multi-wan connected firewall/router with dynamic
public IP addresses offered by the upstream provider no at least one
connection. E.g. Primary fiber line, backup DSL line.

/Chriztoffer

