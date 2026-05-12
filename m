Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58BE8CD4855
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 12 May 2026 07:08:52 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id cb758716;
	Tue, 12 May 2026 07:08:50 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 3cc5ae54
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 12 May 2026 07:08:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 982F460121
 for <wireguard@lists.zx2c4.com>; Tue, 12 May 2026 07:08:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07F99C2BCF7
 for <wireguard@lists.zx2c4.com>; Tue, 12 May 2026 07:08:39 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="SvrKmrvA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1778569717;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6qSnKuYXnSPbWOuZbGE3zR12VFVPxcnGy0NU0Sy6EaY=;
 b=SvrKmrvAp+e3yZ+2atqSMgrMyQ44XO/ryK6veDxwoHLMEMGZwQ2khaFUZaVcImicADn662
 lk08QBVSpIx35EbnJh0pzPCqzTUxg8TArzsvX48r23ppX7C5Ig9vVjncH/sTDP9pYjKhAk
 4JbjazXtu4ZAxEKWLyf5NS2UfFgNYTI=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 5cc98fa4
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 12 May 2026 07:08:37 +0000 (UTC)
Received: by mail-oa1-f51.google.com with SMTP id
 586e51a60fabf-43034c0fd27so1900813fac.1
 for <wireguard@lists.zx2c4.com>; Tue, 12 May 2026 00:08:37 -0700 (PDT)
X-Gm-Message-State: AOJu0YywUolgFOg+YMkHri//aJE8ywYFE78uuN4SIk1DoOeFi54ZPl3b
 GZpv5jn3S0f1f2+EfuABj2hfP74pQTnY1Ru9z2zBo2AiYVZYb/I/D85H5h9ef+RfFLBCn/Cc9RB
 pWAB8puNj8cI/xV17POACANL/k28ImKU=
X-Received: by 2002:a05:6870:f202:b0:42f:24c4:e317 with SMTP id
 586e51a60fabf-439a2495454mr1146570fac.14.1778569716737; Tue, 12 May 2026
 00:08:36 -0700 (PDT)
MIME-Version: 1.0
References: <CAJQz1VbZJuzcrC_BkV=Rdaehj_-irhXQYZrt2kCCg+FG_TTW6w@mail.gmail.com>
In-Reply-To: <CAJQz1VbZJuzcrC_BkV=Rdaehj_-irhXQYZrt2kCCg+FG_TTW6w@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 12 May 2026 09:08:25 +0200
X-Gmail-Original-Message-ID: <CAHmME9pp0zjq9OEnn98g-ud_dZ515JWJNRbzmq5iECwUjYGuww@mail.gmail.com>
X-Gm-Features: AVHnY4J3eiyXXJo27pMXG0unZAkLysqcvsaqdfJYRaHJrUZMjSROGk6eQI2GqsQ
Message-ID: <CAHmME9pp0zjq9OEnn98g-ud_dZ515JWJNRbzmq5iECwUjYGuww@mail.gmail.com>
Subject: Re: Unable to use wireguard 0.6 / 1.0 / 1.0.1 on Windows 24H2
To: Justin <justin.t.ho@gmail.com>
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

Hi Justin,

I'm working on this now. I think I have a decent idea of what's
happening (odd windows bug), but could you email me (privately) all of
the logs in \windows\inf\, including the historical backup ones, the
offline ones, the upgrade ones, the setup ones, etc, so I can try to
figure out the whole flow of the bug?

Thanks,
Jason
