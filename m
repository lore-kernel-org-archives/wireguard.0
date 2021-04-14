Return-Path: <SRS0=Tjnm=JL=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37B9BC433ED
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 14 Apr 2021 09:40:45 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4E28061220
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 14 Apr 2021 09:40:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4E28061220
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d37d5d83;
	Wed, 14 Apr 2021 09:40:42 +0000 (UTC)
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [2a00:1450:4864:20::132])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 6ac1a3a5
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 14 Apr 2021 09:40:40 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id f17so25079556lfu.7
 for <wireguard@lists.zx2c4.com>; Wed, 14 Apr 2021 02:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TtL10AMkryRcNm3ZBhU3qT+6AEmVlnv1csOd2NZIknU=;
 b=jcacOV4erKfqkxX+RFlGHeEjSYTxZFhY0iZvkpHLWQ/CcRZWWP0fT/9bEu6pIKNZLZ
 kLbf6xX9MXnrMw8b/oFlxoQFTwySHxj+qk/1z8jWsqDTj+hv3l0vguYRxw4cnFW5S4q8
 oe086HamFokIEzMXTlWBJrA6ZVXkdxEL/pltrLCkEH6n+tskTxvsH17ofx2bgxpK8580
 qTkhHd1bs64RuFhlCDrszoIH29xFsnIH/TqdsQdwbQovBAMJ1NAx2MY/5qc7e6fJRZDf
 qyGTbqlEXXr4q/B4sToFlhILe6X95FyWYTG9RTfjW9uBVWb//KZ2uCunDrizX/ni5ArR
 tZUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TtL10AMkryRcNm3ZBhU3qT+6AEmVlnv1csOd2NZIknU=;
 b=Pp9LTynsvQIz7I5ZbTTScpAauzRHVEmJ2e9Polw5AZRNUnFg2ShT/cBZIvk+vm4qwI
 n96wEIqA8LiPeqgAkpwjg7/GsPC1wiz94ss0pgjwh20dudkUgFakPDlwwHQkhLLCO6x6
 80euKKxHvgeCKIi67R5wUut2phKBf/b36AppUnh8MPntX0NVQNdnpVTHabUiaQZtChez
 TVSeiU4N5inFD6po9QHxyLFmQqrff6sTypBMf6lqc6lap1uaBGluj8lxWbZ72lOoBZiG
 6vqcNl1+SdDxCz9a/z01DJtV1JsPgbkLNKgRp1smJ0TvB7Vdn1CaWq8N/WseI4xG4eMD
 CHCw==
X-Gm-Message-State: AOAM531xjH7d7OUyjMLesN+VWbPmT7TA4qYEu5nFK2ymYWRVQLQzrhAR
 whKPpPDSHuWwn9mc47kGfDb2MzBKEnqwekKW6BxKEy+fPOKtEA==
X-Google-Smtp-Source: ABdhPJxR81Dn+GubVnFhsBKBydJ0uHsftzEFRITEBOXGIFze/JRc5yLAqPg300pTQsE7myWftOHwvyQNiLQ8isfsSlU=
X-Received: by 2002:a19:58a:: with SMTP id 132mr26673893lff.520.1618393240431; 
 Wed, 14 Apr 2021 02:40:40 -0700 (PDT)
MIME-Version: 1.0
References: <9f621ce6-ec3d-0641-c359-756d0ad36f65@gmail.com>
 <6a01b182-a98f-1736-676f-d0811f6de086@gmail.com>
 <CAHmME9qtPLOTaY3UzyCY1C6guVZXvJjXHeFwT8=94d=Zpjj=Tw@mail.gmail.com>
 <CAN5wt5poiJbOAfe+_VQpu=+6V8dLDiFDVyhUFNbad5NEd9YFfA@mail.gmail.com>
In-Reply-To: <CAN5wt5poiJbOAfe+_VQpu=+6V8dLDiFDVyhUFNbad5NEd9YFfA@mail.gmail.com>
From: Christopher Ng <facboy@gmail.com>
Date: Wed, 14 Apr 2021 10:40:28 +0100
Message-ID: <CAN5wt5qce9+b8okeKyH4j_U2kUrL5i=_UJ2VupNSJLR2NN5oRQ@mail.gmail.com>
Subject: Re: Problems with Windows client over PulseSecure VPN
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
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

not sure why this happens on my machine, but changing the command to

PostUp = powershell -Command "& {Start-Process -FilePath \"c:\program
files\wireguard\wg.exe\" -ArgumentList \"set my-tunnel listen-port
0\"}"

works for me and doesn't hang the Wireguard UI

On Tue, 23 Mar 2021 at 11:01, Christopher Ng <facboy@gmail.com> wrote:
>
> this sort of works for me too, the only problem is 'wg set' never
> returns (even on the CLI) so the tunnel activation hangs in
> 'activating' waiting for it to return, which it never does.  this is
> on 0.3.9 in windows
>
> On Wed, 3 Mar 2021 at 10:56, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> >
> > Hey Peter,
> >
> > I had a strange idea for how to fix this without requiring
> > recompilation or removal of that code.
> >
> > 1) Enable DangerousScriptExecution:
> > https://git.zx2c4.com/wireguard-windows/about/docs/adminregistry.md#hklmsoftwarewireguarddangerousscriptexecution
> >
> > 2) Add a PostUp line to your [Interface] section:
> >
> > PostUp = wg set %WIREGUARD_TUNNEL_NAME% listen-port 0
> >
> > 3) Try it and tell me if it works?
> >
> > Regards,
> > Jason
