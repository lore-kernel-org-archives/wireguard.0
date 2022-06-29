Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28587C43334
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 29 Jun 2022 12:28:43 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id ff669ff0;
	Wed, 29 Jun 2022 12:27:46 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org
 [2604:1380:4601:e00::1])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id f5b4cbd7
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 29 Jun 2022 12:27:45 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 332DCB82050
 for <wireguard@lists.zx2c4.com>; Wed, 29 Jun 2022 12:27:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B01FC341C8
 for <wireguard@lists.zx2c4.com>; Wed, 29 Jun 2022 12:27:43 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="IvG0CrdV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1656505661;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=96RlBoGx/O51DTGP8IvPyvTECDyVEfwsqc/utEglxGE=;
 b=IvG0CrdV+HVOXG/XgVoVczEqVg1ROD+lOY3nwQA1IP4v9Ct3KYTJcxQ2//+CmOCqa1osrs
 xSVR4/iEimtcmpyWE3LZfHw5pj+/aca2csy3Glr93VBTiOGkUYAISOzPQx2q5WbdKEI0IY
 Yh/scxFoN0pK0AL2u+uCWrqhSfvM0/E=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 734b8287
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 29 Jun 2022 12:27:41 +0000 (UTC)
Received: by mail-il1-f173.google.com with SMTP id n14so10144002ilt.10
 for <wireguard@lists.zx2c4.com>; Wed, 29 Jun 2022 05:27:41 -0700 (PDT)
X-Gm-Message-State: AJIora89sPvlSeNvsmY34VOgKvLWIjvPS2b0ErZ+UKwGMNPfCal9cIqK
 6DEMEUcdo1nBCxcFMBLfFn+VRt78ReqB7YdKCpo=
X-Google-Smtp-Source: AGRyM1sHqMx59Tucj71tzD8uj6N/FWUXYHWwEVofhFiRiFJU5/9tcMxWmZVuj1vgrqRTyPLx7AWOILTfXsitVVv+SLE=
X-Received: by 2002:a92:cda5:0:b0:2d9:5bc5:6661 with SMTP id
 g5-20020a92cda5000000b002d95bc56661mr1881959ild.16.1656505660777; Wed, 29 Jun
 2022 05:27:40 -0700 (PDT)
MIME-Version: 1.0
References: <b05c9019-5165-84f0-b3f1-a0eeb30faad1.ref@yahoo.co.uk>
 <b05c9019-5165-84f0-b3f1-a0eeb30faad1@yahoo.co.uk>
In-Reply-To: <b05c9019-5165-84f0-b3f1-a0eeb30faad1@yahoo.co.uk>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 29 Jun 2022 14:27:30 +0200
X-Gmail-Original-Message-ID: <CAHmME9o5Qpg_oHjWFBa6zoVZd4ALOpBnjj7Y-y_ipgtZ4+o_qQ@mail.gmail.com>
Message-ID: <CAHmME9o5Qpg_oHjWFBa6zoVZd4ALOpBnjj7Y-y_ipgtZ4+o_qQ@mail.gmail.com>
Subject: Re: package from fedorainfracloud for centOS 8 does not build
To: lejeczek <peljasz@yahoo.co.uk>
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

On Wed, Jun 29, 2022 at 2:17 PM lejeczek <peljasz@yahoo.co.uk> wrote:
>
> Hi guys.
>
> In case somebody here looks after
> 'copr:copr.fedorainfracloud.org:jdoss:wireguard' then
>
> wireguard-dkms-1.0.20220627-1.el8.noarch for 4.18.0-394.el8.x86_64 fails
> to build
>
> many thanks, L.

https://lists.zx2c4.com/pipermail/wireguard/2022-June/007664.html
