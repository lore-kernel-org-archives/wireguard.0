Return-Path: <SRS0=TBPu=IH=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E2BCC433DB
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  9 Mar 2021 21:08:15 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6E85565256
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  9 Mar 2021 21:08:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6E85565256
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=vlaicu.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 90022436;
	Tue, 9 Mar 2021 21:05:23 +0000 (UTC)
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com
 [2607:f8b0:4864:20::130])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id e66cc132
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 9 Mar 2021 07:21:50 +0000 (UTC)
Received: by mail-il1-x130.google.com with SMTP id e2so11334774ilu.0
 for <wireguard@lists.zx2c4.com>; Mon, 08 Mar 2021 23:21:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vlaicu-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=v9PTg+2i0XiXJyvrXxqKxyqMhrwEUmotEXH+NRKkvaQ=;
 b=eAoq22HKqHq/uIVEut82l4d652L5uYwzpD4svRx9DTXuObsDrTVhO+emcX5LhPWIc/
 yMjw2bEX+5hbUxwtbH3xvadTMnlcrKF7JgU321//28kkasS9LYT2eMpHonso7DazmaZN
 lRi5l/4o9QnNJoLW1tdbB1YtrPAmmXFxEHT26ShGDQuWrnvGPAEFi48iFa9dKsXW+hAy
 O2AOi+JHzBN/RutHmpekhOKFkKhDuv5Gh2D92jgSLkTiYHWlZ04F9B2Qm8k+67KgGnHd
 xP539TMyVURIl3L9cbDCD6vDgKQgLi9Odx3yS7BG+ewifWs8vf0Dqt9SlgPbWAhF+dlY
 EacQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:content-transfer-encoding;
 bh=v9PTg+2i0XiXJyvrXxqKxyqMhrwEUmotEXH+NRKkvaQ=;
 b=iQk0gmEhK+kULCNUO+cZyrdaZoLh9sRiDjDuOiVAT4CnQ/WItONU5p7h0+btFZHXiv
 uw40IXSZnrD/Vb/v+g99+Zv5AZhoh6nmc9hbqSLMkXt+A28V+BT7uEIrXIeEF2mVQryi
 85oDSfvBDXOfdZGifhpI/xiYx9PynwyMO/vHHME4XNjMLXgnWVuXRRw1Je9ij7b34n7M
 2HqWUIjBBfjAv2CtqpV3fFQWURtXycJ20hyU07Lmmp5TOf6uNQfXcfdlZkXYoktoio3d
 96+/ToteKoe9JXkKg9aOs8KoPvQjFc5MtmoVUIOVEm2eVMtRxlS0YbnFVf/i9SA7HB9z
 h3QA==
X-Gm-Message-State: AOAM531N52VzMDnQ7Hioei9Ud2WJbM09vA50H1j2oALXI/i9pbZDxoig
 Pj1W/YRpu7UgV5ip+6a28+gdRwlV6vTmFLyKGx0RE0TV1Xc=
X-Google-Smtp-Source: ABdhPJyZDN6GTw/AhVv/S4/+L6E+OJBbwtmZKd8CgqxlHLjjBEZPZAuWBtCMYQvqhkkFCn68iw5NHjm3WSEtje3fvRU=
X-Received: by 2002:a05:6e02:1049:: with SMTP id
 p9mr23706349ilj.125.1615274508527; 
 Mon, 08 Mar 2021 23:21:48 -0800 (PST)
MIME-Version: 1.0
References: <CAGpywxMdXntKVgEi45zXHGGmnHXeBk4Tiy-c4CkXOF4e9_Oz1w@mail.gmail.com>
 <CAOAVeL0mxeXGJXs6idBXyi8ibVvJ2d3qAtEo2Yd2Bby37zQ1RQ@mail.gmail.com>
In-Reply-To: <CAOAVeL0mxeXGJXs6idBXyi8ibVvJ2d3qAtEo2Yd2Bby37zQ1RQ@mail.gmail.com>
From: Florin Vlaicu <florin@vlaicu.com>
Date: Tue, 9 Mar 2021 09:21:13 +0200
Message-ID: <CAGpywxMdNnkx2yZR5y0-P1Czuy1FAWYn-=4EaRDWbE_Rz=60cg@mail.gmail.com>
Subject: Re: Routing issue
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Tue, 09 Mar 2021 21:05:22 +0000
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

In the meantime I was able to debug and fix this issue with the help
of the IRC channel.
It turns out the container on the other host had different mac
addresses as soon as I synced them things started working.

Thanks,
Florin

On Tue, Mar 9, 2021 at 8:55 AM Henning Reich <henningreich@gmail.com> wrote=
:
>
> Have you check time/timezone and wait enough time to clean/rebuild arp ca=
ches?
>
> Florin Vlaicu <florin@vlaicu.com> schrieb am So. 7. M=C3=A4rz 2021 um 18:=
26:
>>
>> I am running a server in a container that uses a macvlan interface to
>> have a static IP address in my local LAN. Then from my router I DNAT
>> to that IP address.
>> If I stop the container and then start it on another host (with the
>> exact same configuration) existing tunnels will fail, but new ones
>> will work.
>> If I just restart the container (or even reboot the host) the existing
>> tunnels will come back up.
>> Is there something I can change on the clients to not have to restart
>> the tunnel?
>>
>> Thanks,
>> Florin
