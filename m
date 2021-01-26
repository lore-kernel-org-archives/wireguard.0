Return-Path: <SRS0=hg4e=G5=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB26DC433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 26 Jan 2021 21:55:51 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9F0F52064C
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 26 Jan 2021 21:55:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9F0F52064C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=prosimo.io
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2854fa11;
	Tue, 26 Jan 2021 21:55:48 +0000 (UTC)
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com
 [2607:f8b0:4864:20::733])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id da68b058
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 26 Jan 2021 21:55:46 +0000 (UTC)
Received: by mail-qk1-x733.google.com with SMTP id x81so14715451qkb.0
 for <wireguard@lists.zx2c4.com>; Tue, 26 Jan 2021 13:55:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=prosimo-io.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=YPfIFe9xLDp+clhMbrkD5QS/7LGnbE8RYMwvW8O6Jf8=;
 b=QfkOw27fpdJhMPN+CUjpE//NkX70JMywp/tXEC+4S1+owQb2fvw+1ma4q3rHFfQzYM
 YpNIRVN2/7It2Wm+V4eIlrI1w0di7cxB5rB+y1tYqh0hxmpnbvUqDH+sCfIc5HEuR5uG
 zRsKVSYOjIJyOLCIjIqeukkbu3+SWAiccFxM1KQy5DCUYqfHOg/YGNgz3S9Z5sbs1FtF
 hrbJtobJQL4UB5b6VPWqbtXGvzHa1ZUYNCBvDt4Lxn1tjJqY4CW+GzlNeZSNLMX/ZmBW
 zDvpYBkMJOi6MOtHErjseVmavOJziI3EBRAP892BytXH+IiTMcqtRmzuZhX8jhPaSHuA
 g+MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=YPfIFe9xLDp+clhMbrkD5QS/7LGnbE8RYMwvW8O6Jf8=;
 b=jF5hHiEAEK4VkLctd7SFh45VuyqsJN4yf2pfSsnhfJ89OOvGh0Q5mGZDPE273JVNxF
 rU3tBOMK35d/R2JJ/Oh5JzbJTen0688JyWtBWPsolrzDkYY7JoJkJblcZzoKMg7Swa1F
 xvmJEGEWmap4vMe3oCvkxcj3YmxGHNwRF4ibRpGlFIT7ytaLYQkBrMHDmLLNZEOKDGDJ
 drWj5U8REM7ktkSdBGsom2ZAVhjsxm+l+NBFVDR19u4yk/THkTzq05cytfhM5v/pIUuq
 xQyjf4Ly6+io4qlX/RGihN573MMlps/UusvCCy2s//EGVoq0G6i1NrOQtfQnGboiGSo0
 yR7Q==
X-Gm-Message-State: AOAM532LDzxu9zMPryxaHBbBLsCL0BA7dQnvELkiF3oheqRjZvR/6hwH
 jbT+wMf3Z5CFgiuNMzjp7tAo+f/la4HaBMBgfPYqzyYmfgoA2m9I
X-Google-Smtp-Source: ABdhPJxGzyOgzbXLPKkKr6uB6i/qhC9StXXknWiQhq2kXvJmcuLr7Z791PLAOCI/N37+BGaJvzLiC7TPZwcCnrM1aVU=
X-Received: by 2002:a37:9ac5:: with SMTP id c188mr7735744qke.422.1611698145283; 
 Tue, 26 Jan 2021 13:55:45 -0800 (PST)
MIME-Version: 1.0
References: <CAJV1VRBLdBwD=bud-M7LmcFUiHfHdNa3iNbBFzJzj+4GNpPSRQ@mail.gmail.com>
 <42d43d1503f34b8c87acda5fdf50307c@rozman.si>
In-Reply-To: <42d43d1503f34b8c87acda5fdf50307c@rozman.si>
From: Manikandan Thiagarajan <tmani@prosimo.io>
Date: Tue, 26 Jan 2021 13:55:34 -0800
Message-ID: <CAJV1VRCYtSHBJTsGQnL1y60vQGdSRcfptpf6bu4GWgHoiD-dnw@mail.gmail.com>
Subject: Re: Windows Tunnl.dll fails to start as a service.
To: Simon Rozman <simon@rozman.si>
Cc: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
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

