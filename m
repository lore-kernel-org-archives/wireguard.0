Return-Path: <SRS0=P8C1=77=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D795EC433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 18 Jun 2020 20:12:11 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6EC35208C3
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 18 Jun 2020 20:12:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="RCxZwDDZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6EC35208C3
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6e24d49e;
	Thu, 18 Jun 2020 19:53:28 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id df97d0af
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 18 Jun 2020 19:53:26 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7989fdb7
 for <wireguard@lists.zx2c4.com>;
 Thu, 18 Jun 2020 19:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type:content-transfer-encoding; s=mail; bh=V2RNGuP85JFv
 qy9wg/YAJWu0oA4=; b=RCxZwDDZDfHUipdmkgbLFouqC3esscWRIy/qu+yUEAdk
 a23AJqBASmdp+7FDn07POur8TedapNoC1ER7ez8pmRyZgyoTGXwNWzofv6ocQuWH
 7X0ThI2rdef6LxuyZ0EcEj/aMZMABRKgCuh+uf3HIlvwRXmypV+r/oUA6cie+4gu
 2A5OvG2D7x/FirySp+IZFDJoXUa/eh6wgl7pKZsUubfg3HKIDhaftz3I0kmNi0Dr
 QgSlDL4PIKavV6OA8m2mefLt2VIerq4DOpolt0nr+Fgq4nNVT9jqZYkge4/MDnIK
 LFZ2IUddDDQLOVHKTqKEUniEj7CmEPqGNpD3Hy68fA==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id c56be4b3
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 18 Jun 2020 19:53:26 +0000 (UTC)
Received: by mail-il1-f173.google.com with SMTP id e11so7160319ilr.4
 for <wireguard@lists.zx2c4.com>; Thu, 18 Jun 2020 13:11:42 -0700 (PDT)
X-Gm-Message-State: AOAM531SkiRD69N0L9dVUDkkcu8XwMtZgfZr+ZkwVnSDKNz+Vpq6gVCh
 7M6gHZpgRU+dLOOQjrD1P1l198zvwvvzwWbqxb8=
X-Google-Smtp-Source: ABdhPJzh3WOJ5DnyrfWX5TnvqQjemPbJlXBh+9zzFpRM2/UvLsNpAHg/kEsdR1ro0efsUJBzLsHIb0DUn+luqZePvHg=
X-Received: by 2002:a92:cf4d:: with SMTP id c13mr175957ilr.207.1592511101627; 
 Thu, 18 Jun 2020 13:11:41 -0700 (PDT)
MIME-Version: 1.0
References: <1592249458.376720421@webmail.emailsrvr.com>
 <CAHmME9oz5tt9u5S3V6JikvB3oGihXR5rcZTLvcjxNu4qnvWCOw@mail.gmail.com>
 <1592454690.22771558@webmail.emailsrvr.com>
 <CAHmME9qyk41mAvSiEePmZDrmmsBwOVSejg8q+oXV7nb=Jo1SAQ@mail.gmail.com>
 <1e6ef75d-3657-888a-51dd-0bedf8783904@sysnux.pf>
 <CAHmME9q_eTwyLJ7z4RP4nJqEz9yu+9VH3oXm0j9Zx_Br3cFWEw@mail.gmail.com>
 <613e8bab-4062-3cec-15ab-eeca325a5859@sysnux.pf>
In-Reply-To: <613e8bab-4062-3cec-15ab-eeca325a5859@sysnux.pf>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 18 Jun 2020 14:11:30 -0600
X-Gmail-Original-Message-ID: <CAHmME9rvJmH=fvxvVYi5n3QHzt2tNskqoghjWG++bJSsv8iu7g@mail.gmail.com>
Message-ID: <CAHmME9rvJmH=fvxvVYi5n3QHzt2tNskqoghjWG++bJSsv8iu7g@mail.gmail.com>
Subject: Re: Kernel Panic after updating Kernel
To: Jean-Denis Girard <jd.girard@sysnux.pf>
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

On Thu, Jun 18, 2020 at 2:10 PM Jean-Denis Girard <jd.girard@sysnux.pf> wro=
te:
>
> Le 18/06/2020 =C3=A0 09:48, Jason A. Donenfeld a =C3=A9crit :
> > I am unable to reproduce this issue with vmxnet3. However, as I noted
> > earlier, your wireguard version seems old. Try updating everything at
> > once, and then see.
>
> yum updated to wireguard-dkms.noarch 1:1.0.20200611-1.el7
>
> By the way, yum complains :
> Error! Could not locate dkms.conf file.
> File: /var/lib/dkms/wireguard/0.0.20181218/source/dkms.conf does not exis=
t.
>
> I cannot reboot now, I will let you know how it goes later.

Oh, in your case, you appear to be using the dkms package instead of
the elrepo package.
