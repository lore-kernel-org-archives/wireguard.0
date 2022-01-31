Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D1ECC433FE
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 14 Feb 2022 13:55:10 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id ea979191;
	Mon, 14 Feb 2022 13:55:10 +0000 (UTC)
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [2607:f8b0:4864:20::52b])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id cde135a1
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 31 Jan 2022 07:05:34 +0000 (UTC)
Received: by mail-pg1-x52b.google.com with SMTP id 132so420463pga.5
 for <wireguard@lists.zx2c4.com>; Sun, 30 Jan 2022 23:05:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=Jw9quhHtBtcR+pzf4bIafdXuREC+DWrGVg/htktEG3I=;
 b=ZoFWOvjv/3MCDUU3IxPNkzfYSQCmDiIkrvoxdwRZOW1rv7vjArMtRB1n+XRN+Y5u5u
 Le8M6AFN666ovyNXO7Zzu1cSrJjEQ7AFluO9bIzFDZQ1pqLh4R6kGo+FPKwTn/hSSxWX
 5I2aMRLe3iYUE+QekCfaU+MzQbRJ4WRozsqh9xNI1e/CCyVdDVuEbdG7Vet6/MVJZXTP
 3RCEOLa1DkCriP7wxhpnZrcq7Nx0axbrHbtWgmtdjwvhJJyX8AAoLb3XGktslSRl3vGL
 xBbeRKtYaPM3q9hR4H1ERsqPDlS7Zzu1mzfdWqUYcSfLZZdvbSZPEv/TqjaT2QID1jy/
 +UXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=Jw9quhHtBtcR+pzf4bIafdXuREC+DWrGVg/htktEG3I=;
 b=MxDdlQnSJrwJm4nsSXDcp/PLSvrbx476XawWoRY7vzdv2BR31FdbhaG72kb8nQZlHM
 LXHV/pqlCY9sChwB7mDcG/8DLMegCZV6LxEZGiF2W7ZzZfRD5g20LjmCQrqsacXrtwlz
 WnKSeqSl6HAksDb6uDy5kzvu6aZXdDv0lMNJVzyZkbdD6qha1neZxcWjBhh3bSCHu052
 U7jLw3BkAMmgCh2F9iLP/h4tM8bg1kYypeIb8L0//tp2F9xZ12AcWY3kbPtHf0EbFr+N
 1p5Yo10YFIEf05M7DgWoztsW7A2l37gUrlRRcjAyOeOsrrgzRKYGvcmIygh6QcacoSaK
 Fh2g==
X-Gm-Message-State: AOAM5318vsLtcwbkji0urrKR4DGByIK3r2Kie2CZ3fR3tcbzh7CPZ5qT
 ITnzplZkqjEqlO+lGjjbaljRW2g5N8XkiORnj7h7pZLGZX0=
X-Google-Smtp-Source: ABdhPJzI1ErC7onfc2z4V2cHwNwCM8RPmQGvEfGf5hUAScE9eIEn7cLU4W8J6FXULDDyybiAnKfMYugX2znnFZCBg5Q=
X-Received: by 2002:a63:6a85:: with SMTP id
 f127mr15716852pgc.250.1643612732545; 
 Sun, 30 Jan 2022 23:05:32 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:6a10:e8a9:0:0:0:0 with HTTP; Sun, 30 Jan 2022 23:05:32
 -0800 (PST)
From: Ali Intika <intikaa@gmail.com>
Date: Mon, 31 Jan 2022 08:05:32 +0100
Message-ID: <CACsPCPxuYN3+O-1ytksHX6tkCw5sUurHdnX4v6z-EX5dog0Hwg@mail.gmail.com>
Subject: wg-quick and iptables race condition bug
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Mon, 14 Feb 2022 13:55:05 +0000
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

Hi,

First thanks for this amazing piece of code :)

The bug: iptables rules can not be applied in parallel, thus iptables
have the "-w" option (--wait, maximum wait to acquire xtables lock
before giving up) to circumvent this; the "-w" parameter is not used
in wireguard-tools which lead to a racing condition on some systems.

When using wg-quick on a system that do handle often the iptables
rules, especially if we are using wg-quick for a long manipulation (eg
turn up/down multiple interfaces), the command just fail if an other
iptables manipulation is going on, on the system. replacing "iptables"
with "iptables -w 10" on the Wireguard's script/c app (for android)
will solve the issue.

eg where the issue occur
- server handling iptables rules dynamically
- server/client where iptables is often manipulated

Personally I am mainly having this issue on android where the script
is a binary and not as easily editable as an sh file.

Thanks for your consideration
:)
