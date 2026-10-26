Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE5F5606A31D
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 26 Oct 2026 19:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=fK56IG4I
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 0e727019;
	Mon, 26 Oct 2026 19:53:45 +0000 (UTC)
Received: from mail-4319.protonmail.ch (mail-4319.protonmail.ch [185.70.43.19])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 12e2781e
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 26 Oct 2026 19:53:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
 s=protonmail2; t=1793044382; x=1793303582;
 bh=V6ScThMEXH53GsueJPa91+C+UnCcLCv8cbVQ+zPPJLM=;
 h=Date:To:From:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
 b=fK56IG4IFNJXSu6fwA5OJeXYS7VgRWwVyGkerHTYpTBaE3wNfV9GkWKgzD52Tl0L+
 G8zDZFhf6+2NHViO2uZjExCl91z3WS+pgtyWLjbkFL/u+tI9NKKK13lLCpArZ1muwP
 oepUGNGV0+LehuYtil/qgd8xxtNu1xWZrGVjff2RipVJ5Qy3DWkXhgOxp7y1GQh3c0
 pkkau/t2GbfVvvQBj8SlTnN6mIu0MjTK3FGqFecd2e6pe9jozc+1L47Kk2l3nWjw5j
 htvd8fa+3Ip31JJnEjFzNMvpZtCPe95EFEKcv1BpSojs6NHOcd28SMIs79A7S0HUBl
 dwJ7wgAV4dNRw==
Date: Mon, 26 Oct 2026 19:52:58 +0000
To: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
From: John <therealgraysky@proton.me>
Subject: wireguard-apple: iOS27 battery drain from repeated identical path
 updates
Message-ID: <g4I4oSykoX1A5cTm24atBk1qsyjERPbWJ5vp3c337YUnvT_wwYlepOY6zJS9aS-yaKHb6wYkM6wZ99TNKkYX1dFVq9UOxvhbWdfRtfBpow0=@proton.me>
Feedback-ID: 47473199:user:proton
X-Pm-Message-ID: 5508636e675b1c7cfe3f3cab0a390957900b62ba
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

On iOS 27, WireGuard is using 20%+ of the battery on several iPhones, sever=
al days in a row. The app log shows the network extension reconfiguring the=
 tunnel every few seconds even though the network path has not changed. It =
is an on-demand profile set to work over cellular. When I'm away from home,=
 which is most of the day, off the home Wi-Fi, the VPN is active as it shou=
ld be. The battery level by the end of the workday is draining faster than =
it has been in the past. And auditing it, as I mentioned above, puts wire g=
uard background activity between 15 to 20=20
percent, depending on my usage of the phone, throughout the day.=20


ENVIRONMENT

  App:      WireGuard 1.0.16 (27), App Store build
  iOS:      27.0.1
  Devices:  iPhone 16, iPhone 16 Pro


WHAT THE LOG SHOWS (about 41 minutes of tunnel uptime)

  - 163 "Network change detected" events, median 4 seconds apart,
    up to 13 in a single minute
  - 141 of the 163 report the identical path: satisfied, route and
    interface order [pdp_ip0, pdp_ip0, utun3]
  - Every event re-resolves the endpoint, pushes it via UAPI, rebinds
    the UDP socket and sends a keepalive: 161 keepalives sent,
    24 received
  - 29 handshake initiations and 16 retries ("stopped hearing back
    after 15 seconds" / "did not complete after 5 seconds"), likely caused =
by the constant rebinding


LOG EXCERPT (redacted)

17:02:28.797620: [NET] Network change detected with satisfied route and int=
erface order [pdp_ip0, pdp_ip0, utun3]
17:02:28.798335: [NET] DNS64: mapped <endpoint> to <redacted>
17:02:28.798554: [NET] peer(<redacted>) - UAPI: Updating endpoint
17:02:28.805559: [NET] Routine: receive incoming v4 - stopped
17:02:28.805809: [NET] Routine: receive incoming v6 - stopped
17:02:28.806046: [NET] UDP bind has been updated
17:02:28.806125: [NET] peer(<redacted>) - Sending keepalive packet
17:02:28.806176: [NET] Routine: receive incoming v4 - started
17:02:28.806220: [NET] Routine: receive incoming v6 - started
17:02:31.798330: [NET] Network change detected with satisfied route and int=
erface order [pdp_ip0, pdp_ip0, utun3]
17:02:31.799681: [NET] DNS64: mapped <endpoint> to <redacted>
17:02:31.811205: [NET] peer(<redacted>) - UAPI: Updating endpoint
[...same sequence repeats...]
17:02:43.133561: [NET] Network change detected with satisfied route and int=
erface order [pdp_ip0, pdp_ip0, utun3]


SUSPECTED CAUSE (AI-assisted analysis with Claude Opus 5.5, not verified)

WireGuardAdapter.didReceivePathUpdate() in Sources/WireGuardKit/WireGuardAd=
apter.swift calls wgSetConfig(),
wgDisableSomeRoamingForBrokenMobileSemantics() and wgBumpSockets() on every=
 NWPathMonitor callback on iOS. It never checks whether the path actually c=
hanged. iOS 27 appears to deliver identical path updates
every few seconds, so each one wakes the cellular radio for a rebind and a =
keepalive.


POSSIBLE FIX

Store the last path's status and availableInterfaces, and return early from=
 didReceivePathUpdate() when they are unchanged. In this log, that would ha=
ve skipped 141 of the 163 events.
