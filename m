Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 458B8CA5FFD
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  5 Oct 2026 11:15:53 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 55e1f3d8;
	Mon, 5 Oct 2026 07:00:30 +0000 (UTC)
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 100afb07
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 31 Aug 2026 07:15:42 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-4843e397f74so293039f8f.1
 for <wireguard@lists.zx2c4.com>; Mon, 31 Aug 2026 00:15:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1788160541; x=1788765341; darn=lists.zx2c4.com;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=wBU2zMKkv5pIjZ7xGCkzOqXT/wRPw+L3LWpmGHVFifs=;
 b=Oem4EUxFHlC+z4Bq0oH7KQxsJc22OjiHSETZupDUc/XuP6TzUknzIQeUxtluI7d5+i
 3wkpDzhsCiegPryT5SmNJIEQwr0JfxQdWBuG5ePcLAY3OLzmAR53Pcc/Bk59JUPcCZDC
 bIVH/yP4kFnHmxVHqZAhwcOBq7HWEdFr5bkubSm+0R8uUPg2mvON+oqdTYomRF40+27B
 GLjvMigQhTQAsc5QK0++n60mSB5fM26n6tvmc5AWp6RAUBpeawtJ1H11KM/8mw/pbqvw
 v4J+FCVQuC+TOtPXK3GiQqP2Ee83CzSLDWfmG+ooDEpsnJAA9cOKm7TnrDdPrlsZo0jv
 SDZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788160541; x=1788765341;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=wBU2zMKkv5pIjZ7xGCkzOqXT/wRPw+L3LWpmGHVFifs=;
 b=lFUlzneSIscN5ygu1K1EijJhmNFdNJ+aZ/ga8Dua09yjTxuqxJELAOSUSz4us/zHuM
 qUaNSRB6wQzcUxmPj/atszTWhA93zSXW6NA8wGMu+QJU+Lh4k4xc/wqgrqXkt6rHgfII
 RMz4BO/m343mcSiLORT3rMIh86+jpVtu0aQf9ZGl9CW5/ggB5a0hJLaX5+rg/NhBjT7W
 bANct6jy++VgQgQ7c9vq2Rw+s4S6ipZwYD6LUpdHhiCj51rLafShjWmRV2srin8zE+J3
 ve4JsnTOsZS9XwvtW1UTqSMTBxgUM4KmZGi22OBSb+/+eCr37dU3B9HX1dapQ8zY63rr
 M2zg==
X-Gm-Message-State: AFuF++nRNeL5rJgdyNn9ixHOLsAkXfkLAy0q/uANvS9Mlvtyh0bFJLg0
 UtrspfSB6Ymh9MCo92QTfRstMQdsJwb5tehS+wb6eFp36sLBiZLY6sIShC19RQ==
X-Gm-Gg: AYBFou1l6p9iYsyfEcQMDK3oW35eJJl9PLTKOMRdUqMRUZhF3uWeku0VZL1XpdTERzk
 kN00C/YGqxcRU0XnPQQiCw65QF94dQI4W6ZGkU+SivlyVul0dknenm4ntrx280+5U0YJXnq/Gb4
 qvcoK5Z2IlPkYSjCEbHyqULHUJFw0kcGgwk7LtLtqPKSNd0VTx0WJpa72udtbndz0B6COQDOY1r
 pYo1HXjgsgxk7UGn3Qo6jd3WE+JRxHQmFXRFPjW2t6FAhVdvm/CGAfmWcXOGR877w0AlaoRFURt
 0Q7z+awp0xMmrHkG124Ds6AeyFWyTFbumxhOtUHpe7TQRkcH4ZHctWIhmd/B22gclefaPQ0rzRl
 0yPRTTnSM0YxtPk0L3Gfssxkpqyv8fQJcMnMUfIGSzAudFWpEtXygIczqhxwBwb40YgRMhGA7/O
 C4Ar5Ve/TlojEEVJZptD9HMBhPO1N6fMUyS4PqdSHvvmhcll9Kigzhu6VhggIiu1z4WNGfwAqLu
 uhlWyBam03TlJeWLN4q1qX9
X-Received: by 2002:a05:6000:2185:b0:481:5dea:c014 with SMTP id
 ffacd0b85a97d-484397d0614mr10109380f8f.14.1788160541197; 
 Mon, 31 Aug 2026 00:15:41 -0700 (PDT)
Received: from localhost.localdomain ([79.118.195.86])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482fbab3f3asm21026885f8f.3.2026.08.31.00.15.39
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 31 Aug 2026 00:15:40 -0700 (PDT)
From: Razvan Cremenescu <razvan.cremenescu@gmail.com>
To: "Jason A . Donenfeld" <Jason@zx2c4.com>
Cc: wireguard@lists.zx2c4.com, Razvan Cremenescu <razvan.cremenescu@gmail.com>
Subject: [RESEND PATCH wireguard-apple 00/10] macOS: support multiple
 simultaneous tunnels
