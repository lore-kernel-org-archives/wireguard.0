Return-Path: <SRS0=tdjr=OT=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCA01C433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 29 Sep 2021 04:41:48 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EC9E461209
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 29 Sep 2021 04:41:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EC9E461209
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wildgooses.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4aa59fe3;
	Wed, 29 Sep 2021 04:41:46 +0000 (UTC)
Received: from mail1.nippynetworks.com (mail1.nippynetworks.com
 [91.220.24.129])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 1522eaa4
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 28 Sep 2021 14:43:04 +0000 (UTC)
Received: from macbookpro-ed.wildgooses.lan (unknown [212.69.38.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature ECDSA (P-256))
 (No client certificate requested)
 (Authenticated sender: ed@wildgooses.com)
 by mail1.nippynetworks.com (Postfix) with ESMTPSA id 4HJj0k62s8zTgXC
 for <wireguard@lists.zx2c4.com>; Tue, 28 Sep 2021 15:43:02 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wildgooses.com;
 s=dkim; t=1632840182;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=7pSCeVzH1kBkFs/ZkowqdDV8Nng3NiQq/w42KpS9wh0=;
 b=Ug1DNuzGhzY6sa+JKjoK50itGRmEfK7zLuhp2EVj9QPsa7KUc+GzeMuACUsg/RACVZSLob
 LCN8OuCinF3uf2Q2W4+zr0lHKFpT7pLJdYsVuj+e6GmEJmoB/wwOcms8jfZhbUzUCoyUn3
 1DRxZM+2gLjsBmcC06A9Su3kX4ltZeo=
To: wireguard@lists.zx2c4.com
From: Ed W <lists@wildgooses.com>
Subject: Ultra low bandwidth wireguard question
Message-ID: <25dd7f3d-c4c3-32d5-da3e-fb95d85ee3df@wildgooses.com>
Date: Tue, 28 Sep 2021 15:43:02 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-Mailman-Approved-At: Wed, 29 Sep 2021 04:41:44 +0000
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

Hi, I have a satellite ISP where bandwidth costs around the $10-100/MB ra=
nge (that's MB, not GB).
There are also additional costs for each "connection", meaning its more e=
fficient to transmit in
bursts, than a gentle trickle of packets intermittently

An additional limitation of the network is that it takes 5-15 seconds to =
start passing packets once
it's been idle for a while ("a while" is about 25 seconds), and during th=
at time wireguard will
retransmit packets on a 5 sec fixed interval, however, the network queues=
 all these packets and so
after say 15 seconds I might have 4+ rekey packets queued, which result i=
n 4+ responses from the far
end. Such data is quite expensive for this network

The device side is behind a network NAT and my goal is to keep a reverse =
connection in place, ie the
far end of the network can send packets back to the device. So I enable K=
eepalive in the wireguard
config

A conceptual description would be: hub and spoke arrangement of IOT devic=
es on the far end of a
satellite internet link, where we want the hub to be able to keep an open=
 pipe and push commands to
the IOT devices. The NAT UDP timeout on the satellite link firewalls is m=
easured at approx 3 minutes.


So I face 3 challenges:

- keepalive packets are desired to be retransmitted every 3 minutes, but =
the encryption rekey timers
are set closer to 2 minutes. For example setting the keepalive timer to 2=
 minutes leads to sending
148 byte rekey packets for each rekey. However, setting the keepalive tim=
er just short of 2 minutes
leads to a situation of 1 keepalive around the 2 min mark, followed by a =
rekey packet at the second
2 min mark, etc)

- wireguard has a 2 minute ish rekey timeout which causes sending a 148 b=
yte request and triggering
a 92 byte response. However, as the retry interval is every 5 seconds, wh=
ich usually leads to
sending 3-10x 148 byte requests (which are queued and retransmitted one t=
he interface is up) and
leads to an equal number of 92 byte responses


So questions:

- Is it feasible within the design of wireguard to be able to "debounce" =
a stream of rekey packets
that will arrive reasonably consecutively (at about 22kbit/s), particular=
ly it's the replies that I
want to queue and only send the latest? I couldn't see that this was feas=
ible from the code as it
stands today? Suggestions appreciated though?


- Is it possible to adjust these constants

=C2=A0=C2=A0=C2=A0=C2=A0 REKEY_AFTER_TIME =3D 120,
=C2=A0=C2=A0=C2=A0=C2=A0 REJECT_AFTER_TIME =3D 180,

My concern looking at the code is that if I have some unmodified clients =
using the default settings,
then it's not clear to me how they would respond if one side has passed t=
he REJECT_AFTER_TIME
interval and the other has not? (The intended scenario might be a hub spo=
ke of IOT clients on the
satellite network, being accessed by other clients via general internet. =
The IOT clients and hub
server would be modified, but the other clients would be at defaults)

Can anyone comment on the implications of say altering only the client IO=
T devices to have a say
REKEY/REJECT times closer to 30 minutes? (ie server remaining on defaults=
)


- I implemented a very basic backoff on the resend of rekeys which better=
 suits the characteristics
of this network, eg first retry is not until after 15 seconds, then it re=
tries at 10, 15, 20, 25 sec
interval after that. Usually this leads to very few retries for my networ=
k. Code is below, any
comments?


Results:

With these changes and assuming a somewhat unreliable satellite network w=
hich might not have
coverage for some of the time (leading to additional retransmits), I see =
theoretical monthly idle
usage close to 3MB/month. However, being able to increase the REKEY/REJEC=
T times to 30 mins might
drop this by a factor 10x or more. Can it be done?

Thanks

Ed W


Patch:

--- a/src/messages.h=C2=A0=C2=A0=C2=A0 2021-09-06 16:24:47.121985094 +000=
0
+++ b/src/messages.h=C2=A0=C2=A0=C2=A0 2021-09-06 13:54:59.879700016 +000=
0
@@ -40,14 +40,15 @@
=C2=A0enum limits {
=C2=A0=C2=A0=C2=A0=C2=A0 REKEY_AFTER_MESSAGES =3D 1ULL << 60,
=C2=A0=C2=A0=C2=A0=C2=A0 REJECT_AFTER_MESSAGES =3D U64_MAX - COUNTER_WIND=
OW_SIZE - 1,
-=C2=A0=C2=A0=C2=A0 REKEY_TIMEOUT =3D 5,
+=C2=A0=C2=A0=C2=A0 REKEY_TIMEOUT =3D 10,
+=C2=A0=C2=A0=C2=A0 REKEY_BACKOFF =3D 5,
=C2=A0=C2=A0=C2=A0=C2=A0 REKEY_TIMEOUT_JITTER_MAX_JIFFIES =3D HZ / 3,
=C2=A0=C2=A0=C2=A0=C2=A0 REKEY_AFTER_TIME =3D 120,
=C2=A0=C2=A0=C2=A0=C2=A0 REJECT_AFTER_TIME =3D 180,
=C2=A0=C2=A0=C2=A0=C2=A0 INITIATIONS_PER_SECOND =3D 50,
=C2=A0=C2=A0=C2=A0=C2=A0 MAX_PEERS_PER_DEVICE =3D 1U << 20,
=C2=A0=C2=A0=C2=A0=C2=A0 KEEPALIVE_TIMEOUT =3D 10,
-=C2=A0=C2=A0=C2=A0 MAX_TIMER_HANDSHAKES =3D 90 / REKEY_TIMEOUT,
+=C2=A0=C2=A0=C2=A0 MAX_TIMER_HANDSHAKES =3D 5, /* 100 secs */
=C2=A0=C2=A0=C2=A0=C2=A0 MAX_QUEUED_INCOMING_HANDSHAKES =3D 4096, /* TODO=
: replace this with DQL */
=C2=A0=C2=A0=C2=A0=C2=A0 MAX_STAGED_PACKETS =3D 128,
=C2=A0=C2=A0=C2=A0=C2=A0 MAX_QUEUED_PACKETS =3D 1024 /* TODO: replace thi=
s with DQL */
--- a/src/timers.c=C2=A0=C2=A0=C2=A0 2021-09-06 16:24:47.122985106 +0000
+++ b/src/timers.c=C2=A0=C2=A0=C2=A0 2021-09-06 16:27:41.050156437 +0000
@@ -64,7 +64,7 @@
=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 ++peer->timer_handshake_attem=
pts;
=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 pr_debug("%s: Handshake for p=
eer %llu (%pISpfsc) did not complete after %d seconds,
retrying (try %d)\n",
=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0peer=
->device->dev->name, peer->internal_id,
-=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0&peer->en=
dpoint.addr, REKEY_TIMEOUT,
+=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0&peer->en=
dpoint.addr, (REKEY_TIMEOUT + (peer->timer_handshake_attempts * REKEY_BAC=
KOFF)),
=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0peer=
->timer_handshake_attempts + 1);

=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 /* We clear the endpoint addr=
ess src address, in case this is
@@ -182,7 +182,7 @@
=C2=A0void wg_timers_handshake_initiated(struct wg_peer *peer)
=C2=A0{
=C2=A0=C2=A0=C2=A0=C2=A0 mod_peer_timer(peer, &peer->timer_retransmit_han=
dshake,
-=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 jiffies + REKEY_TIMEOUT * HZ +
+=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 jiffies + (REKEY_TIMEOUT + (peer->timer_handshake_attempts * REKEY_BACKO=
FF) + 5) * HZ +
=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 prandom_u32_max(REKEY_TIMEOUT_JITTER_MAX_JIFFIES));
=C2=A0}




