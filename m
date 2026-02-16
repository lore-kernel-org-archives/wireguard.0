Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 885F9F4BB83
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 24 Feb 2026 20:05:56 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id c9f219d4;
	Tue, 24 Feb 2026 20:05:54 +0000 (UTC)
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com
 [2607:f8b0:4864:20::733])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 9832ee68
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 16 Feb 2026 18:21:06 +0000 (UTC)
Received: by mail-qk1-x733.google.com with SMTP id
 af79cd13be357-8cb3b3e643dso218316085a.2
 for <wireguard@lists.zx2c4.com>; Mon, 16 Feb 2026 10:21:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771266065; cv=none;
 d=google.com; s=arc-20240605;
 b=OFbwNQHb6sjsLPr75zJ/LlYCP4r38Cq/SZhVyDWVnPI5rg7N4E5JIWFtZeuxU43OWH
 23QwC6QtVT0q6EFCmT894fd+TApyvgaiRJAdE3crgail7eztfTREsmb1lhlkKlkT20tW
 r+VkTfFK/ghQBt4NrNYPXdAMoaHOn3hjgkctdEvpF3DMEQG3tTcIjQr/jb4BK4+kHKlY
 uZa+E2fvgyZKmGsrj7Vu+Cs6m174BcwI/qrXf4it6ePDSO2J2irrDSYozgTb7DWx/3mj
 3EqHYm4uANFCIc6lELdIecwcX8YlPxr1TGSlpfF5lK8b3KrejA5qyqSjwFA0z0B/Ik1x
 c2xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=to:subject:message-id:date:from:mime-version:dkim-signature;
 bh=quhigIC0fy0TZuySXDzWekmI4n/9ikOmjjcmm7FiFd8=;
 fh=1CsOgAxkj0tSFTO0bRovl0wQS24+EZdEApJbdc/Xo54=;
 b=cOBBvhuZMBx2GbO4YFUqklxJ5pBwm62uudVYhi6U0Cr2XjW3p0DtKp6pYC/B0n3Thf
 8D9E9Pj3PHY1IOkKU1hFVr4gW7Gsxg7ZMe++xnysvl0LgzI8xazj/Jp8+kr+cz1Re4rI
 AfXHlS8oHvk1wQNoy8fG3mBYzJJKRxwT+0TYKXobo22V82R8uugsv9Lp5rWVh+azwOxG
 xqUifWy7VMEjwD0rJB9UpGpNhklelxDYuWgGg8+XFvqH+cUkt/PE1Fmd95pNdM39Wa4Y
 J++0pdEdbJlfAASYXGjQh5ebxBEn/vVqK46bvVtk2o45EI9hGIISW6g5kwaPFdDKM9eh
 EW/A==; darn=lists.zx2c4.com
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771266065; x=1771870865; darn=lists.zx2c4.com;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=quhigIC0fy0TZuySXDzWekmI4n/9ikOmjjcmm7FiFd8=;
 b=FRL/qmrv9/JLEB/YyoDJFpqgcNRVkIEN4fESApsP/9annv13Gtd/6+rTUxtgnLOzpQ
 mnw0CRLuOM5mzpIoau6nEk2VAkYBVkzWBGm0dny/uTaRh/rjPnevwZLoxihoyY+j98Yh
 pg02skVpqFEUkxRL0QudPlSuPNeSqp7Id2g+MRm8euElRWSAyxfBC0ebXODWVnjSTcWw
 s/dMD8IH9ZwSn8Eki0eGHnWo8S39v9T4cfnWDt0uiEtdntbro0IlFTvbHchEDuRcBU8S
 30i6eIJ0b9gEZggb24uNSkmLy9BejvGM9LgSW/ZeqHA7mXsFC5O2VFRgE7bbbb+XJkKs
 NXXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771266065; x=1771870865;
 h=to:subject:message-id:date:from:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=quhigIC0fy0TZuySXDzWekmI4n/9ikOmjjcmm7FiFd8=;
 b=t4UZYbrzgcu1nLal55kM/OWf6s7oJUBwRPJE6cmNsoMUftw4yvuDWiIlh6M1Qh/xp3
 ChqzaJs8vjp7xEwWDBEoYXI1mZWAPZWujgZ1k9vKtFCL0PuwNS2sAfXud3gvUR5cojz5
 PXB5aJYCPTLN74YO+gh5uoHrPIYdvObQgi39WyXQiux4J9kzfd9vbcfE64oJx2h9UqTK
 MbothRBo51hb7fAvN8IvHBUYlS6De5tl59V2aihPqiLT+xyRfbHxOc46+Jh6stfF0q4i
 FlzSvhJAwVFCT734BzALnOfDQ6+Q4Zmwxar60OWlTmJ4FJFLJAOl6SMb+X6MEHi0rXIg
 PZlg==
X-Gm-Message-State: AOJu0YxMvsYj2CHVAJUHlMJp+LqWSLVPUMdpUccPgBe4FM+ipnd7Bmok
 4LDWYKTAT7HvlE/CHUq2HsKnM84JdoGYbk5LmcXiMXg54p9Iw49t/15XMrvQqdm9C4Pi+1ZYAXO
 m5VhXWalb0G3X6pYEDqa+jZy29gYh+B7e9w==
