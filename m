Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DFADCA5FFF
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  5 Oct 2026 09:24:49 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id a3a52a8b;
	Mon, 5 Oct 2026 06:59:51 +0000 (UTC)
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 3d527d18
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 10 Jul 2026 13:22:47 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-4798bea72f9so517634f8f.1
 for <wireguard@lists.zx2c4.com>; Fri, 10 Jul 2026 06:22:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1783689767; x=1784294567; darn=lists.zx2c4.com;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=MPIJhsciSIqDNS4Oiv+KPTQy/5AyXThtoKOaID9/NH0=;
 b=EoeoVky5r+0uaSRZjnx7kjchH0A+v5drSICLBEonInCaEYs66+RJVMvwwr9voH/mBx
 qclgVWiIx80rYZVp0kZA2tb0aLsXnMNSrgzoTVPUNV3LEna61td7iFd70p7SK7wN81FW
 nv1Oc9h3nh9DtFcseuVVreqRBIiFztMiqiHAKBhJ46beIlUsnFoKg0wmJp/aXwyqIn0l
 PRrkU+u1eU7hoKZCH439jnPoFNgRrgIVBbeFvwmwNVvbjMemQX2lyHugKW7XSUxHrGuD
 YAgFe6brNeph4jfV0JFoqdVRjFBW14QNu6RQXgWXJvEfKmXtx8ZJVzi5mjBc+29Tn+i8
 MRaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783689767; x=1784294567;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=MPIJhsciSIqDNS4Oiv+KPTQy/5AyXThtoKOaID9/NH0=;
 b=CWLhH8RLaZFiHSGnsf7v6lQx3R+YOO757MqRKq85wAsboGOcWVKEwfYDKptNqQUAUK
 i0ptFqXMUJ+6GxxZhoDTJUB/JYtn9+28xwQLt3PrYeuncLtkmxxENu2EM6vzLStK68ch
 hqa9Ehct1tUa2Rr8BUHH/QHhRrM357zMvdan+ooqh1yvsVopg+GzUYm7C+shbmTQ/Qbk
 DYmMV0OJYAqn/fobyxz9KENZmIyDijK60f7lcg/76yl9SaK5HOtwjyQGDEcXGPIG5m6d
 XWVN42NUsszCZhFKk7Fog15SVbQjWj49gdSMQJJhVvEhGiO9y/EcgA8ThPXPsZAHU/RA
 4Fiw==
X-Gm-Message-State: AOJu0YybXXOdCnRi/ytV7etqyAdyhFDL/9fn/cxIOVLT376ZwcyfQiPY
 4YjvXN93c+IlAHIBnFQaW80OwZRbiDI+u9Srl2AbAzg3973lUzoA4Fk+5vWWueQ/
X-Gm-Gg: AfdE7cmXu9+HUAIF0vYXPFxnXMFnGBQlB/p96vYbCo/uUWpeaaVKq5fz95ORsIHt4qs
 YSFNyEjwArnewdvpZ4jsZVNiGI8p5b0ev6ZKP08v7SQJLExuzde7TiUqdcFXYALA4GLLLXuu/rD
 tnmKc2zEg6vIz6X92AmvI6xsd3AOmui+fyBWI8V/gvrwr7YK0Is/i6PepW8c6um5mxUw4yo7EH6
 YA7y3LTEdfYhxZcR86BSS/CZ2HKwQbj/ay6sQdES+xBgajhw5V7AuXnxAOJYRe/6yyU3SQ1XLW7
 +hwnBUcUzNY6bJTLBwbJeJWdo/DBNVx5jIhNmcFvr6C3kG0wsP7Vvry+E4Y7TN+rpEe1ZnJTm6U
 b2YkZcHi2UK+RdOCsEE6acvsBeQaK6OwxVBPOVANpWI/pZZsq3Pu5WhQE7Z6mHSDh8I7C/cH8j+
 z1Wg/uBz7ELYOzJFPXHTL9bQqgOK4QFSQp74AF+lQ2GD/U66w2DQ==
X-Received: by 2002:a05:6000:385:b0:470:13e1:9904 with SMTP id
 ffacd0b85a97d-47df07238e7mr13142010f8f.14.1783689766827; 
 Fri, 10 Jul 2026 06:22:46 -0700 (PDT)
