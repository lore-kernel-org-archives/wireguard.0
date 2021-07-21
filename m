Return-Path: <SRS0=V78u=MZ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0061AC4338F
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  2 Aug 2021 13:22:54 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 42E1761108
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  2 Aug 2021 13:22:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 42E1761108
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 416ae0cc;
	Mon, 2 Aug 2021 13:14:20 +0000 (UTC)
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [2607:f8b0:4864:20::102e])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 934fb2f5
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 21 Jul 2021 21:20:41 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id
 u9-20020a17090a1f09b029017554809f35so1117649pja.5
 for <wireguard@lists.zx2c4.com>; Wed, 21 Jul 2021 14:20:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=N2OmLb0Qg7Tb6Lo/seegmX4RrFIEpdvfnedgKKBRtOE=;
 b=TOPXCR8/CBKvjujOmrHGJ2xWUXjYOkIfNItolBxFsfhEiBxiQt4jOmVes+jfFNEDDt
 G6RtNwDgWwZaq9ix8F/D69p5q9IyKVC+tJ/HDCTsAEEIZ8BpQWA3abSKK51vBZD9udyt
 AJq+empVQa+UYVYlnekPsAnXiHnl3iemAJvbpMVaXpnZMTFZ2ZQdCUKBZ5vt3mR8Axl+
 8n1WM2QNFpMkn+eUsEveNSbCrcAjLCgONGg6oXlL5uG5ceMAfBZXN9zcZQMRzcZE4EhI
 dYXvwVjI20NJ7XKnxk34mBwD6MN0kQjKVnJjP4h9my2gf15KRK1bop+CAekfZDVa/LYc
 KtKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=N2OmLb0Qg7Tb6Lo/seegmX4RrFIEpdvfnedgKKBRtOE=;
 b=rm8FE9tuuO7+CmiGgV0iYQOAQigqkXGfyDEysl6+aSANTbyqdRSjQjVvREjjkpskid
 ohq46q0QYEqiLQyXbHUSnE/DKcIpp4Dm5qA72EEhOKyp3927uE9SdzBRYjAbKJFdzlOh
 cwmGiFI7GWXaxGQkXydPVZevFAWYMbjwQFYdDqJVUAz3T++yMIUT852E9pIhc1zm2pTm
 ASCkiUs9wgDVWF9mfn+Lwnm/CNA+8OyW+HQKkxysdMsIW69ZWIds1vw/DMzYB6quFykv
 pCxoNydwkx1gUzwenbzMciDjYsJk0AsUg3j0fwC6oTLvl+q0HxdIbcDNDjBBm/A2jSSW
 viwA==
X-Gm-Message-State: AOAM533ecTRaSSbpeqWZbv9VmdIVFp2PjijMEIBgUxII20VLbE8fyDXI
 wPtWouLBI4WADsIUpEXniGr9RNCkrsYo8vlbMxDg29TAEEDGQSMr
X-Google-Smtp-Source: ABdhPJz4VvCshVQ7B9qpzgPVcRozirwhyWj+BgUGwdUEbB5eqQKfKAFdsiy0y46lBHKawJG3QdRfFDYmi7zKoju6AC8=
X-Received: by 2002:aa7:8d10:0:b029:303:8d17:7b8d with SMTP id
 j16-20020aa78d100000b02903038d177b8dmr37925475pfe.26.1626902438106; Wed, 21
 Jul 2021 14:20:38 -0700 (PDT)
MIME-Version: 1.0
From: Aelis Sagot <aelis.sagot@gmail.com>
Date: Wed, 21 Jul 2021 22:20:28 +0100
Message-ID: <CAM2QSmYNbXpkz55Ts5WJhGL3+Excy95LqTbu=YS0voScVP1nFQ@mail.gmail.com>
Subject: Windows issue: impossible to add tunnels when install after setting
 program files to folder on other disk via reg value edit
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Mon, 02 Aug 2021 13:14:07 +0000
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

Reproduction:
-Clean windows install
-Be administrator
-2 physical drives
-Change reg value:
HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\ProgramFilesDir
to OtherDriveLetter:/programs
-Install wireguard on windows
-try to add a tunnel
error: "Unable to import configuration: The system cannot move the
file to a different disk drive"

I tried to move the tunnel file directly into
OtherDriveLetter:\programs\WireGuard\Data\Configurations and it is
detected in the GUI
But then I get the error: "open <path to tunnel>. dpapi: The system
cannot find the file specified." when trying to activate that tunnel