Date: Mon, 31 Aug 2026 10:15:27 +0300
Message-ID: <20260831071537.12966-1-razvan.cremenescu@gmail.com>
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

This is a resend. I first sent this series on July 10, and two follow-up
fixes on July 25, but none of the messages made it out of the list's
moderation queue, so they never reached the archive. The patches are
unchanged; the same commits are also on a branch and as a pull request on
the GitHub mirror, if either is easier to pull from:

  https://github.com/cremenescu/wireguard-apple/tree/macos-multiple-tunnels
  https://github.com/WireGuard/wireguard-apple/pull/63

macOS, unlike iOS, can run multiple packet tunnel provider sessions at the
same time, but the app serializes activation on both platforms: activating
one tunnel deactivates the tunnel already in operation. On iOS that mirrors
an OS restriction. On macOS it is purely app policy, and macOS users
routinely need several disjoint split tunnels up at once.

Lifting the policy alone is not enough. When two sessions run in one
extension process, each WireGuardAdapter locates its tunnel device by taking
the first utun control socket in the process, so the second tunnel attaches
to the first tunnel's device and passes no traffic. This looks like the
failure reported on this list in July 2021 ("Running multiple tunnels
simultaneously on macOS"), where two tunnels both reached Connected but only
one passed traffic. Patch 3 fixes the device attachment; patches 4-6 then
lift the single-tunnel policy on macOS while keeping iOS behaviour exactly
as it is today.

The first two patches are independent fixes that the series happens to need:
a build fix for the strict module verifier in current Xcode, and a fix for
an explicit deactivation losing against a pending restart.

Patch 7 adds an opt-in per-tunnel split DNS toggle. With several tunnels up,
tunnels that install their DNS servers as the system-wide resolver fight
over it; the toggle lets a tunnel's DNS servers be used only for that
tunnel's DNS search domains. Existing full-tunnel setups keep their
match-everything DNS by default. A related DNSMatchDomains approach was
posted here in April 2024; this variant keeps the wg-quick config text
untouched and portable, and gates the behaviour on an explicit opt-in.

Patches 8-10 are robustness fixes found while running the result daily: an
alert that came up invisibly behind everything on a menu bar app, a crash
opening the editor for a tunnel whose saved configuration cannot be read,
and endpoints that were never set again after a network change. That last
one is worth a number: a peer that had roamed to an address only reachable
on the previous network went from 2 completed handshakes out of 130
attempts to 83 out of 129.

Tested on macOS 26 with Xcode 26: multiple concurrent tunnels passing
traffic simultaneously on disjoint AllowedIPs, deactivating one tunnel
leaving the others up, and DNS resolution verified with and without DNS=
entries as well as with split DNS enabled. Every patch builds for both macOS
and iOS on its own, so the series stays bisectable.

I would also be glad to help maintain wireguard-apple if that is useful -
the repositories page says you would welcome someone taking it over.

Razvan Cremenescu (10):
  WireGuardKitC: include sys/types.h for BSD type definitions
  TunnelsManager: drop the restart intent when deactivation is requested
  WireGuardKit: attach each adapter to its own utun device
  TunnelsManager: restrict single-tunnel activation policy to iOS
  PacketTunnelProvider: only exit on stop of last tunnel in the process
  macOS: support multiple simultaneous tunnels in the menu bar UI
  Add opt-in split DNS support
  macOS: activate the app before showing a modal alert without a window
  macOS: don't crash opening the editor for an unreadable tunnel
  macOS: reset peer endpoints after a network change

 .../NETunnelProviderProtocol+Extension.swift  |  26 +++
 .../Base.lproj/Localizable.strings            |  12 ++
 .../WireGuardApp/Tunnel/TunnelsManager.swift  |  43 ++++-
 .../TunnelEditTableViewController.swift       |  39 +++-
 .../WireGuardApp/UI/macOS/AppDelegate.swift   |  31 ++-
 .../UI/macOS/ErrorPresenter.swift             |   5 +
 .../UI/macOS/StatusItemController.swift       |  14 +-
 .../WireGuardApp/UI/macOS/StatusMenu.swift    |  25 ++-
 .../UI/macOS/TunnelsTracker.swift             |  31 ++-
 .../TunnelDetailTableViewController.swift     |   7 +
 .../TunnelEditViewController.swift            |  21 ++-
 .../PacketTunnelSettingsGenerator.swift       |  59 +++++-
 Sources/WireGuardKit/WireGuardAdapter.swift   | 176 +++++++++++++++++-
 Sources/WireGuardKitC/WireGuardKitC.h         |   2 +
 .../PacketTunnelProvider.swift                |  52 +++++-
 15 files changed, 485 insertions(+), 58 deletions(-)

-- 
2.50.1 (Apple Git-155)