Received: from localhost.localdomain ([79.118.195.86])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47aa039bcdasm62653868f8f.21.2026.07.10.06.22.45
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 10 Jul 2026 06:22:46 -0700 (PDT)
From: Razvan Cremenescu <razvan.cremenescu@gmail.com>
To: "Jason A . Donenfeld" <Jason@zx2c4.com>
Cc: wireguard@lists.zx2c4.com, Razvan Cremenescu <razvan.cremenescu@gmail.com>
Subject: [PATCH wireguard-apple 0/7] macOS: support multiple simultaneous
 tunnels
Date: Fri, 10 Jul 2026 16:22:32 +0300
Message-ID: <20260710132242.39814-1-razvan.cremenescu@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 05 Oct 2026 06:59:44 +0000
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

macOS, unlike iOS, is able to run multiple packet tunnel provider
sessions at the same time. The app has so far serialized activation on
both platforms: activating one tunnel deactivates the tunnel already
in operation. On iOS that mirrors an OS restriction, but on macOS it
is purely app policy, and macOS users routinely need several disjoint
split tunnels up at once.

Simply lifting the policy is not enough, though. When two sessions run
in one extension process, each WireGuardAdapter locates its tunnel
device by taking the first utun control socket in the process, so the
second tunnel attaches to the first tunnel's device and passes no
traffic. This looks like the same failure reported on this list back
in July 2021 ("Running multiple tunnels simultaneously on macOS"),
where two tunnels both reached Connected but only one passed traffic.
Patch 3 fixes the device attachment; patches 4-6 then lift the
single-tunnel policy on macOS while keeping iOS behavior exactly as it
is today.

The first two patches are independent fixes that the series happens to
need: a build fix for the strict module verifier in current Xcode, and
a fix for an explicit deactivation losing against a pending restart.

The last patch adds an opt-in per-tunnel split DNS toggle. With
several tunnels up simultaneously, tunnels that install their DNS
servers as the system-wide resolver fight over it; the toggle lets a
tunnel's DNS servers be used only for the tunnel's DNS search domains
(the non-IP entries of the DNS= line). A related DNSMatchDomains
approach was posted to this list in April 2024; this variant keeps the
wg-quick config text untouched and portable and gates the behavior on
an explicit per-tunnel opt-in, so existing full-tunnel setups keep
their leak-free match-everything DNS by default.

Tested on macOS 26 with Xcode 26: multiple concurrent tunnels passing
traffic simultaneously on disjoint AllowedIPs, deactivating one tunnel
leaving the others up, and DNS resolution verified with and without
DNS= entries as well as with split DNS enabled. Every patch in the
series builds for both macOS and iOS.

I'm happy to keep looking after this area of the codebase, and to help
more broadly with wireguard-apple maintenance if that would be useful.

Razvan Cremenescu (7):
  WireGuardKitC: include sys/types.h for BSD type definitions
  TunnelsManager: drop the restart intent when deactivation is requested
  WireGuardKit: attach each adapter to its own utun device
  TunnelsManager: restrict single-tunnel activation policy to iOS
  PacketTunnelProvider: only exit on stop of last tunnel in the process
  macOS: support multiple simultaneous tunnels in the menu bar UI
  Add opt-in split DNS support

 .../NETunnelProviderProtocol+Extension.swift  |  26 ++++
 .../Base.lproj/Localizable.strings            |  11 ++
 .../WireGuardApp/Tunnel/TunnelsManager.swift  |  43 +++++-
 .../TunnelEditTableViewController.swift       |  39 +++++-
 .../WireGuardApp/UI/macOS/AppDelegate.swift   |  31 ++++-
 .../UI/macOS/StatusItemController.swift       |  14 +-
 .../WireGuardApp/UI/macOS/StatusMenu.swift    |  25 +++-
 .../UI/macOS/TunnelsTracker.swift             |  31 +++--
 .../TunnelEditViewController.swift            |  21 ++-
 .../PacketTunnelSettingsGenerator.swift       |  12 +-
 Sources/WireGuardKit/WireGuardAdapter.swift   | 123 ++++++++++++++++--
 Sources/WireGuardKitC/WireGuardKitC.h         |   2 +
 .../PacketTunnelProvider.swift                |  52 +++++++-
 13 files changed, 373 insertions(+), 57 deletions(-)

-- 
2.50.1 (Apple Git-155)

