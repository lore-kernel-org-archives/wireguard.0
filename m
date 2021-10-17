Return-Path: <SRS0=mIIS=PF=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A8B6C433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 17 Oct 2021 05:09:12 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 799AE61050
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 17 Oct 2021 05:09:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 799AE61050
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d681d4e6;
	Sun, 17 Oct 2021 05:09:09 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 74a65d5e
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 17 Oct 2021 05:09:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7EC2B6101E
 for <wireguard@lists.zx2c4.com>; Sun, 17 Oct 2021 05:09:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="ERY7AwrF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1634447344;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=B1d53o4/+80kOKTGIQIb/bwbhGCEtkWiW0f3j0Uz3Q8=;
 b=ERY7AwrFnk7xAmif7IUiTNwht15ElUxIxi1rZdQwe/PN6icr9dlOfUNrJ9+pKjJ5Re4jU+
 k+ErnU8O/M4qZBDNtbefdGAiZKfgsR/6hkMGzdWYyL3axPd0BYqDudvCU3A9NIxOGyAR0P
 e1dm6K2mq/qzt7868hHoTE86wDegVuU=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id f141f4fa
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 17 Oct 2021 05:09:04 +0000 (UTC)
Received: by mail-yb1-f169.google.com with SMTP id q189so563375ybq.1
 for <wireguard@lists.zx2c4.com>; Sat, 16 Oct 2021 22:09:04 -0700 (PDT)
X-Gm-Message-State: AOAM530PfdPqjYA/SEpjX7o2gEyxpjWadaOdwU2lPtnkaiABqieB0nlW
 5fjPsebcQfkFGh70qRYwN7vGaKA15xir6GnmfMQ=
X-Google-Smtp-Source: ABdhPJyM5RRYdRo1sJEOlilAgvMKB67Kj4K+rWdPQXvuZucCpVgUhqFEvT7T5XlEQZ2X5nxAoc1aDqJByJdFlP8LeZo=
X-Received: by 2002:a25:bd03:: with SMTP id f3mr21040298ybk.412.1634447343351; 
 Sat, 16 Oct 2021 22:09:03 -0700 (PDT)
MIME-Version: 1.0
References: <YQgrCfqIL2SWfF6G@zx2c4.com>
In-Reply-To: <YQgrCfqIL2SWfF6G@zx2c4.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sat, 16 Oct 2021 23:08:52 -0600
X-Gmail-Original-Message-ID: <CAHmME9rL7FT=fmrV-Vv7RgWd5dvoPo29tK8ctbhG7KddvLXZ7A@mail.gmail.com>
Message-ID: <CAHmME9rL7FT=fmrV-Vv7RgWd5dvoPo29tK8ctbhG7KddvLXZ7A@mail.gmail.com>
Subject: Re: [ANNOUNCE] WireGuardNT, a high-performance WireGuard
 implementation for the Windows kernel
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
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

Hi folks,

As described in August:

On Mon, Aug 2, 2021 at 11:28 AM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>   Phase 3) WireGuardNT is enabled, and wireguard-go/Wintun is removed from
>            the client. [Do note: as projects and codebases, both Wintun and
>            wireguard-go will continue to be maintained, as they have
>            applications and uses outside of our WireGuard client, and Wintun
>            has uses outside of WireGuard in general.]

After a considerable amount of testing and 11 releases, we are now in
phase 3, and the transition is complete. WireGuard for Windows v0.5 is
being released as we speak, and contains WireGuardNT 0.10.1, which is
now fully WHQL Certified and will run on all flavors of Windows
Server.

Thank you very much to everyone who helped test and stabilize this code.

Regards,
Jason
