Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B949606A31E
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 26 Oct 2026 19:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=NMYR5rAx
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id bd32b9b2;
	Mon, 26 Oct 2026 19:53:44 +0000 (UTC)
Received: from mail-10696.protonmail.ch (mail-10696.protonmail.ch
 [79.135.106.96])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 084c7b1d
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 24 Oct 2026 10:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
 s=protonmail2; t=1792837383; x=1793096583;
 bh=0wLk5ubs7mj1Gj0AZH2PCccM+CST9gJsQQWNiPlqdnY=;
 h=Date:To:From:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
 b=NMYR5rAxlstnWBwhpbaIn0d+BLi2ORSAEgJ/oziX6qbPD8Xn8si4BBWO/IuKXqAKE
 LxZv8m5nk+Dfhg2FkJhViobvwvl3Uoc57gI1vmsc+Fe6uesR7oTqPawyCJep9UHH/l
 fkwh/GAooQAFs9SBWiWnXKzn7/qv37ACCblcnUvHU303uP/mk6W6X0C7igSeKc0j+C
 G6OqYxuS5LAFHvj2uk4NB+QX2WG7/5qSNGjgnztpJzdxhAPpnTZa9iJojUfNbaOPQP
 j4o5tHngaaTt9heZcpnUq5UfIL8QUUQuTNkKo5xt3VhG4EEnkpeLs0KpC01OVuGUu1
 wCLXwZ3Ms8VBw==
Date: Sat, 24 Oct 2026 10:22:57 +0000
To: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
From: John <therealgraysky@proton.me>
Subject: wireguard-apple: iOS 27 battery drain from repeated identical path
 updates
Message-ID: <m3v8cc8VfcjJx0m66FBc_GR2Hm39lKMh9izaDcFNJx436Vyqjy23Ux3hx7couPz9w6U6hA_JJOfnHHKAyksKYvh8qFt490KgqurjBpQ1rYg=@proton.me>
Feedback-ID: 47473199:user:proton
X-Pm-Message-ID: cfa6b93cf5ce7af8ab2f245b4912c5a78d242a61
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Mon, 26 Oct 2026 19:53:36 +0000
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.30rc1
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On iOS 27, WireGuard is using 20%+ of the battery on several iPhones,
several days in a row. The app log shows the network extension
reconfiguring the tunnel every few seconds even though the network
path has not changed.

Environment:
  App: WireGuard 1.0.16 (27), App Store build
  iOS: 27.0.1
  Devices: iPhone 16 and iPhone 16 Pro
  Network: cellular (pdp_ip0), IPv6-only carrier with DNS64

What the log shows (about 41 minutes of tunnel uptime):
  - 163 "Network change detected" events, median 4 seconds apart,
    up to 13 in a single minute
  - 141 of the 163 report the same thing:
    satisfied route and interface order [pdp_ip0, pdp_ip0, utun3]
  - every event re-resolves the endpoint, pushes it via UAPI, rebinds
    the UDP socket and sends a keepalive: 161 keepalives sent, 24
    received
  - 29 handshake initiations and 16 retries ("stopped hearing back
    after 15 seconds" / "did not complete after 5 seconds"), likely
    from the constant rebinding

Excerpt (redacted):

  17:02:28.797620: [NET] Network change detected with satisfied route and i=
nterface order [pdp_ip0, pdp_ip0, utun3]
  17:02:28.798335: [NET] DNS64: mapped <endpoint> to <redacted>
  17:02:28.798554: [NET] peer(<redacted>) - UAPI: Updating endpoint
  17:02:28.805559: [NET] Routine: receive incoming v4 - stopped
  17:02:28.805809: [NET] Routine: receive incoming v6 - stopped
  17:02:28.806046: [NET] UDP bind has been updated
  17:02:28.806125: [NET] peer(<redacted>) - Sending keepalive packet
  17:02:28.806176: [NET] Routine: receive incoming v4 - started
  17:02:28.806220: [NET] Routine: receive incoming v6 - started
  17:02:31.798330: [NET] Network change detected with satisfied route and i=
nterface order [pdp_ip0, pdp_ip0, utun3]
  17:02:31.799681: [NET] DNS64: mapped <endpoint> to <redacted>
  17:02:31.811205: [NET] peer(<redacted>) - UAPI: Updating endpoint
  [...same sequence repeats...]
  17:02:43.133561: [NET] Network change detected with satisfied route and i=
nterface order [pdp_ip0, pdp_ip0, utun3]

Opus 5.5 speculating on cause:
  WireGuardAdapter.didReceivePathUpdate() (Sources/WireGuardKit/
  WireGuardAdapter.swift) runs wgSetConfig(),
  wgDisableSomeRoamingForBrokenMobileSemantics() and wgBumpSockets() on
  every NWPathMonitor callback on iOS. It never checks whether the path
  actually changed. iOS 27 appears to deliver identical path updates
  every few seconds, so each one wakes the cellular radio for a rebind
  and a keepalive.

Opus 5.5 speculating on a fix:
  Remember the last path's status and availableInterfaces and return
  early from didReceivePathUpdate() when they are unchanged. In this
  log that would have skipped 141 of the 163 events.


