Return-Path: <SRS0=5+V/=5V=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1411DC2BA19
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  5 Apr 2020 21:48:05 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8032020659
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  5 Apr 2020 21:48:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=roch.us header.i=@roch.us header.b="X9nD+sbM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8032020659
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=roch.us
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 42391a98;
	Sun, 5 Apr 2020 21:38:20 +0000 (UTC)
Received: from mail-vs1-xe34.google.com (mail-vs1-xe34.google.com
 [2607:f8b0:4864:20::e34])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id f24c4dcf
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sun, 5 Apr 2020 05:05:48 +0000 (UTC)
Received: by mail-vs1-xe34.google.com with SMTP id s10so7616904vsi.9
 for <wireguard@lists.zx2c4.com>; Sat, 04 Apr 2020 22:14:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=roch.us; s=google;
 h=mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=mJns2Gk0i1HxkpbAXo/UAE0+BjhlvJZOCAOt22yNvS0=;
 b=X9nD+sbMdVyaKRDeCwofe5cWRTsWGsEjrNekZQWy58EPMlmjyeilrfpEbbjtqvXv1h
 fkR+n3j+mpdZX32dI6SWBKlNEfk6PJGO7/iymQiOn54djkrpF9di4SJTknpba8/GmfYc
 w/C2nm6OF6srvt/JehqdLROMC58W23XPvTLQAyVQviQT1YgVrDbeumqX3YwuqjPmecMy
 4wf04JNO2eJRrKrDOObNhjEH9YMVFAq1iWQ622s8Zb7wjvrApwqB92jcZ78676CrIsOM
 iRzwfmknAEWPZBK906QvkUlZDbMMhBVGaalhwGQ3PG0NvS1qqTW/09H+QMNYbZc/pl/k
 fJdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=mJns2Gk0i1HxkpbAXo/UAE0+BjhlvJZOCAOt22yNvS0=;
 b=BHG+rxQkNoCab9kR6SORA49bxCWQLlNRsgtaM9z6mCoVmW8WPE7ywJ1kzLJMsprh0F
 EnMuu3jJytpBymAcEkfILbCB0LgLHndbPa9mOna7F8TtDhTCR361CLFpGx8OMf25191e
 jZTDQwAyq7QNh4/9ziQASPvgFZxFYiFZVLqNuPm5hMkrnXr3SbPlpf2Q6fQQilriFHAY
 EUjADchoODSb8aQhAAdSU9dBZ/5rIqW/iRMIYftVpvoB/kEaNoLWoJz+KkatygleDpel
 ZaCMUn4O8bnmVikfFvPTxwxhFsLUFF1DTakaz6N4OSEFP9RdNXwm6WPpb8Zy/37wds/A
 J0lw==
X-Gm-Message-State: AGi0PuaecKZu/3UH81kghq7Sd1Ld6UYbjVP9ipdF+AJrgmuGnSpQALy6
 1ONDyZPts7d9RXnQU0YuxjLhLW94W274V4NS1Usd/b8hTLA=
X-Google-Smtp-Source: APiQypLpmpPXQSp4Jhmuiil/0NfxcVoQn4dI0WANYM9FVz+W759XQg4dCw1UMwxpWkJRjZHsDCtUlI/33x0LY5P19CI=
X-Received: by 2002:a67:f585:: with SMTP id i5mr11121097vso.36.1586063665356; 
 Sat, 04 Apr 2020 22:14:25 -0700 (PDT)
MIME-Version: 1.0
From: Eric Roch <eric@roch.us>
Date: Sun, 5 Apr 2020 01:14:14 -0400
Message-ID: <CAD2HyqGC+A92rU=7d1CfbpqRpb9biLiEbdVpfovgN=uGkKseGA@mail.gmail.com>
Subject: Re: Usability issue in MacOS
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Sun, 05 Apr 2020 23:38:13 +0200
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

Hi Jason,

On a similar note, I=E2=80=99ve noticed that it isn=E2=80=99t possible to t=
emporarily
disable the interface if an On-Demand rule is active.  Would it be
possible to add something like the behavior of the WiFi toggle in iOS?
That is, the wg interface is activated when connected to wifi, but
disabling it via the menu bar will turn off On-Demand until a new wifi
is connected (akin to moving with the iOS behavior) or =E2=80=9Ctomorrow=E2=
=80=9D
(probably more like 3am or something).

Thanks
Eric