X-Gm-Gg: AZuq6aK8BYBgKOXy/3dbaRGkcTI9cVhRQpz34DxiuqBg4Jwf3CUkiPn8/jjM0Urn7G8
 n7SLtKLIX8hJd1jxwLCb5oGxZwDEEWOwj2/D/AzvKwM/VDU0DYmmeVxMn9TilY9cz/QARKOAlwj
 VAiS189pmm42LEsN0wE0Bmz1kpwE0UvjGAktItM9R+CjooKMNC9IOJkLiqWbz1VEwrG1f6CGyIt
 7AYkckO7Sl5pIAiUMV5vE8qjQF3wAoqo9O9JG+W77xSRlBARyEeJkJ7TWBubXgGWr+VhZNp3PdJ
 qCY4XA==
X-Received: by 2002:a05:620a:454a:b0:8c6:e224:d55b with SMTP id
 af79cd13be357-8cb424601f0mr1301110885a.41.1771266064815; Mon, 16 Feb 2026
 10:21:04 -0800 (PST)
MIME-Version: 1.0
From: M Rubon <rubonmtz@gmail.com>
Date: Mon, 16 Feb 2026 13:20:27 -0500
X-Gm-Features: AaiRm50PDtM-CZj61PWKuLbc6CfBqo-xYt-2XCw-fmq0aA9EPdeGh-36VlXJbKY
Message-ID: <CAJ24mqDazye5cEu6LzQ_v3VnP-OgTwj=+yMU7tp+_hPChfaNKg@mail.gmail.com>
Subject: Weirdness on timing of HS request packets when keepalive==5
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Tue, 24 Feb 2026 20:05:52 +0000
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

I am looking at the timing interval between HS request packets during
the 90s attempt period.  I see different interval timing depending on
the (basically unrelated) persistent-keepalive value.  I suspect the
timer for persistent-keepalive==5 is interfering with the timer for
"try HS request again".

It is not a massive difference, but it does not match the expected
5+jitter seconds suggested in the documentation, and has interesting
consequences.  In one case, two of my peers were each sending HS
attempts to the other at the same time (almost no randomness), and
those HS requests were crossing in the night and being repeatedly
ignored because the peer had also sent a HS request (tcpdump available
on request).  It took a while before they finally completed a full HS.

I have a useful workaround to avoid issues for my use case, but wanted
to highlight the possibility of keepalive timers at 5s lightly
interfering with the "try HS again" timers.

M.

Environment: OpenWRT v25.12 kernel 6.12  (same issue on kernel 5.4)
Trying to connect to a (non-existent) peer over loopback port 5656
Monitoring:   tcpdump -nnttt -i lo udp port 5656

When keepalive is 13, the interval between HS packets is 5.x seconds
and jitter is decently random
 00:00:05.119975 IP6 ::1.50737 > ::1.5656: UDP, length 148
 00:00:05.759944 IP6 ::1.50737 > ::1.5656: UDP, length 148
 00:00:05.760015 IP6 ::1.50737 > ::1.5656: UDP, length 148
 00:00:05.760014 IP6 ::1.50737 > ::1.5656: UDP, length 148
 00:00:05.120015 IP6 ::1.50737 > ::1.5656: UDP, length 148
 00:00:05.759989 IP6 ::1.50737 > ::1.5656: UDP, length 148
 00:00:05.760028 IP6 ::1.50737 > ::1.5656: UDP, length 148
 00:00:05.760008 IP6 ::1.50737 > ::1.5656: UDP, length 148
 00:00:05.119940 IP6 ::1.50737 > ::1.5656: UDP, length 148
 00:00:05.120033 IP6 ::1.50737 > ::1.5656: UDP, length 148
 00:00:05.039978 IP6 ::1.50737 > ::1.5656: UDP, length 148
 00:00:05.200242 IP6 ::1.50737 > ::1.5656: UDP, length 148
 00:00:05.759820 IP6 ::1.50737 > ::1.5656: UDP, length 148

When keepalive is 5, the interval between HS packets is 5.0x seconds
and jitter is clamped to under 10ms
 00:00:05.039878 IP6 ::1.50737 > ::1.5656: UDP, length 148
 00:00:05.040018 IP6 ::1.50737 > ::1.5656: UDP, length 148
 00:00:05.039979 IP6 ::1.50737 > ::1.5656: UDP, length 148
 00:00:05.040000 IP6 ::1.50737 > ::1.5656: UDP, length 148
 00:00:05.040104 IP6 ::1.50737 > ::1.5656: UDP, length 148
 00:00:05.039900 IP6 ::1.50737 > ::1.5656: UDP, length 148
 00:00:05.040112 IP6 ::1.50737 > ::1.5656: UDP, length 148
 00:00:05.039838 IP6 ::1.50737 > ::1.5656: UDP, length 148
