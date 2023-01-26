Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 620B4C54E94
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 26 Jan 2023 08:26:35 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1f9a930f;
	Thu, 26 Jan 2023 08:26:32 +0000 (UTC)
Received: from mail-40138.protonmail.ch (mail-40138.protonmail.ch
 [185.70.40.138])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id e29351b5
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 26 Jan 2023 08:26:31 +0000 (UTC)
Date: Thu, 26 Jan 2023 08:26:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
 s=xt4yssivuzdhpncbhipkrjm2gy.protonmail; t=1674721590; x=1674980790;
 bh=mOpWD6uW7CxDCALJYb/g10TrkGICDW0krKgDJ0WBxPI=;
 h=Date:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=IdFZkNm8bA3sYapX7TzM1IIWmPMEKyOnxSR7am6fTQ7g0lPmQjqB7LxHK76F6Cq9E
 knfnAMxdjmA0KhM1OfHY/4b8WoCHJhFB4eDSB3GDvWSi97upX5H9nzybZaqgb/gg1k
 8gEBnFU5L2l10ewvKzqLdJfi0aW/pHFZB1Po9dKDlsxc76HtcqRP7uwKly4VZbeL7q
 9TC7p/pTbBnRaDW2r4zLECyptaDObAInH64OwjAUaHGxF6L89/M94Qd8Zu1IFBpFsM
 BlpYf1KKPf7CK37GzeNAfnyYwTQJ8z50Cw1VqeeVmS13yAfRDqW6oEXkWW+pTwR3zc
 BDfg+Ek0TVf/w==
From: John <therealgraysky@proton.me>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: WiFi network flaky/WireGuard connections inconsistent
Message-ID: <7Ph5G8bkN3KO0RArmDnOxOCTf6CEm3AZdsdvl2vRAJ_yM37RJkJQ_5ySh2EXEs52Ru8AYYwVMOAmiVtqBb332JzvgLD87cWcmAzzZL8kRA0=@proton.me>
In-Reply-To: <XPAm1gFEqb9E5SRWZ5kVstmzLdjVslaMx81geg5gdfvX6bYmm6S7pg2DeGGZLWks9JjehrYx9Bwbty1YJYQPSFOwuPVmkP0fteQPwRzJ0TY=@proton.me>
References: <XPAm1gFEqb9E5SRWZ5kVstmzLdjVslaMx81geg5gdfvX6bYmm6S7pg2DeGGZLWks9JjehrYx9Bwbty1YJYQPSFOwuPVmkP0fteQPwRzJ0TY=@proton.me>
Feedback-ID: 47473199:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

An update - if I first connect WG while the iPhone is on 5G, and then conne=
ct to the WiFi without stopping WG first, it seems to work as expected.  Te=
sted and confirmed several times.  Will continue monitoring.

- Ondemand activation fails
- Connecting to the WiFi first and manually selecting a profile fails
- Only true with this specific WiFi, ondemand activation works everywhere e=
lse

------- Original Message -------
On Sunday, January 1st, 2023 at 3:11 PM, John <therealgraysky@proton.me> wr=
ote:


> I am experiencing hit-or-miss connectivity through wireguard when connect=
ed to a specific, unsecured, public WiFi from iOS devices. Meaning, I first=
 connect to the public WiFi at which point, wireless works fine, websites l=
