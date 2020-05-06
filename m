Return-Path: <SRS0=yJRU=6U=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC6A2C28CBC
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  6 May 2020 11:20:41 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8416A20663
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  6 May 2020 11:20:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Etk7F5rA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8416A20663
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e4a5abfd;
	Wed, 6 May 2020 11:06:25 +0000 (UTC)
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com
 [2607:f8b0:4864:20::72e])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id f85419d1
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 6 May 2020 11:06:24 +0000 (UTC)
Received: by mail-qk1-x72e.google.com with SMTP id s9so1431880qkm.6
 for <wireguard@lists.zx2c4.com>; Wed, 06 May 2020 04:19:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KNTZ77AONcLc+/+IXsjv5VFyvkJSHCTSPujzPleZgWo=;
 b=Etk7F5rATsYGAtB1p7fLvg1VHgjsbuN1NL8Bt5lTMdFl+E0t20p9115MU2DUnqMZaa
 izt8Y9KrieYEgWP3jmLdo1jVh5ytksK1ov8+FMEcqQfAhtJBMAM0aRycFCkvf39wMZ0/
 Dd9wJ8LTkKTukPCLoecs/0/AwGCouHP8fux/5i8vcR8tiYrun9cRWnGeIoL/0XHWHRLa
 yZGzcYd/URLPmcgDO17jfLPrD41a86zeu1g76a6Db0fQLNNkqmvt99mCo4bSnfB3V84x
 7UBgtCce4qEnjRh8K5DxbYv0rC0uCTyiPfMlz4Ty1c+NBvtW+0YjP6w3kHpcutbBo3eb
 y+nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KNTZ77AONcLc+/+IXsjv5VFyvkJSHCTSPujzPleZgWo=;
 b=K7bQqPz+vEwmqh+j4h8vwAzcbgN+G31a/QJei50n24jLTKOxZWo69XE4bbuTvl8/Wa
 47bcgno6yUkNPlC003rUQ22FlOZyAqGs8kHXIYEctaXBEVbORWl127qLCwhddcWdigtv
 rC69uKyHo+VORt/e4lGXxIFJk3gU7XK9q0nN9e39q1Ld3+lAf9uDR86igdrD4jsUrY4D
 q+nXa9pvaqx585AqRx80/cYc707/OkC9c/FJsSWFWLdWsq+j0UKbyz4i6O/NwUaqfQfB
 lGOorE3xgpGli7aShsxmxcTveopxqvioiCbWTUfzxphRK8h02WqZkzaOYOvb6yAfnVNQ
 Ra8Q==
X-Gm-Message-State: AGi0Puac/dfV8Mk2Y3bedXU6ygYJmYU7Mem4WnQKfcoOm7bX0K/vIYvK
 5Qk09jw85QXOWB7naxlj4X5DNSVDOXhTR/wAgRp9XsP/
X-Google-Smtp-Source: APiQypLXuIgpvWjkLVKVriv+kihP2+AJu3GJPesaqo5LpGvWOJEte2GVeDLs4jgJhrYcZQ4XATllJ9d/cRXOTRPvHa0=
X-Received: by 2002:a37:3d7:: with SMTP id 206mr7521621qkd.89.1588763943262;
 Wed, 06 May 2020 04:19:03 -0700 (PDT)
MIME-Version: 1.0
References: <CAMXzSMozuS_dSpODmp3LzAmoetr9jKXUZpbQthx5P9YXk-xGAw@mail.gmail.com>
In-Reply-To: <CAMXzSMozuS_dSpODmp3LzAmoetr9jKXUZpbQthx5P9YXk-xGAw@mail.gmail.com>
From: Laszlo KERTESZ <laszlo.kertesz@gmail.com>
Date: Wed, 6 May 2020 14:18:51 +0300
Message-ID: <CANcuY=qdMqMtCd=-8M5zYU=fRokkWokMa9dDJwUBHh5=M=nj6Q@mail.gmail.com>
Subject: Re: Android client fails to auto start connection if using a DDNS
 address as endpoint
To: Dark Shadow <shadowofdarkness@gmail.com>
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

Hi,
I too have this issue. My ISP does not provide a fixed IP address and
if the address changes, the Android client does not reconnect. Not
very user friendly as it is hard to do external checks and restart on
mobile.
Also this is true for the desktop version of wireguard, at least on
Linux with both ifupdown and systemd-networkd (i could script a check
and restart easily though).


On Wed, May 6, 2020 at 1:49 PM Dark Shadow <shadowofdarkness@gmail.com> wrote:
>
> I set up Wireguard and had it working fine when manually starting the
> connection.
> After that I wanted to have it be always on so that it would auto
> connect when turning the phone on but I found that it would say it was
> connected but no data would transfer.
> Manually turning it off and on again would fix the connection
>
> If I change the server address to a IP address everything works
> correctly and the connection just works after turning on the phone.
>
> I assume this is a bug that can hopefully be fixed as I would prefer
> to use the dyndns address in the settings.
