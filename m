Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10288C433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 20 Jun 2022 20:52:11 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 28de3369;
	Mon, 20 Jun 2022 20:52:09 +0000 (UTC)
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [2607:f8b0:4864:20::1030])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 9d6f9dd4
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 20 Jun 2022 20:52:08 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id
 h9-20020a17090a648900b001ecb8596e43so2178493pjj.5
 for <wireguard@lists.zx2c4.com>; Mon, 20 Jun 2022 13:52:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=boOSdbnN0FkkdwfwadPSKFNxeBVAsmhP393tlaLkd8A=;
 b=D6GUDp98afvP2P3POK8W7erTczPApSys7QDvDgRn1EkPIMtOcdzFTOUiO0pT/jbeac
 XVnJfSs8vCC0Hletr88/LOR2KSCZTp5ziJ5m2h+G1YUj0mxuk5dQdLolYXkhGufbyMPq
 r/kZ2BTYXOqPtI6xNqr7rsbZ4IAGBlbnHGyyNI6iI5jNmOE5/UAkKzrcQ2GVF9tdCiHa
 aDoBa/DRvKm8uqTyegMRVNgC4EiPbbuReOZww6XGguMbnpQdHNWRtJvPgdWa/P6lAy8U
 WWM22GEh9R3tjulPqq+Ah8j9rOcKoUiABFTP4hNQL/XknNPnkfV2fYBlCpHDV9oUizEW
 roVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=boOSdbnN0FkkdwfwadPSKFNxeBVAsmhP393tlaLkd8A=;
 b=V0hDU4RfeNk+8efkWPiqFPOcMn0TNnvmfDqAhdEn5r2ztB0SK3MJ2YECGb3JuR0mb9
 y7RaeVL84UtuMaDB5+LzUsp6qEb6FJfu1NqCFhImaz9sq4lvBK9vkdH8c3juEkXkroOp
 wzCw6P/iuRs9vU3v8fohXTgdqE6FH7tSlDL9rcXdMltYijBK1U4V5t9B7QRsp/eI0e/0
 B9IJaOrUXuC3SaF+4V23+kyAGVeVZ8e7z+1yRrh6HPFnybowOSNNeHHMlf3fHZPQSPos
 XrTEh8FX5wWcj53wluW3JAULC8AqCQfZ+2Wcz9+LFHutZS+Q46OKCSLIr0F7aT0UVJic
 +0Gw==
X-Gm-Message-State: AJIora/eh1BUbWtp3LY/FXEmGVxDvBVKpOkfCSDIrodMmG03ud9it+lH
 JDS28RP0GM9Z5+rL5GK9JuEJRIE9LRyRtRCOjzwUVcV1IQ/saq8Q
X-Google-Smtp-Source: AGRyM1t5XFGAAJhohmjPP5Sn5faqqgJKxXBONpZ+DTxFOBtZvBQhxDdC/nMJxQJgaRnRDIygiL4+YxagY2npa7qFlWI=
X-Received: by 2002:a17:90b:3149:b0:1e8:505c:9c13 with SMTP id
 ip9-20020a17090b314900b001e8505c9c13mr39839235pjb.111.1655758325880; Mon, 20
 Jun 2022 13:52:05 -0700 (PDT)
MIME-Version: 1.0
From: Alessio Nossa <alessio.nossa+list@gmail.com>
Date: Mon, 20 Jun 2022 22:51:54 +0200
Message-ID: <CAMTfdYoJfHEWXBO2L5L4NrwutgjFo5egqmfQj0dCPz7=Kib80w@mail.gmail.com>
Subject: Bug restarting WireGuard using launchd on macOS
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

Hello,
I am running WireGuard (installed with wireguard-tools, using
HomeBrew) on macOS 12.4, launched using launchd. All works fine until
I try to restart it, always with launchd.
When WireGuard interface is restarted, it looks like it crashes/gets
deactivated immediately: if I run 'wg show' nothing is displayed, but
on the "server" peer I can see that the "Latest handshake" report the
time elapsed since last "com.example.wg.restartWg.plist" execution.
The launchd configurations, that I saved at "/Library/LaunchDaemons/"
are available at
https://gist.github.com/alessionossa/78f69b9451a130240e2057acbd4eb7f8

The log at "/tmp/com.example.wg.restartWg.err" of is
    06/20/22 21:51:18
    [+] Interface for wg1 is utun0
    [#] rm -f /var/run/wireguard/utun0.sock
    [#] rm -f /var/run/wireguard/wg1.name
    --- Restarting... ---
    [#] wireguard-go utun
    [+] Interface for wg1 is utun0
    [#] wg setconf utun0 /dev/fd/63
    [#] ifconfig utun0 inet 10.181.0.5/32 10.181.0.5 alias
    [#] ifconfig utun0 up
    [#] route -q -n add -inet 10.181.0.3/32 -interface utun0
    [#] route -q -n add -inet 10.181.0.254/32 -interface utun0
    [#] route -q -n add -inet 10.181.0.11/32 -interface utun0
    [+] Backgrounding route monitor
    --- Restarted! ---
    06/20/22 21:56:20
    wg-quick: `wg1' is not a WireGuard interface
    --- Restarting... ---
    [#] wireguard-go utun
    [+] Interface for wg1 is utun0
    [#] wg setconf utun0 /dev/fd/63
    [#] ifconfig utun0 inet 10.181.0.5/32 10.181.0.5 alias
    [#] ifconfig utun0 up
    [#] route -q -n add -inet 10.181.0.3/32 -interface utun0
    [#] route -q -n add -inet 10.181.0.254/32 -interface utun0
    [#] route -q -n add -inet 10.181.0.11/32 -interface utun0
    [+] Backgrounding route monitor


If some more Information is needed to debug the issue, I am available.

Best regards,
Alessio Nossa
