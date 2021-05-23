Return-Path: <SRS0=22yv=KS=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 821FFC47080
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 23 May 2021 11:45:17 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 85AB461168
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 23 May 2021 11:45:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 85AB461168
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e67c7c8a;
	Sun, 23 May 2021 11:45:14 +0000 (UTC)
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com
 [2607:f8b0:4864:20::136])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id da5a3baf
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 23 May 2021 11:45:12 +0000 (UTC)
Received: by mail-il1-x136.google.com with SMTP id o9so22406315ilh.6
 for <wireguard@lists.zx2c4.com>; Sun, 23 May 2021 04:45:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=e4m8QbCrjp7TnD5TjqzqDQrH9RO5gWfd9fHxmBCL5Cw=;
 b=R1JZ56afJzh/x8yp4ZDSh+YlVD1znVRp0Ef91sURck4gydKFNsvfEysijct2vsVyUT
 AurRzTKslsljGYhp7im/OzNtyPqSwcEYWlpm98vsnjEV7v9KcGPz5g31rD7YrJ60eund
 wKDV8G/liTxneMgcD5O3MpanbpDCnycWcil05FE3Y6zHFyptQYNi/jRNXEQALHbUAhWt
 NS9/Y9XZsrqLybdt1/VRtK09ky5qUoKtVJpw6I/b3WrcaZf+xjLm6qT8OmMXzbCXnysn
 i4VEQ6vJr0wr9SU+Jg73O+yz13EdDy8RKx0e1Cc2jsZUCElcQxJoX30a3v7VDuxfABuo
 bZmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=e4m8QbCrjp7TnD5TjqzqDQrH9RO5gWfd9fHxmBCL5Cw=;
 b=iAI+aceK27M2M4Wovqkb6+I+lFJtSd6mcmuR1mnFI52XAeBDzGYuWDMC/hAbBZ48qd
 9YaOFDRNkF/k6NgW3f15vvjDVUWABxm7aH/4OARJtSsev2NY9/mD78Se2R3ErQ9kR+Rd
 hWIYbeLXqNOWYwKqVXNjamHjJv+wqSCufoRu7bDbfKclbAIQoMAHUjMUsG/YcDE0yLJe
 tAdE3MZFHLAHkRvLG55FXgAuFESfFqPLrFkeldg4VCjtRpBjeTYu5Sws0Dgc/UQ9fFSP
 UTciaalr0XdYy7wmQ1bTrmjGyB3mulwrcLN3GBDWlCTnxheroZU0JzfGBNDyefOlVqou
 1tOQ==
X-Gm-Message-State: AOAM532/5aaDqAh0MaXlgM2SLVIkbQf54MY69zoC3rUBex6mlFfyJYar
 nCrfJPl+zrlmbJKoMFDv6WtKcUqBXNGglIYCC88=
X-Google-Smtp-Source: ABdhPJz91hYc2BZgKLBI6EwYwdXJvecg5ub+EMEOvR5zz9gJzqkfqyPD8guFEGJcKqpiKXIMBJZUkdXxF/Ks9rFZmk4=
X-Received: by 2002:a05:6e02:587:: with SMTP id
 c7mr9807378ils.24.1621770311287; 
 Sun, 23 May 2021 04:45:11 -0700 (PDT)
MIME-Version: 1.0
References: <CAAMcf8BeGzUppFzfc2hF9KvpfU1DfSpncYv4AaK5Qf8_+fC-Rw@mail.gmail.com>
 <20210519234310.66ea294e@natsu>
 <CAAMcf8A9isAqhsXLHw1=8A6pyeDeXBPUan6s7_11_tDXJmg-jw@mail.gmail.com>
 <20210520111530.4568a14f@natsu> <20210520212056.1ddd3d5a@natsu>
 <cfef7862-cae8-6d13-269b-d01aa6f0a2b4@online.de>
In-Reply-To: <cfef7862-cae8-6d13-269b-d01aa6f0a2b4@online.de>
From: Vicente Bergas <vicencb@gmail.com>
Date: Sun, 23 May 2021 13:44:59 +0200
Message-ID: <CAAMcf8BqQc6C09nzsZQ2smygbpb-=BvWE_7U+gp8vpPK6eYBLA@mail.gmail.com>
Subject: Re: lost connection on dynamic IP
To: Max Schulze <max.schulze@online.de>
Cc: Roman Mamedov <rm@romanrm.net>, wireguard@lists.zx2c4.com
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

On Thu, May 20, 2021 at 9:23 PM Max Schulze <max.schulze@online.de> wrote:
> On 20.05.21 18:20, Roman Mamedov wrote:
> > On Thu, 20 May 2021 11:15:30 +0500
> > Roman Mamedov <rm@romanrm.net> wrote:
> >
> >>> So, what do you mean is that wireguard does a single DNS resolution a=
t
> >>> the beginning and further DNS resolutions need to be done elsewere. I=
s
> >>> that correct?
> >> Yes.
> Just to point out what 'others are doing' - openwrt has a watchdog
> script [1] that might be run with cron every 15 mins
>
> */15 * * * * /usr/bin/wireguard_watchdog
>
> which will update the new endpoint if the last handshake is too old:
>
> wg set ${iface} peer ${public_key} endpoint
> "${endpoint_host}:${endpoint_port}"
>
> It needs PersistenKeepalive also, if i understand correctly.
>
> [1]
> https://git.openwrt.org/?p=3Dopenwrt/openwrt.git;a=3Dblob;f=3Dpackage/net=
work/utils/wireguard-tools/files/wireguard_watchdog;hb=3DHEAD
>
> --
>
> Max

Hello, i've been running this script on a setup with a wg interface
with a single peer:
while true ; do
  sleep 300
  curr=3D$(date +%s)
  prev=3D$(wg show wg0 latest-handshakes | cut -f2)
  elapsed=3D$(( ${curr} - ${prev} ))
  [ ${elapsed} -ge 300 ] && wg syncconf wg0 /etc/wireguard/wg0.conf
done
on the client side for 3 days and the issue occurred once again.
This time the connection was restablished automatically and no manual
intervention was required.
Thank you Max and Roman.

Regards,
  Vicen=C3=A7.
