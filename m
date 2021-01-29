Return-Path: <SRS0=P56g=HA=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C391C433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 29 Jan 2021 00:54:53 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 923CA64DE7
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 29 Jan 2021 00:54:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 923CA64DE7
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e0d5f085;
	Fri, 29 Jan 2021 00:54:50 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [104.131.123.232])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id e972abef
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 29 Jan 2021 00:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1611881685;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xy1PWYypLu3ktwDp1NfRm1QfRlZ3aecf+FwwxthNpJk=;
 b=lkXIb5Brv4ULnjlvl2voi9bKYOGh1jgMC7pSQRg495dBIqsTX6xxWNSHAifbr2u3OO8csp
 8AaUGNE20DHJguoImyUltq5unDl44aZ5grzdZbppK7ZD5rp3kYnvyutfnhwcSuK6QcOdPh
 1QKi31s0TD1TcaMp34ycbC1UlWZAL7E=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id d297f74c
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 29 Jan 2021 00:54:45 +0000 (UTC)
Received: by mail-yb1-f170.google.com with SMTP id b11so7312017ybj.9
 for <wireguard@lists.zx2c4.com>; Thu, 28 Jan 2021 16:54:45 -0800 (PST)
X-Gm-Message-State: AOAM531JzMhnOVD1HqLhccfR/SsS+v5WR5LQwTeAeiBXXk5lCCJaFIm2
 el4dHzCcEDYcHux8CbyUq33+S/x0bRVCSb2WDGQ=
X-Google-Smtp-Source: ABdhPJzCCb4Vyf9TqGP7EHg3CL+Y0gF/E4GHjTr8H9O2Ci90An1AYLMqTsUNqPfHGXu9qS1ZxX3HoE2e+Neu+EDoS/4=
X-Received: by 2002:a25:cc3:: with SMTP id 186mr2515478ybm.306.1611881684776; 
 Thu, 28 Jan 2021 16:54:44 -0800 (PST)
MIME-Version: 1.0
References: <CALaUSuuB=+ZDTsTaVs-pswd6fsu6CvZgO4b76HPGQZmwxssN0w@mail.gmail.com>
 <CAHmME9q5a1MVUQU3Hr=T32pjoW-=Hz+KyoBvvKgLgwQwWNoCYw@mail.gmail.com>
 <af71a4b2-989a-da04-2fa6-9467ec58997f@pineview.net>
In-Reply-To: <af71a4b2-989a-da04-2fa6-9467ec58997f@pineview.net>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 29 Jan 2021 01:54:33 +0100
X-Gmail-Original-Message-ID: <CAHmME9r_KsWNUWGF=bpqwO_bREtJRW49dso+N2WtbfGpa_P96g@mail.gmail.com>
Message-ID: <CAHmME9r_KsWNUWGF=bpqwO_bREtJRW49dso+N2WtbfGpa_P96g@mail.gmail.com>
Subject: Re: WireGuard for Windows tunnel deactivation after prolonged
 resolution failure during startup
To: "Mike O'Connor" <mike@pineview.net>
Cc: Joshua Sjoding <joshua.sjoding@scjalliance.com>, 
 WireGuard mailing list <wireguard@lists.zx2c4.com>
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

On Fri, Jan 29, 2021 at 1:39 AM Mike O'Connor <mike@pineview.net> wrote:
>
> Hi Jason
>
> I'm not a windows users so can not test, but it seems to me that
> Microsoft have API's to indicate the network status.
>
> This to indicate if there is a connection
> https://docs.microsoft.com/en-us/windows/win32/api/wininet/nf-wininet-internetgetconnectedstate
> This to indicate if there is route-able service. It seem this is
> deprecated for windows 10.
> https://docs.microsoft.com/en-us/windows/win32/api/wininet/nf-wininet-internetcheckconnectiona
> There is reference to a win10 version, in the notes.

Yes, these functions are already used in the existing algorithm. That
doesn't answer any of the questions raised, however.
