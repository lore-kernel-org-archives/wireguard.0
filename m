Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F3D6C6FA86
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 22 Sep 2022 11:36:42 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id bcecb762;
	Thu, 22 Sep 2022 11:34:47 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id db05f363
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 22 Sep 2022 11:34:44 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 56820B835ED
 for <wireguard@lists.zx2c4.com>; Thu, 22 Sep 2022 11:34:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C89F0C433D7
 for <wireguard@lists.zx2c4.com>; Thu, 22 Sep 2022 11:34:42 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="WbnpDMWA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1663846480;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JKtOCHQ9Z95+IPxcxErWBTAALJ2Qt0gHIFXj0lxFs/0=;
 b=WbnpDMWAfZjf+xa1vRnHJ+eUSKW68W7mlGF1bXcFtn+ncKBWxREPxqRKMX1mqF/lNtg6i/
 6fcmIA7WYW5Yk7GEPcFiTcTcTMAbARwayDPHpHBRDx1q3YglAM+bOO+bXC3Nkjzut5tsXx
 A67vPlnLn2rqrWUPak85301qAuUbbQw=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 86cb29f9
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 22 Sep 2022 11:34:40 +0000 (UTC)
Received: by mail-vs1-f48.google.com with SMTP id d187so279266vsd.6
 for <wireguard@lists.zx2c4.com>; Thu, 22 Sep 2022 04:34:40 -0700 (PDT)
X-Gm-Message-State: ACrzQf2bdWOzqJKiHZZs9cpaju48qrHFygvQq8aaCmExxuXXqQpSH7T7
 4CZpLiSg4M0dWSYvyf5yAI6buVrI4spWtRZGWUg=
X-Google-Smtp-Source: AMsMyM5s17jBwnTxnWmQJ1AIXxM6c94ecT7s/iTM+c+jsXPXygpqQhI+SAbZ7Qr4nStY4tqG1bi8EokaSiZMyNfd7js=
X-Received: by 2002:a05:6102:2908:b0:398:ac40:d352 with SMTP id
 cz8-20020a056102290800b00398ac40d352mr758507vsb.55.1663846479919; Thu, 22 Sep
 2022 04:34:39 -0700 (PDT)
MIME-Version: 1.0
References: <CALDyVtsgMjH1YqrTrosDVU2khC9iEgMgUYDd8D65+h-K54y2fA@mail.gmail.com>
 <CABBZOs=bkOWQv09UQJnf18xVGAq_o6O+Ar+asMKoXtghcQvnog@mail.gmail.com>
 <ee65e180-eef5-b882-58ab-8a1188a38a09@ut1.org>
 <235c4ba6-95cf-2532-1b7d-3754cc4f255d@aixigo.com>
In-Reply-To: <235c4ba6-95cf-2532-1b7d-3754cc4f255d@aixigo.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 22 Sep 2022 13:34:29 +0200
X-Gmail-Original-Message-ID: <CAHmME9pnz8zWOLL+1zCPhEPyxiyM-mGDE9x6p_xqQ3q8CxkyMg@mail.gmail.com>
Message-ID: <CAHmME9pnz8zWOLL+1zCPhEPyxiyM-mGDE9x6p_xqQ3q8CxkyMg@mail.gmail.com>
Subject: Re: MacOS app update needed
To: Harald Dunkel <harald.dunkel@aixigo.com>
Cc: wireguard@lists.zx2c4.com
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

On Thu, Sep 22, 2022 at 1:32 PM Harald Dunkel <harald.dunkel@aixigo.com> wrote:
> Maybe Apple would include wireguard into MacOS' kernel as well,
> if there is sufficient demand for this feature? Make

I offered to do a kernel implementation for them, but they never got back to me.
