Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15C5CF433D8
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 16 Apr 2026 02:18:34 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id a48a0888;
	Thu, 16 Apr 2026 02:18:33 +0000 (UTC)
Received: from mail-dl1-x1231.google.com (mail-dl1-x1231.google.com
 [2607:f8b0:4864:20::1231])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id bd2b7116
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 14 Apr 2026 05:58:01 +0000 (UTC)
Received: by mail-dl1-x1231.google.com with SMTP id
 a92af1059eb24-1274204434bso3019356c88.1
 for <wireguard@lists.zx2c4.com>; Mon, 13 Apr 2026 22:58:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776146279; cv=none;
 d=google.com; s=arc-20240605;
 b=XX86PRp8OPuGFl26XLolvKTrkselWZnRoVXjJn0xO7DY7Pz1DiuGRnHQKYgPuV14JO
 dhOu3kaNmjxQ+PdIj/wCkOH910Y5AUhlVS+splCOtDOi6fcH0WEMKIAdyMUzsGhusq23
 vDiZO4zT45BNIJGUyfKBW19wPWMJaBhW560Jgc44tl8p54mSAMIBpehcWtIooTCLmk8y
 W1fW+vTzi54KiVuZqay8T9ScTput4f4Q8us0S54mvw5DBbgWH78DRKfHqCYlKrbHWj3c
 Dq65B7Kp48+gYO4i7UlBXHiv5r475wBg6lez650IY77aahEXOLAHv6JCmEVFiZvMgqzv
 xvYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=to:subject:message-id:date:from:mime-version:dkim-signature;
 bh=0kNJLdzXxqIfDSgWv20QLG41M7Gh7KkNrOANrnlTf+0=;
 fh=1CsOgAxkj0tSFTO0bRovl0wQS24+EZdEApJbdc/Xo54=;
 b=QyJIVHPRAhrHWi4DoYnqfC95Gi3i/c6rml8jPAOGHK71TpMBhp85E+NW967oP/OhpR
 /LGx3WUlZTOW+V80egZnBCqm1owJA6RyffI0xSXOODFJrNmUaapVnqoWzZTfMN/VzWnC
 /8d+D2tsaKsIwQe6fg61MH3RvWD5fMKhUGZF9BgJqStUevzLPc1eJ5+0LUAzDVkmMPuL
 jQ7vTznBBXDpuOerm+8ysjLLp+LBpCF+r2Kdvn2iJUb2FQ0JSdnRWB3ct+aKgT5Xp08u
 64id0pl25gRRALKvPyCkq0xRM9SghWlyCQQ08dwQ0UX5WCsmQisvkiDnu4msoSZRW4K8
 WK9g==; darn=lists.zx2c4.com
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1776146279; x=1776751079; darn=lists.zx2c4.com;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=0kNJLdzXxqIfDSgWv20QLG41M7Gh7KkNrOANrnlTf+0=;
 b=lpyD5mo1vKI8f0j+JzL4+cY9K0tQKOz+Dv9+U/uZJKjBQCcBg44lV+dFWB4j6M16LI
 ClPIugcn5tcq+Z/JKsyR6J1Mn3pdYZkq/1NZMlAd2ohCeMt3pWDP7iFewpWxPACg98eW
 AB+sfmjD/auJ0Ag1RkLT4avIwxw7eWmDAIQk4sB5HMYnk/m1nOzYWiBcrDnWP8BoQQjP
 q8dbMcsKue6H1BdY1XaADuj/jElAg9Q2pkoAHrYr9TqJaWxRSmqV4QP/VpTtuSK+7gP9
 85eHA3gUs7iYQLQedeyIrjbvRilfRlnuOVxF8Ef/XaZmV8sooLai4/Jxn8lEJ0v5JdDO
 /rDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776146279; x=1776751079;
 h=to:subject:message-id:date:from:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0kNJLdzXxqIfDSgWv20QLG41M7Gh7KkNrOANrnlTf+0=;
 b=X/Z5ON+wJdJ4pvpikb8ifBU5QiNZUkITQDwLGlkaBvL6jPC50vKKTlN7iZboasiEMi
 62vqIEAtPDTCL1gGAiGaz2hnySB8q0jrjP9RIpXPjBC36w73vJ9Mj2dMnL9+vYdQpgYV
 SW/kXTkv+E4et+xmjsyEF50hv41NslOZAzCRoQ1lbwBvTaTRKo9QkogbV4+WNRgyorn2
 Px2bDUHO1CX+lPUM4uwliuz0mIBzpuwuMR6zOijXNaW1T7j+2QMyP+GxOO8CT4DDfmm0
 mUNlFB0jnhjh84FESIqBISLvmlekPxEmXFeAKNsdfEy465wF0V5D6oCLt4q0vjyWkMPY
 Cx9g==
X-Gm-Message-State: AOJu0YyC7BnT7niiWL3MY43TvL2CVsYTIYGSyIl1Mirh71LiATZw4+L3
 2x1n+2ptIB/150mwW4SXJV7BuJiT7vrJTgieRK49sEy6g5n0JnzDr2DMu8Fvc0xQWOy2ne31S7E
 FGoPnLqRF492MH/JdtCr2vrG4wEDRZ1c/GGlOq14=
X-Gm-Gg: AeBDies+05DEI+606Mi7lHv0xc4nV/QiAHnutddNHbE7jMgFmDodQ3x3ixamvEMUjkD
 fDINIIHXi190eO2n9UUI4nP2FI2Xlk7F/J2sMxeRTUhLOjNg4rOAPmVNae/fT4sHYRjTjUnkHFS
 JT3zToB91jLJfaKG+iI/AO39AdbEKevl5ParGfIYEglP0N4pWqe7tzCN9eEaio6bzLPzbzaqzi/
 6Wno07MTfIIeqRehUw937gspsTSXfPeYTLPKYvSreiGJoRJaXX0XXZYu935a7xe3k3Wh3W8YtsU
 7YdAhYbA/w==
X-Received: by 2002:a05:7022:6885:b0:12b:ebf6:a3bc with SMTP id
 a92af1059eb24-12c351a0d3amr7644897c88.3.1776146279244; Mon, 13 Apr 2026
 22:57:59 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?B?7Jik7ZWc7JuF?= <oho790114@gmail.com>
Date: Tue, 14 Apr 2026 14:57:27 +0900
X-Gm-Features: AQROBzDFnMeEWeGakcvVL6qt6QGamEmWXzcCEJGo94l18AFxBsKADTJbnPO9pA4
Message-ID: <CABJHARCNMZCez7zi006DwTh8ALGb7XPjc+mO=E=T6JL1HGn+Pw@mail.gmail.com>
Subject: WireGuard Windows 0.6.1 - Existing tunnels disappeared and ZIP import
 not working
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Thu, 16 Apr 2026 02:18:32 +0000
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

Hello,

We are experiencing two critical issues after updating WireGuard on
Windows (version 0.6.1):

1) All existing tunnels disappeared after update
- Previously configured tunnels are no longer visible
- Configurations folder appears empty

2) Cannot import new tunnels (ZIP file)
- ZIP config files are not visible in import dialog
- Even using "*.*" filter, files do not appear
- Files definitely exist in the selected folder

This issue is affecting multiple users.

Please check if this is a known issue or regression.

Thank you.
