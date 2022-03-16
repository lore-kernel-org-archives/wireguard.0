Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67088C4332F
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 16 Mar 2022 04:40:08 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 507c4f8e;
	Wed, 16 Mar 2022 04:39:24 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id b694e4fc
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <WireGuard@lists.zx2c4.com>;
 Wed, 16 Mar 2022 04:39:23 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 48F4FB818CB
 for <WireGuard@lists.zx2c4.com>; Wed, 16 Mar 2022 04:39:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF816C340E9
 for <WireGuard@lists.zx2c4.com>; Wed, 16 Mar 2022 04:39:21 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="lpeaUz/J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1647405560;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=b4Mq3D4AsilYLBva/VNL8qSyXm1G05szI2Gw9Q2B1zE=;
 b=lpeaUz/JuOtmpVsEBgpsEooSH9+RqfcFH6maG7suQwP4K5ka0wntISfb30Y5Dk0viSjFgf
 5EoxjKuoKuOxPp04zW1hPlExlztXDoWR4dllmIXrB8NmnkwA5czrBpdgNnMyK2OvrgIBjf
 8fxBSPn0QG/Ww+K7fls7ne2ijG1keck=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id be69a140
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <WireGuard@lists.zx2c4.com>;
 Wed, 16 Mar 2022 04:39:19 +0000 (UTC)
Received: by mail-yw1-f181.google.com with SMTP id
 00721157ae682-2dbd8777564so10951017b3.0
 for <WireGuard@lists.zx2c4.com>; Tue, 15 Mar 2022 21:39:19 -0700 (PDT)
X-Gm-Message-State: AOAM533gPDcMqu17B7tf3d7IgFVRw6PcNuBVe44xK1QT+2Kd1iSGEMgE
 TjEYygFXnsLCNrXmP1m4JbfKqrWUb41idxBBryg=
X-Google-Smtp-Source: ABdhPJzQk3LSU9p8YahF76VKPSz72LDyRQFXLkjSev51uNyr8TP0X2y3asvD1L/cIB4k50jnFXPnYn+Pm3DRdVOJnWo=
X-Received: by 2002:a0d:e005:0:b0:2d7:fb79:8f36 with SMTP id
 j5-20020a0de005000000b002d7fb798f36mr29442737ywe.404.1647405559205; Tue, 15
 Mar 2022 21:39:19 -0700 (PDT)
MIME-Version: 1.0
References: <CA+f5crf3w-BV7-Hp6FpSvCnMY3VXDug2_cvu=iDEyJVezzANOw@mail.gmail.com>
In-Reply-To: <CA+f5crf3w-BV7-Hp6FpSvCnMY3VXDug2_cvu=iDEyJVezzANOw@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 15 Mar 2022 22:39:08 -0600
X-Gmail-Original-Message-ID: <CAHmME9pN-ALmcckt8Yjr37L5noXe2n7vsJ-sFtdf101iCVOusA@mail.gmail.com>
Message-ID: <CAHmME9pN-ALmcckt8Yjr37L5noXe2n7vsJ-sFtdf101iCVOusA@mail.gmail.com>
Subject: Re: Need Help - When 2 WireGuard tunnels are active Windows BSOD
 occurs upon disconnecting/disabling Ethernet NIC
To: Siva R <siva131mz@gmail.com>
Cc: WireGuard mailing list <WireGuard@lists.zx2c4.com>
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

Hi Siva,

Can you send me the files in C:\windows\minidump and
c:\windows\memory.dmp if it exists? This will let me figure out what's
happened. These contain memory dumps of crashes, so you should
probably send it to me directly rather than to the public mailing
list.

Thanks for reporting the bug.

Jason
