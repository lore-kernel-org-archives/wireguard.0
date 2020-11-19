Return-Path: <SRS0=vJ13=EZ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48FEBC388F9
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 19 Nov 2020 20:14:06 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 236FE22261
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 19 Nov 2020 20:14:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="BoMYnh41"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 236FE22261
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7c6c044d;
	Thu, 19 Nov 2020 20:08:43 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id d29877bc
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 19 Nov 2020 20:08:42 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2a9d1353
 for <wireguard@lists.zx2c4.com>;
 Thu, 19 Nov 2020 20:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to
 :content-type; s=mail; bh=y/xMJwXDSIO0uf7SgUN8j66Vg+w=; b=BoMYnh
 41f7Aj8hLrrQqDlWhMKAzic5GOFuquGlzN4mmXJYozNvb2/Ve5zV2FomsMPqC7UD
 O9nxIw7PY9+cPrxeMchlEITCI0+0BPNZ/7s3eOSLSAJcDhlOT1YzfDYnZN2iSL/c
 dTmqrZwzG27V3f47sT2qjG29j/76Z2qJos9mF72nIupOfJCHERGYW+3ZpvM4n+2e
 SF2y8dCl7+4/kIedci18hX7+PUqlyT5lwwlKASHSKxjB00+2pC5+vs4UuHvd+RHP
 FPPTXOm+mhfqSIISZJw88dNAmazt3W+Ice3RKkTVEMeF5+5ek1ukNRIc20hqutkR
 byFmeDVxI8YwRRhQ==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 20e5cde4
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 19 Nov 2020 20:09:28 +0000 (UTC)
Received: by mail-yb1-f181.google.com with SMTP id x17so6393219ybr.8
 for <wireguard@lists.zx2c4.com>; Thu, 19 Nov 2020 12:13:36 -0800 (PST)
X-Gm-Message-State: AOAM532noTjj41cQyADNAMjc37zBVEvrhRQF8sxjf2pRx0Cpu1+f+vsm
 IEETvF0EKBcw/FDih0EL8zPhNnHVVL1tQgLY+uA=
X-Google-Smtp-Source: ABdhPJyaaUv+kfCftUc1RB+TcZZm5mtQ4TDq8aWyrXHUEu7eHNKyQJlTBINtYeFXXCRtmUJtTmEXqFcrTiatQN3Zw/M=
X-Received: by 2002:a25:df05:: with SMTP id w5mr22701358ybg.20.1605816815917; 
 Thu, 19 Nov 2020 12:13:35 -0800 (PST)
MIME-Version: 1.0
References: <bc1cd9b4-daac-4877-65a6-3fcf2ceeb980@53c70r.de>
 <CAHmME9puzYsBqZqOkJG73YhoQ-isgzca-XDX59icsOVjfg7brw@53c70r.de>
 <ae719178-bdac-0e3f-dae2-56adcbd0cbc1@53c70r.de>
In-Reply-To: <ae719178-bdac-0e3f-dae2-56adcbd0cbc1@53c70r.de>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 19 Nov 2020 21:13:25 +0100
X-Gmail-Original-Message-ID: <CAHmME9o1X_9JmRk_OzTcsDb8nXq3aT8JQge-+44ojx2RE48QOw@mail.gmail.com>
Message-ID: <CAHmME9o1X_9JmRk_OzTcsDb8nXq3aT8JQge-+44ojx2RE48QOw@mail.gmail.com>
Subject: Re: Progress on resolvectl DNS fail
To: Silvan Nagl <mail@53c70r.de>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
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

On Thu, Nov 19, 2020 at 6:59 PM Silvan Nagl <mail@53c70r.de> wrote:
>
> That's some wonderful news, thx for the information!
> I have 2 admit this bug is amusing to read.

Looks like Thomas has already written a patch for it:
https://gitlab.freedesktop.org/NetworkManager/NetworkManager/-/merge_requests/687/diffs