oad, etc. but when I subsequently initiate a wireguard connection, most of =
the time, the traffic flows stops due to a connectivity issue. If I fiddle =
with toggling the WG connection off then on several times, it eventually wo=
rks.
>=20
> Through searching, some suggestions about lowering the MTU value to impro=
ve stability are mentioned. I tried lowering the MTU size on the interface =
to 1440 and then again to 1280 but neither made a difference. Wondering if =
more experienced people here have some suggestions.
>=20
> Here is the log from the iOS client when I attempt to connect:
>=20
> 2022-11-05 15:22:59.205912: [NET] App version: 1.0.15 (26)
> 2022-11-05 15:22:59.206042: [NET] Starting tunnel from the OS directly, r=
ather than the app
> 2022-11-05 15:22:59.434059: [NET] DNS64: mapped xxx.xxx.xxx.xxx to itself=
.
> 2022-11-05 15:22:59.435425: [NET] Attaching to interface
> 2022-11-05 15:22:59.436179: [NET] UAPI: Updating private key
> 2022-11-05 15:22:59.436173: [NET] Routine: handshake worker 3 - started
> 2022-11-05 15:22:59.436234: [NET] Routine: decryption worker 2 - started
> 2022-11-05 15:22:59.436244: [NET] Routine: encryption worker 2 - started
> 2022-11-05 15:22:59.436489: [NET] Routine: decryption worker 3 - started
> 2022-11-05 15:22:59.436532: [NET] Routine: encryption worker 3 - started
> 2022-11-05 15:22:59.436605: [NET] Routine: handshake worker 2 - started
> 2022-11-05 15:22:59.436659: [NET] Routine: decryption worker 5 - started
> 2022-11-05 15:22:59.436793: [NET] Routine: encryption worker 1 - started
> 2022-11-05 15:22:59.436856: [NET] Routine: encryption worker 4 - started
> 2022-11-05 15:22:59.436864: [NET] UAPI: Removing all peers
> 2022-11-05 15:22:59.436903: [NET] Routine: decryption worker 1 - started
> 2022-11-05 15:22:59.436924: [NET] Routine: decryption worker 6 - started
> 2022-11-05 15:22:59.436940: [NET] Routine: handshake worker 6 - started
> 2022-11-05 15:22:59.436969: [NET] Routine: TUN reader - started
> 2022-11-05 15:22:59.437424: [NET] Routine: handshake worker 1 - started
> 2022-11-05 15:22:59.437493: [NET] Routine: decryption worker 4 - started
> 2022-11-05 15:22:59.437554: [NET] Routine: encryption worker 5 - started
> 2022-11-05 15:22:59.437553: [NET] peer(fTiT=E2=80=A6qSc) - UAPI: Created
> 2022-11-05 15:22:59.437572: [NET] Routine: handshake worker 4 - started
> 2022-11-05 15:22:59.437610: [NET] Routine: handshake worker 5 - started
> 2022-11-05 15:22:59.437654: [NET] Routine: encryption worker 6 - started
> 2022-11-05 15:22:59.437674: [NET] peer(fTiT=E2=80=A6qSc) - UAPI: Updating=
 preshared key
> 2022-11-05 15:22:59.437755: [NET] Routine: event worker - started
> 2022-11-05 15:22:59.437901: [NET] peer(fTiT=E2=80=A6qSc) - UAPI: Updating=
 endpoint
> 2022-11-05 15:22:59.438089: [NET] peer(fTiT=E2=80=A6qSc) - UAPI: Updating=
 persistent keepalive interval
> 2022-11-05 15:22:59.438175: [NET] peer(fTiT=E2=80=A6qSc) - UAPI: Removing=
 all allowedips
> 2022-11-05 15:22:59.438303: [NET] peer(fTiT=E2=80=A6qSc) - UAPI: Adding a=
llowedip
> 2022-11-05 15:22:59.438818: [NET] UDP bind has been updated
> 2022-11-05 15:22:59.438848: [NET] Routine: receive incoming v4 - started
> 2022-11-05 15:22:59.438881: [NET] Routine: receive incoming v6 - started
> 2022-11-05 15:22:59.438909: [NET] peer(fTiT=E2=80=A6qSc) - Starting
> 2022-11-05 15:22:59.439099: [NET] Interface state was Down, requested Up,=
 now Up
> 2022-11-05 15:22:59.439187: [NET] Device started
> 2022-11-05 15:22:59.439263: [NET] peer(fTiT=E2=80=A6qSc) - Routine: seque=
ntial receiver - started
> 2022-11-05 15:22:59.439307: [NET] peer(fTiT=E2=80=A6qSc) - Routine: seque=
ntial sender - started
> 2022-11-05 15:22:59.439450: [NET] Tunnel interface is utun3
> 2022-11-05 15:22:59.440162: [NET] Network change detected with satisfied =
route and interface order [en0, pdp_ip0]
> 2022-11-05 15:22:59.440584: [NET] DNS64: mapped xxx.xxx.xxx.xxx to itself=
.
> 2022-11-05 15:22:59.440704: [NET] peer(fTiT=E2=80=A6qSc) - UAPI: Updating=
 endpoint
