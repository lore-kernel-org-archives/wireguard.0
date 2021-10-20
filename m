Return-Path: <SRS0=38ps=PI=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29864C433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 20 Oct 2021 17:59:50 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C3D860FC1
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 20 Oct 2021 17:59:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2C3D860FC1
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3a45b043;
	Wed, 20 Oct 2021 17:57:06 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 9d077eab
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 20 Oct 2021 17:57:05 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1C3FD61260
 for <wireguard@lists.zx2c4.com>; Wed, 20 Oct 2021 17:57:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="LeoSqlWY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1634752620;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GZmJPgvCUWC4xn2FamQPecrLs12EFwE875PK8ptHLkQ=;
 b=LeoSqlWYiBgOsIDobQ9rm8z7NwHktrdlbghWP2VxGbaQo4f80qJPr67WTgp6SHfBryeK3k
 5KcFF/E2DUyFFWrEWP9O0Zd8Ts63nmeCssAlqAcVwBZX0O4Ys4pmrYmIonI/LG8/AZyo90
 QVJnh7Pa7PdagVpyexhQX4TVPghlYZ0=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 0e11af18
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 20 Oct 2021 17:57:00 +0000 (UTC)
Received: by mail-yb1-f170.google.com with SMTP id o134so12286917ybc.2
 for <wireguard@lists.zx2c4.com>; Wed, 20 Oct 2021 10:57:00 -0700 (PDT)
X-Gm-Message-State: AOAM532EkXWCmRaLmxLBTEcObUnTPJiL6OYuSSuF197hir1U3Thf8KKs
 kc0MDV4wcU3C2nJWkSMFO6Kv3wS+ApqKyoggDPs=
X-Google-Smtp-Source: ABdhPJwV3KwPvmMBgDLqOD73izRbtvA153nzm9MWaJaL3PjqxvIkQu9OAOjDNOUZ8GPF86lWnzj/VLZpN2fCa37NcJA=
X-Received: by 2002:a5b:783:: with SMTP id b3mr553730ybq.328.1634752619670;
 Wed, 20 Oct 2021 10:56:59 -0700 (PDT)
MIME-Version: 1.0
References: <YWFuczOf1dM3B4Pt@falared> <YW6ljZ3yvGsv9Njq@falared>
 <CAHmME9off=sXrL0hjkGvOgJUtJx6oCvhdAycHT=bTQfUtQjO=w@mail.gmail.com>
 <YW/awIN8jqUF0DPk@falared>
In-Reply-To: <YW/awIN8jqUF0DPk@falared>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 20 Oct 2021 11:56:49 -0600
X-Gmail-Original-Message-ID: <CAHmME9oL7UNWKbX3ZF-U_O+a9Kwn9gwsexzDQo9gngjhEdgc8Q@mail.gmail.com>
Message-ID: <CAHmME9oL7UNWKbX3ZF-U_O+a9Kwn9gwsexzDQo9gngjhEdgc8Q@mail.gmail.com>
Subject: Re: Build wireguard-linux-compat on SLES15 (s390x)
To: daniel.wagner@suse.com
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>, faustin@fala.red
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

Hi Daniel,

Do you think you could chime in here regarding the apparent absence of
wireguard on s390x? The thread began as a discussion of building it
yourself there, but I'm wondering why it isn't already there, seeing
as it's on the other archs.

Jason

On Wed, Oct 20, 2021 at 3:01 AM Faustin Lammler <faustin@fala.red> wrote:
>
> Hi Jason!
>
> "Jason A. Donenfeld" <Jason@zx2c4.com>,
> 19/10/2021 =E2=80=93 17:51:01 (-0600):
>
> > Isn't WireGuard already in the SLES kernel?
>
> My understanding is that it should, that's why I was surprised to have
> to build it. But apparently not.
>
> This may be related to a specific kernel from IBM LinuxONE cloud
> infrastructure?
>
> | $ uname -r
> | 5.3.18-24.86-default
>
> But again, my knowledge of SLES is very limited (and s390x architecture
> even more) so I don't have any idea why this was needed.
>
> I'll be happy to help you if you need me to do some tests on the
> machine.
>
> Cheers!
>
> --
> Faustin
