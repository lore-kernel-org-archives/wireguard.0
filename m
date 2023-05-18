Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3394CC77B7F
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 18 May 2023 01:31:26 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a19dd14c;
	Thu, 18 May 2023 01:22:54 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 35bcf499
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 18 May 2023 01:22:53 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4359F64C28
 for <wireguard@lists.zx2c4.com>; Thu, 18 May 2023 01:22:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7455DC4339C
 for <wireguard@lists.zx2c4.com>; Thu, 18 May 2023 01:22:51 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="GLsCqjFj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1684372969;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qOZXEweSAbSaLT/lMSUVVyFpux+M0zg06WVQ4J5+I5o=;
 b=GLsCqjFjfebrBNcZlzl1KsyUfQvv5BWoL8deq4injWI7XtxDW2eTbPGm+eV3F0nT1OLAXH
 HkdZZ9zas67b6wSK5iETeShuUbxCYpp39PgzqIlCqqqomiEjyM5kIogxSGIohjPj6YWtCK
 GmtQJ7cod8UbbrpFV7lnN5Vuq1o10h8=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id a671e08b
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 18 May 2023 01:22:47 +0000 (UTC)
Received: by mail-vs1-f47.google.com with SMTP id
 ada2fe7eead31-4361113bdd1so436020137.0
 for <wireguard@lists.zx2c4.com>; Wed, 17 May 2023 18:22:47 -0700 (PDT)
X-Gm-Message-State: AC+VfDxcH2qAKb+312eLveN3ehnHGPq4Mkxy/5/2kqj0DmBPRFq2DCk2
 gqH4oU8uht+s6yt3OY6PcEdO7l3szRPVS/5+j3M=
X-Google-Smtp-Source: ACHHUZ7A8so3Diums9Uz5Nuy0V5+VMb7GtAH4KL+5vZPt/Z8fmPJu7qNNTeBSs5SxgysulktuDU+rUrZWEiXz894UJI=
X-Received: by 2002:a67:de1a:0:b0:42c:77da:5d0a with SMTP id
 q26-20020a67de1a000000b0042c77da5d0amr15992398vsk.35.1684372967376; Wed, 17
 May 2023 18:22:47 -0700 (PDT)
MIME-Version: 1.0
References: <87fs7xtqrv.fsf@gmail.com>
 <CAHmME9rEKX_8s=WxoeBg5xf-5FLVxTm6q8Wo=-FrwRCuT7FX6Q@mail.gmail.com>
In-Reply-To: <CAHmME9rEKX_8s=WxoeBg5xf-5FLVxTm6q8Wo=-FrwRCuT7FX6Q@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 18 May 2023 03:22:36 +0200
X-Gmail-Original-Message-ID: <CAHmME9oh6toB+a=uWS8tYFiW6OyOJMYoSRoadwcxfpVrXfhAiw@mail.gmail.com>
Message-ID: <CAHmME9oh6toB+a=uWS8tYFiW6OyOJMYoSRoadwcxfpVrXfhAiw@mail.gmail.com>
Subject: Re: [bug] No keep-alives sent when private is set via PostUp
To: Maxim Cournoyer <maxim.cournoyer@gmail.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Thu, May 18, 2023 at 3:17=E2=80=AFAM Jason A. Donenfeld <Jason@zx2c4.com=
> wrote:
> Until this patch hits stable kernels, you can probably work around
> this by changing your PostUp into a PreUp. I adjusted the man page
> here:
>
> https://git.zx2c4.com/wireguard-tools/commit/?id=3D9d42bd1ab9d707f7a72162=
d36c9b37cc9bdf480e

Er, nevermind about this part. PreUp executes before the interface is added=
.
