Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D891EE49A0
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 23 Aug 2023 16:19:59 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 76baf149;
	Wed, 23 Aug 2023 16:07:20 +0000 (UTC)
Received: from mail-oo1-xc43.google.com (mail-oo1-xc43.google.com
 [2607:f8b0:4864:20::c43])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 51086be9
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 22 Aug 2023 17:26:49 +0000 (UTC)
Received: by mail-oo1-xc43.google.com with SMTP id
 006d021491bc7-570f6c17c55so535022eaf.2
 for <wireguard@lists.zx2c4.com>; Tue, 22 Aug 2023 10:26:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692725207; x=1693330007;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=Azhla3fUQ6wegUjaqIDqRQ0WEsUSd9m69dDH0cGluG0=;
 b=RbaK9vKvIVBkvvEWyV1lCdFciDbJdGJkDO0xHCUQ4ciI103lAKjyO4wY6FVoMe8yIm
 2t1QSkSU0YD6yo5xtU/dj40MsemQkvgYx8teiF1d6PDuBZjXjwV0tGMhVInTeP2bUrNV
 bmH3qa5j6Xr6SmhbkDMQT8mUQ2Jc/C5WkaySxA7eQTEoBXD2KUqM+yv5uggp8t3bOaHf
 Ep/SZKJFJbb0Cr4YYRHRqHS+AvTbZRDfWIqds5azZZyg4Zp+4Tt9d+FcTsTwe+SRtNtX
 VpDYxaL1b/wV5jcP0gQpQHwTa6k3nod5lBjBrqdxjp9vYEMlDjEMe+oB6CoUk1KqJCFw
 KG/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692725207; x=1693330007;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Azhla3fUQ6wegUjaqIDqRQ0WEsUSd9m69dDH0cGluG0=;
 b=Pl4OjhkE4wyqggCO6GPSJrH3Xu0mWDh9G/zgGWigvZDxaxUag0Z1G37kaWrXBKNvhJ
 M19DSsdHHYkDedvBdxu18uvfBTAb+m5B5hBLo3cnDOka9vXZtuS5pAWX15EDswwexv2g
 ErYtDYOGTtOM60vCncq6FAprO1Uk0NCLmwG1lMOZ1l4GoOIG5+ENgT4acARLk1NGnHjl
 4uqNvqVUNeS2nBiPIQIzANaxXRj7HlFsRqqnsKEONkgjYcBUkUOmmpDt/rIIduDdrNVb
 ClO6OBx5M+rTj+zFuhPSDoyJv4B+CxUXNAGQr+dheM6/kUJnTkYjJ74Gb8g2xJfw57mo
 ukJw==
X-Gm-Message-State: AOJu0YwkLNzJOE855wCHuTqcnbZT9cyMF/0qBiM/Kv7pqeINdlj0EXp6
 9v0a8xWqeftIqnaP4MiaQfLjifOY280UV2PGulJpZq3cUZzj6Q==
X-Google-Smtp-Source: AGHT+IGUkjS9zBkq9XL23hZd5K8sSAx1Mdiar9+W0+Snm02lE67iw40QGeHjhzMWEBD1CrC2cfLqKQfhiXspWrhG+ec=
X-Received: by 2002:a4a:dfb8:0:b0:566:fd3b:4329 with SMTP id
 k24-20020a4adfb8000000b00566fd3b4329mr8817568ook.7.1692725207511; Tue, 22 Aug
 2023 10:26:47 -0700 (PDT)
MIME-Version: 1.0
From: Kat Liny <billowtongroup@gmail.com>
Date: Wed, 23 Aug 2023 00:26:31 +0700
Message-ID: <CAMFOZ_+iR0J5q5RUKvZ8Gtk3Q3bVcAs=GpB9YWxjCUTs5cN4oQ@mail.gmail.com>
Subject: Disconnection Bug on Win 11 with Intel adapter
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Wed, 23 Aug 2023 16:07:07 +0000
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

There appears to be a bug that causes the network adapter "Intel(R)
Wi-Fi 6E AX211 160MHz" on Windows 11 (with all current updates) to
disconnect and re-connect to the WiFi network a few times AFTER
disconnecting a WireGuard client profile. If the WireGuardTunnel
service can be either set to automatic startup or be started later
after Windows loads.  The WireGuard connection will remain stable and
connected until the WireGuardTunnel service is stopped, that is when
the connection issues begin, the Internet will be lost for about 20
seconds each time, sometimes more, then reconnects (and usually last
5-15 minutes while the adapter disconnects and reconnects to the
normal network). The issue could be lasting longer than that, I did
not have the patience after each test with reboot.

Have tried:
-Disabling windows firewall and windows defender
-Disable/enable the Intel network adapter quickly after disabling the
WireGuard tunnel service.
-Changing many of the adapter settings.

After each test, I rebooted.

It seems only a reboot solves the issue, and the intermittent
disconnection issue will start again after connecting/disconnecting
the WireGuard profile.

If the WireGuardTunnel service is kept to Disabled status and I never
try to connect to a WireGuard client config during the test, then the
disconnection issue does not happen.

In the Event Viewer logs, it shows this a few times, only during the
issue which seems related:
-----
The description for Event ID 7021 from source Netwtw12 cannot be
found. Either the component that raises this event is not installed on
your local computer or the installation is corrupted. You can install
or repair the component on the local computer.
----

Tested using the WireGuard installer wireguard-amd64-0.5.3.msi. There
are no other security/networking products on the machine that could be
conflicting.