> 2022-11-05 15:22:59.440914: [NET] Routine: receive incoming v4 - stopped
> 2022-11-05 15:22:59.440962: [NET] Routine: receive incoming v6 - stopped
> 2022-11-05 15:22:59.441407: [NET] UDP bind has been updated
> 2022-11-05 15:22:59.441437: [NET] Routine: receive incoming v4 - started
> 2022-11-05 15:22:59.441469: [NET] Routine: receive incoming v6 - started
> 2022-11-05 15:22:59.949393: [NET] Network change detected with satisfied =
route and interface order [en0, utun3, pdp_ip0]
> 2022-11-05 15:22:59.950074: [NET] DNS64: mapped xxx.xxx.xxx.xxx to itself=
.
> 2022-11-05 15:22:59.950390: [NET] peer(fTiT=E2=80=A6qSc) - UAPI: Updating=
 endpoint
> 2022-11-05 15:22:59.950768: [NET] Routine: receive incoming v4 - stopped
> 2022-11-05 15:22:59.950954: [NET] Routine: receive incoming v6 - stopped
> 2022-11-05 15:22:59.951485: [NET] UDP bind has been updated
> 2022-11-05 15:22:59.951505: [NET] Routine: receive incoming v4 - started
> 2022-11-05 15:22:59.951581: [NET] Routine: receive incoming v6 - started
> 2022-11-05 15:22:59.969322: [NET] peer(fTiT=E2=80=A6qSc) - Sending handsh=
ake initiation
> 2022-11-05 15:23:00.063463: [NET] peer(fTiT=E2=80=A6qSc) - Received hands=
hake response
> 2022-11-05 15:23:15.226385: [NET] peer(fTiT=E2=80=A6qSc) - Retrying hands=
hake because we stopped hearing back after 15 seconds
> 2022-11-05 15:23:15.226767: [NET] peer(fTiT=E2=80=A6qSc) - Sending handsh=
ake initiation
> 2022-11-05 15:23:19.863684: [NET] Stopping tunnel
> 2022-11-05 15:23:19.864322: [NET] Device closing
> 2022-11-05 15:23:19.864617: [NET] Routine: TUN reader - stopped
> 2022-11-05 15:23:19.864730: [NET] Routine: event worker - stopped
> 2022-11-05 15:23:19.864842: [NET] Routine: receive incoming v4 - stopped
> 2022-11-05 15:23:19.864939: [NET] Routine: receive incoming v6 - stopped
> 2022-11-05 15:23:19.865193: [NET] peer(fTiT=E2=80=A6qSc) - Stopping
> 2022-11-05 15:23:19.865364: [NET] peer(fTiT=E2=80=A6qSc) - Routine: seque=
ntial sender - stopped
> 2022-11-05 15:23:19.865368: [NET] peer(fTiT=E2=80=A6qSc) - Routine: seque=
ntial receiver - stopped
> 2022-11-05 15:23:19.865511: [NET] Device closed
> 2022-11-05 15:23:19.865507: [NET] Routine: decryption worker 2 - stopped
> 2022-11-05 15:23:19.865557: [NET] Routine: handshake worker 2 - stopped
> 2022-11-05 15:23:19.865603: [NET] Routine: decryption worker 1 - stopped
> 2022-11-05 15:23:19.865622: [NET] Routine: handshake worker 4 - stopped
> 2022-11-05 15:23:19.865627: [NET] Routine: decryption worker 5 - stopped
> 2022-11-05 15:23:19.865678: [NET] Routine: handshake worker 3 - stopped
> 2022-11-05 15:23:19.865686: [NET] Routine: decryption worker 3 - stopped
> 2022-11-05 15:23:19.865748: [NET] Routine: handshake worker 5 - stopped
> 2022-11-05 15:23:19.865807: [NET] Routine: handshake worker 1 - stopped
> 2022-11-05 15:23:19.865803: [NET] Routine: decryption worker 4 - stopped
> 2022-11-05 15:23:19.865814: [NET] Routine: decryption worker 6 - stopped
> 2022-11-05 15:23:19.865826: [NET] Routine: handshake worker 6 - stopped
> 2022-11-05 15:23:19.866057: [NET] Routine: encryption worker 5 - stopped
> 2022-11-05 15:23:19.866072: [NET] Routine: encryption worker 4 - stopped
> 2022-11-05 15:23:19.866079: [NET] Routine: encryption worker 2 - stopped
> 2022-11-05 15:23:19.866107: [NET] Routine: encryption worker 3 - stopped
> 2022-11-05 15:23:19.866135: [NET] Routine: encryption worker 6 - stopped
> 2022-11-05 15:23:19.866141: [NET] Routine: encryption worker 1 - stopped