Thanks Simon,
I tested the updated tunnel.dll (0.3.4) and latest wintun (0.10) It
fixed startup issues.
The error 2 wasn=E2=80=99t because of the service path. It could be a call =
to
exit(2) from the tunnel.dll that was interpreted as
ERROR_FILE_NOT_FOUND by the event log. My main() function doesn=E2=80=99t
return 2 it always returns 0.

Thanks,
Mani

On Mon, Jan 25, 2021 at 12:10 AM Simon Rozman <simon@rozman.si> wrote:
>
> Hi,
>
> > Log Name:      System
> > Source:        Service Control Manager
> > Date:          1/21/2021 9:41:25 AM
> > Event ID:      7024
> > Task Category: None
> > Level:         Error
> > Keywords:      Classic
> > User:          N/A
> > Computer:      MANI-WIN10-TEST
> > Description:
> > The ProsimoTunnel_if_cbc2a056dfdc25f7 service terminated with the
> > following service-specific error:
> > The system cannot find the path specified.
>
> "The system cannot find the path specified." <=3D is your service path co=
rrect? Double check it. Mind the path deflection for WoW64 processes. SCM i=
s always native (x64 on x64 Windows, x86 on x86 Windows...). So, the servic=
e path must match the path as a native process would see it.
>
> Or is it just the fact that something returns status 2 which is interpret=
ed as ERROR_FILE_NOT_FOUND by the Event Log?
>
> > 2021-01-21 10:04:20.181831: [TUN] [if_1ea7d00c23a616b1] Creating Wintun
> > interface
> > 2021-01-21 10:04:20.896480: [TUN] [if_1ea7d00c23a616b1] Using
> > Wintun/0.8 (NDIS 6.83)
> > 2021-01-21 10:04:20.909065: [TUN] [if_1ea7d00c23a616b1] Enabling
> > firewall rules
> > 2021-01-21 10:04:22.126556: [TUN] [if_1ea7d00c23a616b1] Starting
> > WireGuard/0.1.1 (Windows 10.0.19041; amd64)
> > 2021-01-21 10:04:22.127580: [TUN] [if_1ea7d00c23a616b1] Watching networ=
k
> > interfaces
> > 2021-01-21 10:04:22.128604: [TUN] [if_1ea7d00c23a616b1] Resolving DNS
> > names
> > 2021-01-21 10:04:22.135234: [TUN] [if_1ea7d00c23a616b1] Creating Wintun
> > interface
> > 2021-01-21 10:04:24.156638: [TUN] [if_1ea7d00c23a616b1] Starting
> > WireGuard/0.1.1 (Windows 10.0.19041; amd64)
> > 2021-01-21 10:04:24.159365: [TUN] [if_1ea7d00c23a616b1] Watching networ=
k
> > interfaces
> > 2021-01-21 10:04:24.159365: [TUN] [if_1ea7d00c23a616b1] Resolving DNS
> > names
> > 2021-01-21 10:04:24.165375: [TUN] [if_1ea7d00c23a616b1] Creating Wintun
> > interface
> > 2021-01-21 10:04:24.616820: [TUN] [if_1ea7d00c23a616b1] Unable to creat=
e
> > Wintun interface: Error registering rings: Error listing NDIS
> > interfaces: no interfaces found
>
> Wintun 0.8 is out of our support. Please, upgrade your wireguard-go and W=
intun to the latest version first and see if the problem persists.
>
> Why is that important? Because, we completely rewrote the wireguard-go <-=
> Wintun communication in v0.0.20201118 and v0.10 respectively. The issue y=
ou are seeing is triggered in a part of the code that is now gone from wire=
guard-go and has been rewritten in the new wintun.dll.
>
> (The new Wintun no longer ships as a driver package you need to install, =
but rather as a self-contained do-it-all DLL. Don't worry, the new wireguar=
d-go knows how to use it. Just add wintun.dll next to it.)
>
> Regards,
> Simon
