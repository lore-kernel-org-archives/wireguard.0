Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59722C54ED0
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 21 May 2025 09:18:10 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fa75e8af;
	Tue, 20 May 2025 19:50:06 +0000 (UTC)
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com
 [2607:f8b0:4864:20::12d])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 3b13c3c0
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 7 Jan 2025 15:18:12 +0000 (UTC)
Received: by mail-il1-x12d.google.com with SMTP id
 e9e14a558f8ab-3a9cee9d741so109390255ab.3
 for <wireguard@lists.zx2c4.com>; Tue, 07 Jan 2025 07:18:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736263091; x=1736867891; darn=lists.zx2c4.com;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=eqYwY2EvEKyFGXcw9BlfwMfpFXe18rbY0dCZzn/KjfA=;
 b=e/OTWOK8hvPuoyUmrfSu113dktmtjRoEOjUMB/L45PzYxPVvTYu3/SVUUuEDPrXEaV
 kUIg9RFq4jNjdRFnjyC31qwDz33F0IFIFii9kpTnOJB9ccXuTnvH7B+1R+mjsyaGubm7
 zo+3YpTKXcYCCbNDTpoDgB28QXFprcoa9NWcvmek5twYts3FYk09LoR3P4eitG9cWF4y
 Xp6YeU7se0iIvm2zRMBwSjnzRGZfVetYReH8IaP/wdT3bdIjeP5IoRj4OFKCM7wN3M+s
 SnJjRFWoeR26GyOTQGDiqr6VdzG2H7shFdZf/xsbbZNFyCjoNTBFg95dFzOAH/6FyJOJ
 CdSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736263091; x=1736867891;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=eqYwY2EvEKyFGXcw9BlfwMfpFXe18rbY0dCZzn/KjfA=;
 b=YedfHL2Za01kzQs1iKm+hwuIyluvsyC2cPESeEYlM/5vCJDtWvwrvqsXY3utchjuaj
 /uhoNB0wt16Ojb/As3yee+vSDR90eA7W/GbGVLfpbEqo0UNUvlL1E+gQsKQ5W8yvKrNC
 f3lpP33OnLhzuUIHEfbi2hryncNOj21eFBq4wJfh0SEQOpe37fPj+Vj2kxWz34WgsoQZ
 yOHkvvcEKxrCZiqXvVDLj65ZJjwsnExrhRXwI+RR7U1++e0tO3weMVAtv1Rqa21HLAQU
 oYO0rcNBWF+M2xSHvrokP4RgT+nJiiQpsS2F2/GQGFWGe5n1v1eAhDGFpKD25wNUBlcy
 q+fw==
X-Gm-Message-State: AOJu0Yw//2bAQBkzGE8v1fUEiuNvhuGyNWg4A8kFa+PCP0Y3wbWkIstT
 wlyTFm34gEwRUzmG9ELRl3PAXAuTAb6sAAgqCRXO0CSaTU39QQysZgkVRabM9DNmWfS0XthertJ
 B0OxfKQslQrdYdFbp/FGKkcgNeDKBkejU
X-Gm-Gg: ASbGnctxvblHh1W7/vKZ2ZfduL0XXwkKWUSfoeNDwUZA+Cwj1YdwXJ5mdsBhtXpB9My
 qhnzHj/1mPIyM05fNptr5+s1gOpUDY2IFZsWy
X-Google-Smtp-Source: AGHT+IG9fK6M5c5FweCZIeXhWzUH48WGiBi0wRldemFtfaa7pX1AaP2aHMPZ34uRqXmQbgkRaDfJpA7C46twTBtAmZk=
X-Received: by 2002:a05:6e02:174d:b0:3a7:e83c:2d08 with SMTP id
 e9e14a558f8ab-3c2d5a28091mr455234605ab.22.1736263090798; Tue, 07 Jan 2025
 07:18:10 -0800 (PST)
MIME-Version: 1.0
From: Anthony Paul <anthonypaul@gmail.com>
Date: Tue, 7 Jan 2025 11:48:00 -0330
Message-ID: <CAA+FdXqkOP3rxOOdVY6Q28g7eDsmqkwg38PzZ+rKbdG8DZs0KA@mail.gmail.com>
Subject: Crash on Windows ARM64 when Import and potential fix
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Tue, 20 May 2025 19:45:56 +0000
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

There are numerous reports that the import function causes a crash on
Windows Arm64.  (I believe it is actually the file selector that
causes the crash)

https://www.reddit.com/r/WireGuard/comments/kwqnb5/wireguard_client_crashes_when_trying_to_add/

I also experience the same issue.  I pulled the code and built it
locally, and still experience the same issue, crash on import.  I
tried to add exception handling etc, but no matter what I added, the
prg still just crashes hard, no logs...  I tried importing a different
lib with a different file selector, still crashed...

Then I tried upgrading Go to 1.22.10 in the build.bat file (along with
a couple other minor additions for go1.22).  WG now builds and runs
correctly for me (import works), but of course the build is not
signed.

Hopefully this info will allow the devs to make a new release that
works correctly for Window Arn64?

Please let me know if I can provide any further info.

Thanks,
Anthony
