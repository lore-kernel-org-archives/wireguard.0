Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A92E10F92FB
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 31 Mar 2026 20:15:11 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id af78e2eb;
	Tue, 31 Mar 2026 20:15:09 +0000 (UTC)
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org
 [2001:67c:2050:0:465::102])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 61db09b0
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 31 Mar 2026 20:15:05 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4flfVZ70Mrz9vVg
 for <wireguard@lists.zx2c4.com>; Tue, 31 Mar 2026 22:15:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aparcar.org; s=MBO0001;
 t=1774988103;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ip+udzEQ6iHlnMvn7ZJCuJ+onh3YlumB2uoETfhd1AI=;
 b=x4sw+ubeN9/KhqFqT7J1LOjLgH8uMZfqkq0+ycSG5d6ZVImce6t5Nyg5QRB8zSQaErzn1n
 VtCicJyYp4Sck2pTi4CvK+s8UFD1TdehSLMGNjREqFWPpe7odAyTMQ6Vij7zNi97+Ja59t
 T5MHQlb3FWrIN49BHPCsP8bDYNQAr9izj9N9PkaWtX2WN6Bfk7QQGmmsack0O82NParHrT
 mcd7mU2t1vFvuRaO5ZpZnpr9DsKwg3tn8NdSW9nRXGpgEPMINhFOPfT5jEFRBducLIy0Ub
 pTg2MafuyEFOHFZYdpWe0LjVwm1KDDnrYp8OrxqSI/dSFRVDlQGjLS00xLmZjA==
From: Paul Spooren <mail@aparcar.org>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0
Subject: Export noise primitives for additional "chain key ratcheting"
Message-Id: <9E8ACE91-126B-41BD-BCE2-8B54DCE78B97@aparcar.org>
Date: Tue, 31 Mar 2026 22:14:51 +0200
To: wireguard@lists.zx2c4.com
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

I=E2=80=99m looking into hardening WireGuard against quantum computers, =
specifically how to extend the Noise-based handshake.=20

A bit of background, while PSK injection with external daemons for =
forward secrecy, exists, that=E2=80=99s extra software running, exposing =
extra ports etc. Modifying a Rust/Go implementation is easier than the =
Kernel, but my background is running things on WiFi routers, so Kernel =
is preferred. That said, I=E2=80=99d like to extend the current =
WireGuard message format and attach PQC without exceeding the IPv6 MTU =
of 1280 bytes. In literature I don=E2=80=99t find definitive a PQC =
handshake standard, however combining ML-KEM512 for forward secrecy and =
McEliece460896 for static long-term keys does exist in practice[1] and =
fits into WireGuard init and response messages. Alternatively, sntrup653 =
could be used for forward secrecy without PQ authentication, similar to =
Signal's PQXDH[2]. Possibly new primitives/schemes are developed, with =
smaller public keys and ciphertexts.=20

Just today I read an email about ML-KEM and the Kernel; none of these =
cryptographic primitives are (to my knowledge) part of the Linux Kernel, =
making a =E2=80=9Cnew=E2=80=9D protocol version of WireGuard more =
difficult to implement and further out in the future.

I wondered if WireGuard could export some of the noise primitives like =
mix_hash and mix_key to allow =E2=80=9Cone way=E2=80=9D (ratchet) =
modifications of the chaining key and =E2=80=9Cappend only" bytes to the =
outgoing packet (PQ pubkey, ciphertext). After appending bytes, =
WireGuard takes over again and calculates the MAC, proceeding as usual. =
The "ratcheting=E2=80=9D Kernel module would work similar to the =
existing PSK approach, it adds additional data to the chaining key, =
however it can=E2=80=99t downgrade it (except crashing the Kernel). =
Another approach could be to add netlink handling for an active daemon, =
this would at least reduce the open ports and network complexity.=20

Yet another way to have PQ WireGuard could be to produce one's own =
modules like WolfGuard did the recently[3] with AES/FIPS, however I =
thought to ask anyway.

Thanks,
Paul

[1]: https://rosenpass.eu/docs/rosenpass-project/whitepaper/
[2]: https://signal.org/docs/specifications/pqxdh/
[3]: https://github.com/wolfSSL/wolfGuard=
