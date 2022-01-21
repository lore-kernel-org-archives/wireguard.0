Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53428C433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 21 Jan 2022 21:03:52 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 8eea1cbb;
	Fri, 21 Jan 2022 21:03:51 +0000 (UTC)
Received: from mail-4323.proton.ch (mail-4323.proton.ch [185.70.43.23])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 383d3ee1
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 21 Jan 2022 21:03:49 +0000 (UTC)
Date: Fri, 21 Jan 2022 21:03:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tpro.tech;
 s=protonmail; t=1642799024;
 bh=To7xrcGhjqXe/cgjcBTiQ3xLjtq9yyL/tYtKL9J1rfk=;
 h=Date:To:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:
 References:From:To:Cc;
 b=lieiCEefoDFqPa5X8vLoMlwMi1zfd6lN3x/0Xl23XzkIfaOJaPmhiKq34cn32jmEj
 rlWEpuk1pJWqZXG1FRtrB0GlXmnGPPG8952He6FtRqvdf8dHCqCTiwFiak4saBv7cC
 7bU9Ur7KMpiKIm0F26v+6AFAdgRdkdQnRQ4alDf0=
To: Simon Rozman <simon@rozman.si>
From: Tony Pros <tony@tpro.tech>
Cc: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
Subject: RE: Wireguard Windows Service Issues
Message-ID: <9-M1j7GQozeUMiB1Qm-kk17KUFZ_tE4h4oF-n0QEGEXh0IYS-sv3PDvecqKRPasw5Kw_60Do1VAMBuWQymyiQ79wnej1AOl8KsvWwVZ3mlE=@tpro.tech>
In-Reply-To: <e48d98ba2ad34d2f86fb34e5c95aebaf@rozman.si>
References: <M95S0K3OLlWrjbBpofGUvTbVG6o7H8pKclgaVy8bSYAIklVksUf0PfyKeTYWPtt9QUBcrGlmQXnKvvndSWIntkZ-_pWfIG9vGbjeyv7H1jQ=@tpro.tech>
 <e48d98ba2ad34d2f86fb34e5c95aebaf@rozman.si>
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
Reply-To: Tony Pros <tony@tpro.tech>
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

I created a test account and ran through quite a few permutations of discon=
necting and reconnecting to various wireless networks, rebooting the laptop=
 and making it go to sleep, and I now have a bit more insight.

The problem still is occurring, the service seems to get torn down never to=
 come back again once the user comes back to the office and connects back i=
nto the main network with ethernet. When the user is on the main network th=
e VPN host address will not get resolved by DNS by design. We do not want t=
he user to be on the VPN when they are already on the internal network. If =
there's a better way to handle the VPN not connecting when the non-admin us=
er is on the internal network I'm open to that too. We use a hostname for V=
PN server resolution because we use both IPv4 and IPv6 for host connectivit=
y.

Below I am pasting the logs that I have performed some scrubbing on:
-----------------------------

2022-01-21 10:54:00.402263: [MGR] Starting WireGuard/0.4.7 (Windows 10.0.19=
043; amd64)
2022-01-21 10:54:00.406469: [MGR] Starting UI process for user =E2=80=98adm=
in@NETBIOS=E2=80=99 for session 1
2022-01-21 10:54:00.599524: [MGR] An update is available
2022-01-21 10:54:04.650335: [MGR] Exited UI process for user 'admin@NETBIOS=
' for session 1 with status 0
2022-01-21 10:54:05.565857: [MGR] Starting WireGuard/0.5.3 (Windows 10.0.19=
043; amd64)
2022-01-21 10:54:05.571428: [MGR] Starting UI process for user =E2=80=98adm=
in@NETBIOS=E2=80=99 for session 1
2022-01-21 10:59:40.136976: [MGR] Exited UI process for user 'admin@NETBIOS=
' for session 1 with status 40010004
2022-01-21 10:59:41.151462: [MGR] Starting UI process for user =E2=80=98adm=
in@NETBIOS=E2=80=99 for session 1
2022-01-21 10:59:41.723899: [MGR] Exited UI process for user 'admin@NETBIOS=
' for session 1 with status 40010004
2022-01-21 10:59:42.732795: [MGR] Starting UI process for user =E2=80=98adm=
in@NETBIOS=E2=80=99 for session 1
2022-01-21 10:59:42.732795: [MGR] Unable to start manager UI process for us=
er 'admin@NETBIOS' for session 1: Session has logged out
2022-01-21 11:00:16.650075: [MGR] Starting at boot WireGuard/0.5.3 (Windows=
 10.0.19043; amd64)
2022-01-21 11:00:37.045737: [MGR] Starting UI process for user =E2=80=98adm=
in@NETBIOS=E2=80=99 for session 1
2022-01-21 11:02:50.557927: [MGR] Exited UI process for user 'admin@NETBIOS=
' for session 1 with status 40010004
2022-01-21 11:02:51.562675: [MGR] Starting UI process for user =E2=80=98adm=
in@NETBIOS=E2=80=99 for session 1
2022-01-21 11:02:51.562675: [MGR] Unable to start manager UI process for us=
er 'admin@NETBIOS' for session 1: Session has logged out
2022-01-21 11:09:17.473420: [MGR] Starting at boot WireGuard/0.5.3 (Windows=
 10.0.19043; amd64)
2022-01-21 11:09:37.003152: [MGR] Starting UI process for user =E2=80=98adm=
in@NETBIOS=E2=80=99 for session 1
2022-01-21 12:58:29.317315: [TUN] [vpn.domain.com] Starting WireGuard/0.5.3=
 (Windows 10.0.19043; amd64)
2022-01-21 12:58:29.317315: [TUN] [vpn.domain.com] Watching network interfa=
ces
2022-01-21 12:58:29.318889: [TUN] [vpn.domain.com] Resolving DNS names
2022-01-21 12:58:29.359083: [TUN] [vpn.domain.com] Creating network adapter
2022-01-21 12:58:29.481814: [TUN] [vpn.domain.com] Installing driver 0.10
2022-01-21 12:58:29.493513: [TUN] [vpn.domain.com] Extracting driver
2022-01-21 12:58:29.500849: [TUN] [vpn.domain.com] Installing driver
2022-01-21 12:58:29.897233: [TUN] [vpn.domain.com] Creating adapter
2022-01-21 12:58:30.290389: [TUN] [vpn.domain.com] Using WireGuardNT/0.10
2022-01-21 12:58:30.290389: [TUN] [vpn.domain.com] Enabling firewall rules
2022-01-21 12:58:30.254228: [TUN] [vpn.domain.com] Interface created
2022-01-21 12:58:30.294639: [TUN] [vpn.domain.com] Dropping privileges
2022-01-21 12:58:30.294639: [TUN] [vpn.domain.com] Setting interface config=
uration
2022-01-21 12:58:30.295150: [TUN] [vpn.domain.com] Peer 1 created
2022-01-21 12:58:30.295683: [TUN] [vpn.domain.com] Monitoring MTU of defaul=
t v4 routes
2022-01-21 12:58:30.295683: [TUN] [vpn.domain.com] Interface up
2022-01-21 12:58:30.302034: [TUN] [vpn.domain.com] Setting device v4 addres=
ses
2022-01-21 12:58:30.303280: [TUN] [vpn.domain.com] Monitoring MTU of defaul=
t v6 routes
2022-01-21 12:58:30.303783: [TUN] [vpn.domain.com] Setting device v6 addres=
ses
2022-01-21 12:58:30.304926: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (x.x.x.x:51820)
2022-01-21 12:58:30.325700: [TUN] [vpn.domain.com] Startup complete
2022-01-21 12:58:30.348690: [TUN] [vpn.domain.com] Receiving handshake resp=
onse from peer 1 (x.x.x.x:51820)
2022-01-21 12:58:30.348690: [TUN] [vpn.domain.com] Keypair 1 created for pe=
er 1
2022-01-21 12:58:53.611873: [MGR] Exited UI process for user 'admin@NETBIOS=
' for session 1 with status 40010004
2022-01-21 12:58:54.619283: [MGR] Starting UI process for user =E2=80=98adm=
in@NETBIOS=E2=80=99 for session 1
2022-01-21 12:58:54.619283: [MGR] Unable to start manager UI process for us=
er 'admin@NETBIOS' for session 1: Session has logged out
2022-01-21 12:59:56.879394: [TUN] [vpn.domain.com] Keypair 1 destroyed for =
peer 1
2022-01-21 13:00:17.467669: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (x.x.x.x:51820)
2022-01-21 13:00:22.528338: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (x.x.x.x:51820)
2022-01-21 13:00:27.557583: [TUN] [vpn.domain.com] Handshake for peer 1 (x.=
x.x.x:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:00:27.557583: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (x.x.x.x:51820)
2022-01-21 13:00:32.606525: [TUN] [vpn.domain.com] Handshake for peer 1 (x.=
x.x.x:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:00:32.606525: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (x.x.x.x:51820)
2022-01-21 13:00:37.664797: [TUN] [vpn.domain.com] Handshake for peer 1 (x.=
x.x.x:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:00:37.664797: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (x.x.x.x:51820)
2022-01-21 13:00:42.669395: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (x.x.x.x:51820)
2022-01-21 13:00:47.804906: [TUN] [vpn.domain.com] Handshake for peer 1 (x.=
x.x.x:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:00:47.804959: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (x.x.x.x:51820)
2022-01-21 13:00:52.810389: [TUN] [vpn.domain.com] Handshake for peer 1 (x.=
x.x.x:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:00:52.810389: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (x.x.x.x:51820)
2022-01-21 13:00:57.863445: [TUN] [vpn.domain.com] Handshake for peer 1 (x.=
x.x.x:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:00:57.863445: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (x.x.x.x:51820)
2022-01-21 13:01:02.938686: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (x.x.x.x:51820)
2022-01-21 13:01:07.955822: [TUN] [vpn.domain.com] Handshake for peer 1 (x.=
x.x.x:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:01:07.955822: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (x.x.x.x:51820)
2022-01-21 13:01:12.965097: [TUN] [vpn.domain.com] Handshake for peer 1 (x.=
x.x.x:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:01:12.965097: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (x.x.x.x:51820)
2022-01-21 13:01:17.972547: [TUN] [vpn.domain.com] Handshake for peer 1 (x.=
x.x.x:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:01:17.972547: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (x.x.x.x:51820)
2022-01-21 13:01:23.089180: [TUN] [vpn.domain.com] Handshake for peer 1 (x.=
x.x.x:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:01:23.089180: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (x.x.x.x:51820)
2022-01-21 13:01:28.202930: [TUN] [vpn.domain.com] Handshake for peer 1 (x.=
x.x.x:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:01:28.202930: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (x.x.x.x:51820)
2022-01-21 13:01:28.230393: [TUN] [vpn.domain.com] Receiving handshake resp=
onse from peer 1 (192.168.99.1:51820)
2022-01-21 13:01:28.230393: [TUN] [vpn.domain.com] Keypair 2 created for pe=
er 1
2022-01-21 13:02:20.268277: [TUN] [vpn.domain.com] Sending keepalive packet=
 to peer 1 (192.168.99.1:51820)
2022-01-21 13:02:52.586509: [TUN] [vpn.domain.com] Retrying handshake with =
peer 1 (192.168.99.1:51820) because we stopped hearing back after 15 second=
s
2022-01-21 13:02:52.586509: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:02:57.727297: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:02:57.727297: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:03:02.800696: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 3)
2022-01-21 13:03:02.800696: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:03:07.645234: [TUN] [vpn.domain.com] Retrying handshake with =
peer 1 (192.168.99.1:51820) because we stopped hearing back after 15 second=
s
2022-01-21 13:03:07.895820: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:03:07.895820: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:03:13.037051: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 3)
2022-01-21 13:03:13.037051: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:03:18.116518: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 4)
2022-01-21 13:03:18.116518: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:03:22.805189: [TUN] [vpn.domain.com] Retrying handshake with =
peer 1 (192.168.99.1:51820) because we stopped hearing back after 15 second=
s
2022-01-21 13:03:23.288869: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:03:23.288869: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:03:28.308937: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 3)
2022-01-21 13:03:28.308937: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:03:33.418431: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:03:33.418431: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:03:37.882321: [TUN] [vpn.domain.com] Retrying handshake with =
peer 1 (192.168.99.1:51820) because we stopped hearing back after 15 second=
s
2022-01-21 13:03:38.445762: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:03:43.519743: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:03:43.519743: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:03:48.581409: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:03:48.581409: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:03:52.981764: [TUN] [vpn.domain.com] Retrying handshake with =
peer 1 (192.168.99.1:51820) because we stopped hearing back after 15 second=
s
2022-01-21 13:03:53.689057: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:03:53.689057: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:03:58.747131: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:03:58.747131: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:04:03.908738: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:04:03.908738: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:04:08.315502: [TUN] [vpn.domain.com] Retrying handshake with =
peer 1 (192.168.99.1:51820) because we stopped hearing back after 15 second=
s
2022-01-21 13:04:08.958709: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:04:08.958709: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:04:14.016788: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:04:19.084504: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:04:19.084504: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:04:23.778633: [TUN] [vpn.domain.com] Retrying handshake with =
peer 1 (192.168.99.1:51820) because we stopped hearing back after 15 second=
s
2022-01-21 13:04:24.127125: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:04:29.218748: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:04:29.218748: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:04:34.231731: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:04:34.231731: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:04:39.075199: [TUN] [vpn.domain.com] Retrying handshake with =
peer 1 (192.168.99.1:51820) because we stopped hearing back after 15 second=
s
2022-01-21 13:04:39.341356: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:04:39.341356: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:04:44.513798: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:04:44.513798: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:04:49.610111: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:04:49.610111: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:04:54.738254: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:04:54.738254: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:04:59.818290: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 3)
2022-01-21 13:04:59.818290: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:05:04.899930: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 4)
2022-01-21 13:05:04.899930: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:05:09.935659: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 5)
2022-01-21 13:05:09.935659: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:05:15.031441: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:05:15.031441: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:05:20.202771: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:05:20.202771: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:05:25.247134: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:05:25.247134: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:05:30.364604: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:05:30.364604: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:05:35.457967: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 3)
2022-01-21 13:05:35.457967: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:05:40.513820: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 4)
2022-01-21 13:05:40.513820: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:05:45.605902: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 5)
2022-01-21 13:05:45.605902: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:05:50.780061: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 6)
2022-01-21 13:05:50.780061: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:05:55.921797: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 7)
2022-01-21 13:05:55.921797: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:06:01.057740: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 8)
2022-01-21 13:06:01.057740: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:06:06.187809: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 9)
2022-01-21 13:06:06.187809: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:06:11.310265: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 10)
2022-01-21 13:06:11.310265: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:06:16.471611: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 11)
2022-01-21 13:06:16.471611: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:06:21.571279: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 12)
2022-01-21 13:06:21.571279: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:06:26.698041: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:06:26.698041: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:06:31.860464: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:06:31.860529: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:06:36.886223: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:06:36.886223: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:06:42.057072: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:06:42.057072: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:06:47.146446: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:06:47.146446: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:06:52.286497: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:06:52.286497: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:06:57.424177: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 3)
2022-01-21 13:06:57.424177: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:07:02.482674: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 4)
2022-01-21 13:07:02.482674: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:07:07.563106: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 5)
2022-01-21 13:07:07.563106: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:07:12.732463: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 6)
2022-01-21 13:07:12.732463: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:07:17.845855: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 7)
2022-01-21 13:07:17.845855: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:07:22.909751: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 8)
2022-01-21 13:07:22.909751: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:07:27.959797: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 9)
2022-01-21 13:07:27.959797: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:07:33.045043: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 10)
2022-01-21 13:07:33.045043: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:07:38.165594: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:07:38.165594: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:07:43.351604: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:07:43.351604: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:07:48.449930: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:07:48.449930: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:07:53.572846: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:07:53.572846: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:07:58.717729: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 3)
2022-01-21 13:07:58.717931: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:08:03.752142: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 4)
2022-01-21 13:08:03.752142: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:08:08.929394: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 5)
2022-01-21 13:08:08.929394: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:08:14.057561: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 6)
2022-01-21 13:08:14.057561: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:08:19.101167: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 7)
2022-01-21 13:08:19.101167: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:08:24.277494: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 8)
2022-01-21 13:08:24.277494: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:08:29.419552: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:08:29.419552: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:08:34.606448: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:08:34.606448: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:08:39.736667: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:08:39.736667: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:08:44.826807: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:08:44.826807: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:08:49.921629: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 3)
2022-01-21 13:08:49.921629: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:08:55.074697: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 4)
2022-01-21 13:08:55.074697: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:09:00.157100: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 5)
2022-01-21 13:09:00.157100: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:09:05.305690: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 6)
2022-01-21 13:09:05.305690: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:09:10.389663: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 7)
2022-01-21 13:09:10.389663: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:09:15.559298: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 8)
2022-01-21 13:09:15.559298: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:09:20.699881: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 9)
2022-01-21 13:09:20.699881: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:09:25.801829: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 10)
2022-01-21 13:09:25.801829: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:09:30.877613: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 11)
2022-01-21 13:09:30.877613: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:09:36.000216: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 12)
2022-01-21 13:09:36.000216: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:09:41.041500: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:09:41.041500: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:09:46.085437: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:09:51.167640: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:09:51.167640: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:09:56.245602: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 3)
2022-01-21 13:09:56.245602: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:10:01.375144: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 4)
2022-01-21 13:10:01.375144: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:10:06.431110: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 5)
2022-01-21 13:10:06.431110: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:10:11.594853: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 6)
2022-01-21 13:10:11.594853: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:10:16.769072: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 7)
2022-01-21 13:10:16.769072: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:10:21.929730: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 8)
2022-01-21 13:10:21.929730: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:10:26.990764: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:10:26.990764: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:10:28.807783: [TUN] [vpn.domain.com] Zeroing out all keys for=
 peer 1 (192.168.99.1:51820), since we haven't received a new one in 540 se=
conds
2022-01-21 13:10:28.807783: [TUN] [vpn.domain.com] Keypair 2 destroyed for =
peer 1
2022-01-21 13:10:32.095515: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:10:32.095515: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:10:37.212543: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:10:42.295710: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:10:42.295710: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:10:47.458538: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:10:47.458538: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:10:52.488316: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:10:52.488316: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:10:57.510976: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:11:02.543018: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:11:07.589466: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:11:12.620940: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:11:17.712428: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:11:22.860392: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:11:27.980474: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:11:27.980474: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:11:32.993213: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:11:38.095573: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:11:38.095573: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:11:43.232322: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:11:48.329984: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:11:48.329984: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:11:53.338681: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:11:53.338681: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:11:58.469384: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:11:58.469384: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:12:03.569297: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:12:03.569297: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:12:08.658482: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:12:13.688722: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:12:18.828337: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:12:23.949678: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:12:23.949678: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:12:29.010264: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:12:29.022034: [TUN] [vpn.domain.com] Receiving handshake resp=
onse from peer 1 (192.168.99.1:51820)
2022-01-21 13:12:29.022034: [TUN] [vpn.domain.com] Keypair 3 created for pe=
er 1
2022-01-21 13:14:24.960352: [TUN] [vpn.domain.com] Retrying handshake with =
peer 1 (192.168.99.1:51820) because we stopped hearing back after 15 second=
s
2022-01-21 13:14:24.960352: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:14:29.978645: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:14:35.015136: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:14:35.015136: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:14:40.088048: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:14:40.088048: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:14:40.209395: [TUN] [vpn.domain.com] Retrying handshake with =
peer 1 (192.168.99.1:51820) because we stopped hearing back after 15 second=
s
2022-01-21 13:14:45.147021: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:14:45.147021: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:14:50.267293: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:14:50.267293: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:14:55.299003: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:14:55.299003: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:14:55.441283: [TUN] [vpn.domain.com] Retrying handshake with =
peer 1 (192.168.99.1:51820) because we stopped hearing back after 15 second=
s
2022-01-21 13:15:00.331353: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:15:05.502915: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:15:05.502915: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:15:10.536441: [TUN] [vpn.domain.com] Retrying handshake with =
peer 1 (192.168.99.1:51820) because we stopped hearing back after 15 second=
s
2022-01-21 13:15:10.536441: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:15:15.624819: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:15:15.624819: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:15:20.749237: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:15:20.749237: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:15:25.726624: [TUN] [vpn.domain.com] Retrying handshake with =
peer 1 (192.168.99.1:51820) because we stopped hearing back after 15 second=
s
2022-01-21 13:15:25.914733: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:15:25.914733: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:15:31.070989: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:15:31.070989: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:15:36.137150: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:15:41.137348: [TUN] [vpn.domain.com] Retrying handshake with =
peer 1 (192.168.99.1:51820) because we stopped hearing back after 15 second=
s
2022-01-21 13:15:41.137348: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:15:46.138115: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:15:51.288239: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:15:51.288239: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:15:56.329555: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:16:01.469712: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:16:01.469712: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:16:06.548366: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:16:06.548366: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:16:11.610310: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:16:11.610310: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:16:16.625925: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:16:16.626664: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:16:21.704576: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:16:21.704576: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:16:26.815817: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:16:26.815817: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:16:31.830904: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:16:36.908518: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:16:41.955274: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:16:41.955274: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:16:47.002104: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:16:47.002104: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:16:52.168232: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:16:52.168232: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:16:57.304093: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:16:57.304093: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:17:02.335226: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:17:07.336829: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:17:12.339140: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:17:17.402083: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:17:22.449558: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:17:22.449558: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:17:27.493306: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:17:32.530377: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:17:32.530377: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:17:37.565357: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:17:42.729784: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:17:42.729784: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:17:47.890695: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:17:47.890695: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:17:52.997983: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:17:52.997983: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:17:58.008853: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:17:58.008853: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:18:03.059009: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:18:03.059009: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:18:08.134002: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:18:08.134002: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:18:13.213556: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:18:18.348460: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:18:18.348460: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:18:23.389702: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:18:23.389702: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:18:28.459212: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:18:28.459212: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:18:33.542736: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:18:33.542736: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:18:38.652018: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:18:38.652018: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:18:43.757606: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:18:43.757606: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:18:48.834638: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:18:53.968969: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:18:53.968969: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:18:59.123832: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:18:59.123832: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:19:04.241876: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:19:04.241876: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:19:09.401883: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:19:09.401883: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:19:14.479444: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:19:14.479444: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:19:19.536844: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:19:19.536844: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:19:24.593756: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:19:24.593756: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:19:29.624439: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:19:29.624439: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:19:34.670758: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:19:34.670758: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:19:39.780541: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:19:39.780541: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:19:44.921032: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:19:44.921032: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:19:50.078200: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:19:50.078200: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:19:55.182301: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:19:55.182301: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:20:00.306729: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:20:00.306729: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:20:05.337398: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:20:10.515088: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:20:10.515088: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:20:15.545749: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:20:15.545749: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:20:20.624360: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:20:20.624360: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:20:25.702797: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:20:30.730139: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:20:30.730139: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:20:35.865340: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:20:35.865340: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:20:40.875342: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:20:40.875342: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:20:45.937371: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:20:45.937371: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:20:51.073144: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:20:51.073144: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:20:56.198085: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:20:56.198085: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:21:01.230524: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:21:01.231273: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:21:06.401452: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:21:06.401452: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:21:11.429281: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:21:16.438693: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:21:21.497838: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:21:21.497838: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:21:26.554965: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:21:26.554965: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:21:29.032701: [TUN] [vpn.domain.com] Zeroing out all keys for=
 peer 1 (192.168.99.1:51820), since we haven't received a new one in 540 se=
conds
2022-01-21 13:21:29.032701: [TUN] [vpn.domain.com] Keypair 3 destroyed for =
peer 1
2022-01-21 13:21:31.634251: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:21:31.634251: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:21:36.648994: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:21:41.744768: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:21:41.744768: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:21:46.820298: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:21:46.820298: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:21:51.978417: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:21:51.978417: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:21:57.092662: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:21:57.092662: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:22:02.244123: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:22:02.244123: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:22:07.304618: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:22:07.304618: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:22:12.450243: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:22:12.450243: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:22:17.585937: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 3)
2022-01-21 13:22:17.585937: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:22:22.700122: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 4)
2022-01-21 13:22:22.700122: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:22:27.829977: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 5)
2022-01-21 13:22:27.829977: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:22:32.914472: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:22:32.914472: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:22:38.031393: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:22:38.031393: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:22:43.087043: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:22:43.087043: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:22:48.259506: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:22:48.259506: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:22:53.283747: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:22:53.284048: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:22:58.287434: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:23:03.302845: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:23:08.333487: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:23:13.422465: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:23:13.422465: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:23:18.517639: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:23:18.517639: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:23:23.544872: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:23:28.666841: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:23:28.666841: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:23:33.721504: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:23:33.721504: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:23:38.722453: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:23:43.849861: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:23:43.849861: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:23:48.917255: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:23:48.917255: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:23:54.033999: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:23:54.033999: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:23:59.076944: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:23:59.076944: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:24:04.139259: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:24:04.139259: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:24:09.232144: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:24:09.232144: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:24:14.289650: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:24:14.289650: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:24:19.343783: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:24:24.431561: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:24:24.431561: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:24:29.500362: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:24:29.500362: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:24:34.595092: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:24:34.595092: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:24:39.740375: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:24:39.740375: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:24:44.841023: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:24:44.841023: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:24:49.860200: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:24:49.860200: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:24:54.916426: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:24:54.916426: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:24:59.999055: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:24:59.999055: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:25:05.024357: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:25:05.024357: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:25:10.130794: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:25:10.130794: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:25:15.256276: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:25:15.256276: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:25:20.306876: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:25:20.306876: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:25:25.360741: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:25:30.456636: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:25:35.550305: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:25:35.550305: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:25:40.717410: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:25:40.717410: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:25:45.811015: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:25:45.811015: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:25:50.841745: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:25:50.841745: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:25:55.892066: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:25:55.892066: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:26:00.948477: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:26:00.948477: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:26:05.985441: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:26:11.078884: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:26:11.078884: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:26:16.122457: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:26:16.122457: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:26:21.137967: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:26:21.137967: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:26:26.200877: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 3)
2022-01-21 13:26:26.200877: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:26:31.278505: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:26:31.278505: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:26:36.341006: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 3)
2022-01-21 13:26:36.341006: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:26:41.496712: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:26:41.496712: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:26:46.574227: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:26:46.574227: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:26:51.589239: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:26:51.589239: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:26:56.619832: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:26:56.619832: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:27:01.760262: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:27:01.760262: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:27:06.927052: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:27:06.927052: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:27:11.941974: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 3)
2022-01-21 13:27:11.941974: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:27:17.020159: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:27:17.020159: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:27:22.082256: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:27:22.082256: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:27:27.222183: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:27:27.222183: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:27:32.252304: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:27:32.252304: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:27:37.285347: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:27:42.378426: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:27:47.406412: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:27:52.453311: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:27:57.548086: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:27:57.548086: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:28:02.641632: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:28:07.698914: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:28:07.698914: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:28:12.729505: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:28:12.729505: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:28:17.760171: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:28:17.760171: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:28:22.793040: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:28:22.793040: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:28:27.808584: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:28:27.808584: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:28:32.834312: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 3)
2022-01-21 13:28:32.834312: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:28:37.937890: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 4)
2022-01-21 13:28:37.937890: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:28:43.094185: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:28:43.094185: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:28:48.187983: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:28:48.187983: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:28:53.296806: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:28:58.312326: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:28:58.312326: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:29:03.484087: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:29:03.484087: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:29:08.494686: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 3)
2022-01-21 13:29:08.494686: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:29:13.569414: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:29:13.569414: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:29:18.704620: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:29:18.704620: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:29:23.829009: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:29:28.891430: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:29:28.891430: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:29:33.948270: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:29:33.948270: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:29:38.994638: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:29:38.994638: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:29:44.025734: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:29:44.025734: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:29:49.181860: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:29:49.181860: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:29:54.223948: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 3)
2022-01-21 13:29:54.223948: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:29:59.271685: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:29:59.271685: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:30:04.289482: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:30:04.289482: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:30:09.395006: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:30:09.395006: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:30:14.550688: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 3)
2022-01-21 13:30:14.550688: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:30:19.706355: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 4)
2022-01-21 13:30:19.706355: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:30:24.817699: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:30:24.817699: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:30:29.848896: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:30:29.848896: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:30:34.890490: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:30:34.890490: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:30:40.030591: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:30:40.030591: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:30:45.136174: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 3)
2022-01-21 13:30:45.136174: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:30:50.260569: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 4)
2022-01-21 13:30:50.260569: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:30:55.275784: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 5)
2022-01-21 13:30:55.275784: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:31:00.302612: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:31:00.302612: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:31:05.333764: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:31:10.438376: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:31:10.438376: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:31:15.500584: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:31:15.500584: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:31:20.558574: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:31:25.573974: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:31:25.573974: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:31:30.631349: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:31:30.631349: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:31:35.709182: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:31:35.709182: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:31:40.755438: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:31:40.755438: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:31:45.833475: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:31:50.895937: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:31:50.895937: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:31:55.957885: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 3)
2022-01-21 13:31:55.957885: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:32:01.024574: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 4)
2022-01-21 13:32:01.024574: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:32:06.175349: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 5)
2022-01-21 13:32:06.175349: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:32:11.341269: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:32:11.341269: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:32:16.418801: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:32:16.418801: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:32:21.558823: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:32:21.558823: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:32:26.683730: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:32:26.683730: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:32:31.746695: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:32:31.746695: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:32:36.793106: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 3)
2022-01-21 13:32:36.793106: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:32:41.886248: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:32:41.886248: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:32:47.026291: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:32:47.026291: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:32:52.041541: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:32:52.041541: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:32:57.119041: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:32:57.119041: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:33:02.212154: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:33:02.212154: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:33:07.285373: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:33:07.285373: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:33:12.409436: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:33:12.409436: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:33:17.531604: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:33:17.531604: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:33:22.544115: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:33:27.586527: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:33:32.725586: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:33:32.725586: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:33:37.765553: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:33:37.765553: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:33:42.832578: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:33:47.848055: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:33:52.969598: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:33:52.969598: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:33:57.996791: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:33:57.996791: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:34:03.015533: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:34:03.015533: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:34:08.135508: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:34:08.135508: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:34:13.161620: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:34:13.161620: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:34:18.192314: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:34:18.192314: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:34:23.223503: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:34:28.333104: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:34:33.348718: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:34:33.348718: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:34:38.453886: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:34:38.453886: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:34:43.578287: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:34:43.578287: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:34:48.593340: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:34:48.593340: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:34:53.634605: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:34:53.634605: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:34:58.724905: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:34:58.724905: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:35:03.849818: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 3)
2022-01-21 13:35:03.849818: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:35:08.907972: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:35:08.907972: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:35:13.954633: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:35:13.954633: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:35:19.059021: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:35:19.059021: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:35:24.214601: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:35:24.214601: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:35:29.339025: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:35:34.494894: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:35:34.494894: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:35:39.521148: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:35:39.521148: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:35:44.631024: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:35:44.631024: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:35:49.693359: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:35:54.833930: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:35:54.833930: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:35:59.911450: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:35:59.911450: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:36:04.976155: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:36:04.976155: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:36:10.083989: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:36:10.083989: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:36:15.203796: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:36:15.203796: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:36:20.307864: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:36:20.307864: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:36:25.401012: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:36:25.401012: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:36:30.413285: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:36:30.413285: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:36:35.545551: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:36:40.639798: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:36:45.657091: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:36:50.730599: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:36:55.743809: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:37:00.784053: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:37:00.784053: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:37:05.810935: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:37:10.946746: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:37:10.946746: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:37:15.962404: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:37:20.995029: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:37:20.995029: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:37:26.010078: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:37:26.010078: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:37:31.040754: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:37:36.055900: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:37:36.055900: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:37:41.149016: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:37:41.149016: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:37:46.227060: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:37:46.227060: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:37:51.273847: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:37:51.273847: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:37:56.336313: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:38:01.414009: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:38:01.414009: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:38:06.523134: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:38:06.523134: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:38:11.626447: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:38:11.626447: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:38:16.663207: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:38:16.663207: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:38:21.837757: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:38:21.837757: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:38:26.854778: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:38:26.854778: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:38:31.995296: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:38:31.995296: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:38:37.037219: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:38:37.037219: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:38:42.074355: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:38:42.074355: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:38:47.114754: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:38:52.259370: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:38:52.259370: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:38:57.290079: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:38:57.290079: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:39:02.445075: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:39:02.445075: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:39:07.449992: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:39:12.452213: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:39:17.469999: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:39:17.469999: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:39:22.594501: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:39:22.594501: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:39:27.766316: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:39:27.766316: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:39:32.859645: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:39:37.900421: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:39:37.900421: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:39:43.035408: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:39:43.035408: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:39:48.050589: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:39:48.050589: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:39:53.066716: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:39:53.066716: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:39:58.160350: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:39:58.160350: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:40:03.228031: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:40:03.228031: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:40:08.271205: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:40:08.271205: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:40:13.337058: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:40:18.352247: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:40:18.352247: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:40:23.524132: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:40:23.524132: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:40:28.664222: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:40:28.664222: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:40:33.835954: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:40:33.835954: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:40:38.882740: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:40:38.882740: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:40:44.022575: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:40:44.022575: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:40:49.173421: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:40:49.173421: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:40:54.329166: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:40:59.341597: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:41:04.454680: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:41:04.454680: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:41:09.499242: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:41:09.499242: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:41:14.505102: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:41:14.505102: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:41:19.546816: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:41:19.546816: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:41:24.684379: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:41:24.684379: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:41:29.793666: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:41:29.793666: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:41:34.886846: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:41:34.886846: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:41:39.964480: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:41:39.964480: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:41:45.104520: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:41:45.104520: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:41:50.260825: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:41:50.260825: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:41:55.292573: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:41:55.292573: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:42:00.308089: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:42:00.308089: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:42:05.380927: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 3)
2022-01-21 13:42:05.380927: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:42:10.460780: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:42:10.460780: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:42:15.508934: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:42:15.508934: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:42:20.518969: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:42:20.518969: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:42:25.549593: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 3)
2022-01-21 13:42:25.549593: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:42:30.595892: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 4)
2022-01-21 13:42:30.595892: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:42:35.715854: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 5)
2022-01-21 13:42:35.715854: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:42:40.810111: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 6)
2022-01-21 13:42:40.810111: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:42:45.887673: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:42:45.887673: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:42:50.965214: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:42:50.965214: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:42:56.120913: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:42:56.120913: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:43:01.292211: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:43:01.292211: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:43:06.320331: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:43:11.453129: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:43:11.453129: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:43:53.153122: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:43:58.249069: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:44:03.333263: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:44:08.377868: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:44:13.439246: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:44:13.439326: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:44:18.483981: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:44:18.483981: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:44:23.500372: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:44:28.649378: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:44:28.649378: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:44:33.661137: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:44:33.661137: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:44:38.731131: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:44:38.731131: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:44:43.800914: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:44:43.800914: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:44:48.815794: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:44:48.815794: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:44:53.903919: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:44:53.903919: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:44:59.003471: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:44:59.003471: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:45:04.120893: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:45:04.120939: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:45:09.263152: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:45:09.263152: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:45:14.331333: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:45:19.376347: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:45:19.376347: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:45:24.477516: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 3)
2022-01-21 13:45:24.477516: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:45:29.623417: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:45:29.623417: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:45:34.654947: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:45:34.654947: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:45:39.698940: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:45:44.830688: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:45:44.830688: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:45:49.958446: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:45:49.958446: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:45:54.983599: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:45:54.983599: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:46:00.048773: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:46:00.048773: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:46:05.102612: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:46:05.102612: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:46:10.144179: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:46:10.144179: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:46:15.160281: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:46:15.160281: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:46:20.257682: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:46:20.257682: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:46:25.411845: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:46:25.411845: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:46:30.572259: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:46:30.572259: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:46:35.644297: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:46:35.644297: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:49:40.378596: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:49:45.417651: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:49:45.417651: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:49:50.447555: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:49:50.447555: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:49:55.535020: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:50:00.546694: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:50:00.546694: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:50:05.572794: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:50:10.580728: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:50:15.584181: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:50:20.708629: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:50:20.708629: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:50:25.750867: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:50:25.750867: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:50:30.778990: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:50:35.803259: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:50:35.803259: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:50:40.838508: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:50:45.931758: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:50:45.931758: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:50:51.051043: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:50:51.051043: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:50:56.134950: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:50:56.134950: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:51:01.188905: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:51:01.188905: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:51:06.271887: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:51:06.271887: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:51:11.331315: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:51:11.331315: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:51:16.335062: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:51:21.439757: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:51:21.439757: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:51:26.581624: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:51:26.581624: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:51:31.674091: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:51:31.674091: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:51:36.687384: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:51:41.838362: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:51:41.838362: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:51:46.878508: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:51:46.878508: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:51:52.023036: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:51:52.023036: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:51:57.063438: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:51:57.063438: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:52:02.160510: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:52:02.160510: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:52:07.221922: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:52:07.221922: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:52:12.308428: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:52:12.308428: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:52:17.441103: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:52:17.441103: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:52:22.525922: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:52:22.525922: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:52:27.622028: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:52:27.622028: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:52:32.726590: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:52:32.726590: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:52:37.739041: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:52:42.827133: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:52:47.828903: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:52:52.968006: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:52:52.968006: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:52:57.998751: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:52:57.998751: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:53:03.052924: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:53:03.052937: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:53:08.135242: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:53:08.135242: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:53:13.312863: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:53:13.312863: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:53:18.337560: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:53:23.339707: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:53:28.398740: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:53:28.398740: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:53:33.421215: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:53:38.572262: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:53:38.572262: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:53:43.644793: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:53:48.823407: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:53:48.823439: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:53:53.918664: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:53:53.918664: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:53:59.059961: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:53:59.059961: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:54:04.127891: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:54:04.127891: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:54:09.170911: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:54:09.170911: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:54:14.340016: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:54:14.340016: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:54:19.382059: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:54:24.402897: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:54:24.402897: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:54:29.429606: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:54:29.429606: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:54:34.469382: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:54:34.469382: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:54:39.513481: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:54:39.513481: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:54:44.525963: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:54:44.525963: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:54:47.473947: [MGR] Starting UI process for user =E2=80=98adm=
in@NETBIOS=E2=80=99 for session 6
2022-01-21 13:54:49.599296: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:54:49.599296: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:54:54.754166: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:54:54.754166: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:54:59.802065: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:54:59.802065: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:55:04.839528: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:55:04.839528: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:55:09.912812: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:55:09.912949: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:55:14.960576: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:55:14.960576: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:55:20.117522: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:55:20.117522: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:55:25.227467: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:55:25.227467: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:55:30.242084: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:55:30.242084: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:55:35.297539: [TUN] [vpn.domain.com] Handshake for peer 1 (19=
2.168.99.1:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:55:35.297539: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (192.168.99.1:51820)
2022-01-21 13:55:38.291070: [TUN] [vpn.domain.com] Shutting down
2022-01-21 13:55:38.292119: [MGR] [vpn.domain.com] Tunnel service tracker f=
inished
2022-01-21 13:55:38.577899: [TUN] [vpn.domain.com] Starting WireGuard/0.5.3=
 (Windows 10.0.19043; amd64)
2022-01-21 13:55:38.577899: [TUN] [vpn.domain.com] Watching network interfa=
ces
2022-01-21 13:55:38.579447: [TUN] [vpn.domain.com] Resolving DNS names
2022-01-21 13:55:38.624843: [TUN] [vpn.domain.com] Creating network adapter
2022-01-21 13:55:38.761194: [TUN] [vpn.domain.com] Using existing driver 0.=
10
2022-01-21 13:55:38.765332: [TUN] [vpn.domain.com] Creating adapter
2022-01-21 13:55:38.973483: [TUN] [vpn.domain.com] Using WireGuardNT/0.10
2022-01-21 13:55:38.973483: [TUN] [vpn.domain.com] Enabling firewall rules
2022-01-21 13:55:38.921855: [TUN] [vpn.domain.com] Interface created
2022-01-21 13:55:38.975021: [TUN] [vpn.domain.com] Dropping privileges
2022-01-21 13:55:38.975021: [TUN] [vpn.domain.com] Setting interface config=
uration
2022-01-21 13:55:38.975533: [TUN] [vpn.domain.com] Peer 1 created
2022-01-21 13:55:38.977610: [TUN] [vpn.domain.com] Monitoring MTU of defaul=
t v4 routes
2022-01-21 13:55:38.976559: [TUN] [vpn.domain.com] Interface up
2022-01-21 13:55:38.977610: [TUN] [vpn.domain.com] Setting device v4 addres=
ses
2022-01-21 13:55:38.977610: [TUN] [vpn.domain.com] Monitoring MTU of defaul=
t v6 routes
2022-01-21 13:55:38.982387: [TUN] [vpn.domain.com] Setting device v6 addres=
ses
2022-01-21 13:55:38.982387: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (x.x.x.x:51820)
2022-01-21 13:55:38.990223: [TUN] [vpn.domain.com] Startup complete
2022-01-21 13:55:39.001868: [MGR] Failed to connect to adapter interface \\=
?\SWD#WireGuard#{CAD5864D-13F2-398B-A075-EB510CB633B3}#{cac88484-7515-4c03-=
82e6-71a87abac361}: The system cannot find the file specified. (Code 0x0000=
0002)
2022-01-21 13:55:39.024763: [TUN] [vpn.domain.com] Receiving handshake resp=
onse from peer 1 (x.x.x.x:51820)
2022-01-21 13:55:39.025269: [TUN] [vpn.domain.com] Keypair 1 created for pe=
er 1
2022-01-21 13:56:11.075383: [MGR] Exited UI process for user 'admin@NETBIOS=
' for session 6 with status 40010004
2022-01-21 13:56:12.080661: [MGR] Starting UI process for user =E2=80=98adm=
in@NETBIOS=E2=80=99 for session 6
2022-01-21 13:56:12.473288: [MGR] Exited UI process for user 'admin@NETBIOS=
' for session 6 with status 40010004
2022-01-21 13:56:13.484727: [MGR] Starting UI process for user =E2=80=98adm=
in@NETBIOS=E2=80=99 for session 6
2022-01-21 13:56:13.484727: [MGR] Unable to start manager UI process for us=
er 'admin@NETBIOS' for session 6: Session has logged out
2022-01-21 13:56:13.962039: [TUN] [vpn.domain.com] Shutting down
2022-01-21 13:56:13.972922: [MGR] [vpn.domain.com] Tunnel service tracker f=
inished
2022-01-21 13:56:42.419777: [MGR] Starting at boot WireGuard/0.5.3 (Windows=
 10.0.19043; amd64)
2022-01-21 13:56:42.424691: [TUN] [vpn.domain.com] Starting at boot WireGua=
rd/0.5.3 (Windows 10.0.19043; amd64)
2022-01-21 13:56:42.426469: [TUN] [vpn.domain.com] SCM locked for 1s by .\N=
T Service Control Manager, marking service as started
2022-01-21 13:56:42.430189: [TUN] [vpn.domain.com] Watching network interfa=
ces
2022-01-21 13:56:42.432208: [TUN] [vpn.domain.com] Resolving DNS names
2022-01-21 13:56:42.535795: [TUN] [vpn.domain.com] Host not found when reso=
lving vpn.xxxx.org, but no Internet connection available, sleeping for 4 se=
conds
2022-01-21 13:56:46.569993: [TUN] [vpn.domain.com] Host not found when reso=
lving vpn.xxxx.org, but no Internet connection available, sleeping for 4 se=
conds
2022-01-21 13:56:50.585189: [TUN] [vpn.domain.com] Host not found when reso=
lving vpn.xxxx.org, but no Internet connection available, sleeping for 4 se=
conds
2022-01-21 13:56:54.604338: [TUN] [vpn.domain.com] Creating network adapter
2022-01-21 13:56:54.747140: [TUN] [vpn.domain.com] Using existing driver 0.=
10
2022-01-21 13:56:54.754287: [TUN] [vpn.domain.com] Creating adapter
2022-01-21 13:56:54.931104: [TUN] [vpn.domain.com] Using WireGuardNT/0.10
2022-01-21 13:56:54.931104: [TUN] [vpn.domain.com] Enabling firewall rules
2022-01-21 13:56:54.883789: [TUN] [vpn.domain.com] Interface created
2022-01-21 13:56:54.934363: [TUN] [vpn.domain.com] Dropping privileges
2022-01-21 13:56:54.934874: [TUN] [vpn.domain.com] Setting interface config=
uration
2022-01-21 13:56:54.935165: [TUN] [vpn.domain.com] Peer 1 created
2022-01-21 13:56:54.935676: [TUN] [vpn.domain.com] Monitoring MTU of defaul=
t v4 routes
2022-01-21 13:56:54.935676: [TUN] [vpn.domain.com] Interface up
2022-01-21 13:56:54.948226: [TUN] [vpn.domain.com] Setting device v4 addres=
ses
2022-01-21 13:56:54.951579: [TUN] [vpn.domain.com] Monitoring MTU of defaul=
t v6 routes
2022-01-21 13:56:54.952082: [TUN] [vpn.domain.com] Setting device v6 addres=
ses
2022-01-21 13:56:54.971047: [TUN] [vpn.domain.com] Startup complete
2022-01-21 13:56:54.972047: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (x.x.x.x:51820)
2022-01-21 13:56:55.023239: [TUN] [vpn.domain.com] Receiving handshake resp=
onse from peer 1 (x.x.x.x:51820)
2022-01-21 13:56:55.023239: [TUN] [vpn.domain.com] Keypair 1 created for pe=
er 1
2022-01-21 13:58:50.423986: [TUN] [vpn.domain.com] Retrying handshake with =
peer 1 (x.x.x.x:51820) because we stopped hearing back after 15 seconds
2022-01-21 13:58:50.423986: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (x.x.x.x:51820)
2022-01-21 13:58:55.455506: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (x.x.x.x:51820)
2022-01-21 13:59:00.480385: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (x.x.x.x:51820)
2022-01-21 13:59:05.490983: [TUN] [vpn.domain.com] Handshake for peer 1 (x.=
x.x.x:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:59:05.490983: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (x.x.x.x:51820)
2022-01-21 13:59:10.504756: [TUN] [vpn.domain.com] Handshake for peer 1 (x.=
x.x.x:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:59:10.504756: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (x.x.x.x:51820)
2022-01-21 13:59:15.604778: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (x.x.x.x:51820)
2022-01-21 13:59:20.634382: [TUN] [vpn.domain.com] Handshake for peer 1 (x.=
x.x.x:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:59:20.634382: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (x.x.x.x:51820)
2022-01-21 13:59:25.707137: [TUN] [vpn.domain.com] Handshake for peer 1 (x.=
x.x.x:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:59:25.707137: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (x.x.x.x:51820)
2022-01-21 13:59:30.855850: [TUN] [vpn.domain.com] Handshake for peer 1 (x.=
x.x.x:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:59:30.855850: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (x.x.x.x:51820)
2022-01-21 13:59:35.949600: [TUN] [vpn.domain.com] Handshake for peer 1 (x.=
x.x.x:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:59:35.949600: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (x.x.x.x:51820)
2022-01-21 13:59:40.990745: [TUN] [vpn.domain.com] Handshake for peer 1 (x.=
x.x.x:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:59:40.990745: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (x.x.x.x:51820)
2022-01-21 13:59:46.077722: [TUN] [vpn.domain.com] Handshake for peer 1 (x.=
x.x.x:51820) did not complete after 5 seconds, retrying (try 2)
2022-01-21 13:59:46.077722: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (x.x.x.x:51820)
2022-01-21 13:59:51.130991: [TUN] [vpn.domain.com] Sending handshake initia=
tion to peer 1 (x.x.x.x:51820)
2022-01-21 13:59:54.666728: [TUN] [vpn.domain.com] Shutting down
2022-01-21 13:59:54.666728: [MGR] [vpn.domain.com] Tunnel service tracker f=
inished
2022-01-21 14:00:25.385109: [MGR] Starting at boot WireGuard/0.5.3 (Windows=
 10.0.19043; amd64)
2022-01-21 14:00:25.385617: [TUN] [vpn.domain.com] Starting at boot WireGua=
rd/0.5.3 (Windows 10.0.19043; amd64)
2022-01-21 14:00:25.392357: [TUN] [vpn.domain.com] SCM locked for 1s by .\N=
T Service Control Manager, marking service as started
2022-01-21 14:00:25.397054: [TUN] [vpn.domain.com] Watching network interfa=
ces
2022-01-21 14:00:25.399865: [TUN] [vpn.domain.com] Resolving DNS names
2022-01-21 14:00:25.640575: [TUN] [vpn.domain.com] Host not found when reso=
lving vpn.xxxx.org, but no Internet connection available, sleeping for 4 se=
conds
2022-01-21 14:00:29.648660: [TUN] [vpn.domain.com] Host not found when reso=
lving vpn.xxxx.org, but no Internet connection available, sleeping for 4 se=
conds
2022-01-21 14:00:33.657345: [TUN] [vpn.domain.com] Host not found when reso=
lving vpn.xxxx.org, but no Internet connection available, sleeping for 4 se=
conds
2022-01-21 14:00:37.672796: [TUN] [vpn.domain.com] Host not found when reso=
lving vpn.xxxx.org, but no Internet connection available, sleeping for 4 se=
conds
2022-01-21 14:00:41.682472: [TUN] [vpn.domain.com] Host not found when reso=
lving vpn.xxxx.org, but no Internet connection available, sleeping for 4 se=
conds
2022-01-21 14:00:45.683318: [TUN] [vpn.domain.com] Host not found when reso=
lving vpn.xxxx.org, but no Internet connection available, sleeping for 4 se=
conds
2022-01-21 14:00:49.696304: [TUN] [vpn.domain.com] Host not found when reso=
lving vpn.xxxx.org, but no Internet connection available, sleeping for 4 se=
conds
2022-01-21 14:00:53.706665: [TUN] [vpn.domain.com] Host not found when reso=
lving vpn.xxxx.org, but no Internet connection available, sleeping for 4 se=
conds
2022-01-21 14:00:57.722719: [TUN] [vpn.domain.com] Host not found when reso=
lving vpn.xxxx.org, but no Internet connection available, sleeping for 4 se=
conds
2022-01-21 14:01:01.725050: [TUN] [vpn.domain.com] Host not found when reso=
lving vpn.xxxx.org, but no Internet connection available, sleeping for 4 se=
conds
2022-01-21 14:01:05.741561: [TUN] [vpn.domain.com] Host not found when reso=
lving vpn.xxxx.org, but no Internet connection available, sleeping for 4 se=
conds
2022-01-21 14:01:09.742016: [TUN] [vpn.domain.com] Host not found when reso=
lving vpn.xxxx.org, but no Internet connection available, sleeping for 4 se=
conds
2022-01-21 14:01:13.742214: [TUN] [vpn.domain.com] Host not found when reso=
lving vpn.xxxx.org, but no Internet connection available, sleeping for 4 se=
conds
2022-01-21 14:01:17.753757: [TUN] [vpn.domain.com] Host not found when reso=
lving vpn.xxxx.org, but no Internet connection available, sleeping for 4 se=
conds
2022-01-21 14:01:21.754324: [TUN] [vpn.domain.com] Host not found when reso=
lving vpn.xxxx.org, but no Internet connection available, sleeping for 4 se=
conds
2022-01-21 14:01:25.754991: [TUN] [vpn.domain.com] Host not found when reso=
lving vpn.xxxx.org, but no Internet connection available, sleeping for 4 se=
conds
2022-01-21 14:01:29.762106: [TUN] [vpn.domain.com] Host not found when reso=
lving vpn.xxxx.org, but no Internet connection available, sleeping for 4 se=
conds
2022-01-21 14:01:33.762738: [TUN] [vpn.domain.com] Host not found when reso=
lving vpn.xxxx.org, but no Internet connection available, sleeping for 4 se=
conds
2022-01-21 14:01:37.763279: [TUN] [vpn.domain.com] Host not found when reso=
lving vpn.xxxx.org, but no Internet connection available, sleeping for 4 se=
conds
2022-01-21 14:01:41.771324: [TUN] [vpn.domain.com] Host not found when reso=
lving vpn.xxxx.org, but no Internet connection available, sleeping for 4 se=
conds
2022-01-21 14:01:45.772269: [TUN] [vpn.domain.com] Host not found when reso=
lving vpn.xxxx.org, but no Internet connection available, sleeping for 4 se=
conds
2022-01-21 14:01:49.777344: [TUN] [vpn.domain.com] Host not found when reso=
lving vpn.xxxx.org, but no Internet connection available, sleeping for 4 se=
conds
2022-01-21 14:01:53.781627: [TUN] [vpn.domain.com] Host not found when reso=
lving vpn.xxxx.org, but no Internet connection available, sleeping for 4 se=
conds
2022-01-21 14:01:57.783379: [TUN] [vpn.domain.com] Host not found when reso=
lving vpn.xxxx.org, but no Internet connection available, sleeping for 4 se=
conds
2022-01-21 14:02:01.784236: [TUN] [vpn.domain.com] Host not found when reso=
lving vpn.xxxx.org, but no Internet connection available, sleeping for 4 se=
conds
2022-01-21 14:02:05.790570: [TUN] [vpn.domain.com] Host not found when reso=
lving vpn.xxxx.org, but no Internet connection available, sleeping for 4 se=
conds
2022-01-21 14:02:09.806000: [TUN] [vpn.domain.com] Host not found when reso=
lving vpn.xxxx.org, but no Internet connection available, sleeping for 4 se=
conds
2022-01-21 14:02:13.811052: [TUN] [vpn.domain.com] Host not found when reso=
lving vpn.xxxx.org, but no Internet connection available, sleeping for 4 se=
conds
2022-01-21 14:02:17.827451: [TUN] [vpn.domain.com] Host not found when reso=
lving vpn.xxxx.org, but no Internet connection available, sleeping for 4 se=
conds
2022-01-21 14:02:21.838263: [TUN] [vpn.domain.com] Host not found when reso=
lving vpn.xxxx.org, but no Internet connection available, sleeping for 4 se=
conds
2022-01-21 14:02:25.839227: [TUN] [vpn.domain.com] Host not found when reso=
lving vpn.xxxx.org, but no Internet connection available, sleeping for 4 se=
conds
2022-01-21 14:02:29.853433: [TUN] [vpn.domain.com] Host not found when reso=
lving vpn.xxxx.org, but no Internet connection available, sleeping for 4 se=
conds
2022-01-21 14:02:33.792594: [MGR] Update checker: The server name or addres=
s could not be resolved
2022-01-21 14:02:33.855521: [TUN] [vpn.domain.com] Host not found when reso=
lving vpn.xxxx.org, but no Internet connection available, sleeping for 4 se=
conds
2022-01-21 14:02:37.861237: [TUN] [vpn.domain.com] Host not found when reso=
lving vpn.xxxx.org, but no Internet connection available, sleeping for 4 se=
conds
2022-01-21 14:02:41.863892: [TUN] [vpn.domain.com] Host not found when reso=
lving vpn.xxxx.org, but no Internet connection available, sleeping for 4 se=
conds
2022-01-21 14:02:45.871248: [TUN] [vpn.domain.com] Host not found when reso=
lving vpn.xxxx.org, but no Internet connection available, sleeping for 4 se=
conds
2022-01-21 14:02:49.877167: [TUN] [vpn.domain.com] Host not found when reso=
lving vpn.xxxx.org, but no Internet connection available, sleeping for 4 se=
conds
2022-01-21 14:02:53.884177: [TUN] [vpn.domain.com] Host not found when reso=
lving vpn.xxxx.org, but no Internet connection available, sleeping for 4 se=
conds
2022-01-21 14:03:20.324752: [TUN] [vpn.domain.com] Starting at boot WireGua=
rd/0.5.3 (Windows 10.0.19043; amd64)
2022-01-21 14:03:20.325969: [MGR] Starting at boot WireGuard/0.5.3 (Windows=
 10.0.19043; amd64)
2022-01-21 14:03:20.331512: [TUN] [vpn.domain.com] Watching network interfa=
ces
2022-01-21 14:03:20.384779: [TUN] [vpn.domain.com] Resolving DNS names
2022-01-21 14:03:20.503593: [TUN] [vpn.domain.com] Host not found when reso=
lving vpn.xxxx.org, but no Internet connection available, sleeping for 4 se=
conds
2022-01-21 14:03:24.517787: [TUN] [vpn.domain.com] Host not found when reso=
lving vpn.xxxx.org, but no Internet connection available, sleeping for 4 se=
conds
2022-01-21 14:03:28.531690: [TUN] [vpn.domain.com] Host not found when reso=
lving vpn.xxxx.org, but no Internet connection available, sleeping for 4 se=
conds
2022-01-21 14:03:32.547531: [TUN] [vpn.domain.com] Host not found when reso=
lving vpn.xxxx.org, but no Internet connection available, sleeping for 4 se=
conds
2022-01-21 14:03:36.558960: [TUN] [vpn.domain.com] Host not found when reso=
lving vpn.xxxx.org, but no Internet connection available, sleeping for 4 se=
conds
2022-01-21 14:03:40.571316: [TUN] [vpn.domain.com] Host not found when reso=
lving vpn.xxxx.org, but no Internet connection available, sleeping for 4 se=
conds
2022-01-21 14:03:44.584276: [TUN] [vpn.domain.com] Host not found when reso=
lving vpn.xxxx.org, but no Internet connection available, sleeping for 4 se=
conds
2022-01-21 14:03:48.589629: [TUN] [vpn.domain.com] Host not found when reso=
lving vpn.xxxx.org, but no Internet connection available, sleeping for 4 se=
conds
2022-01-21 14:03:52.601176: [TUN] [vpn.domain.com] Host not found when reso=
lving vpn.xxxx.org, but no Internet connection available, sleeping for 4 se=
conds
2022-01-21 14:03:56.601326: [TUN] [vpn.domain.com] Host not found when reso=
lving vpn.xxxx.org, but no Internet connection available, sleeping for 4 se=
conds
2022-01-21 14:04:00.604469: [TUN] [vpn.domain.com] Host not found when reso=
lving vpn.xxxx.org, but no Internet connection available, sleeping for 4 se=
conds
2022-01-21 14:04:04.604609: [TUN] [vpn.domain.com] Host not found when reso=
lving vpn.xxxx.org, but no Internet connection available, sleeping for 4 se=
conds
2022-01-21 14:04:08.604685: [TUN] [vpn.domain.com] Host not found when reso=
lving vpn.xxxx.org, but no Internet connection available, sleeping for 4 se=
conds
2022-01-21 14:04:12.611113: [TUN] [vpn.domain.com] Host not found when reso=
lving vpn.xxxx.org, but no Internet connection available, sleeping for 4 se=
conds
2022-01-21 14:04:16.623467: [TUN] [vpn.domain.com] Host not found when reso=
lving vpn.xxxx.org, but no Internet connection available, sleeping for 4 se=
conds
2022-01-21 14:04:20.626082: [TUN] [vpn.domain.com] Host not found when reso=
lving vpn.xxxx.org, but no Internet connection available, sleeping for 4 se=
conds
2022-01-21 14:04:24.637405: [TUN] [vpn.domain.com] Host not found when reso=
lving vpn.xxxx.org, but no Internet connection available, sleeping for 4 se=
conds
2022-01-21 14:04:28.643856: [TUN] [vpn.domain.com] Host not found when reso=
lving vpn.xxxx.org, but no Internet connection available, sleeping for 4 se=
conds
2022-01-21 14:04:32.654152: [TUN] [vpn.domain.com] Host not found when reso=
lving vpn.xxxx.org, but no Internet connection available, sleeping for 4 se=
conds
2022-01-21 14:04:36.661979: [TUN] [vpn.domain.com] Host not found when reso=
lving vpn.xxxx.org, but no Internet connection available, sleeping for 4 se=
conds
2022-01-21 14:04:40.665121: [TUN] [vpn.domain.com] Host not found when reso=
lving vpn.xxxx.org, but no Internet connection available, sleeping for 4 se=
conds
2022-01-21 14:04:44.682742: [TUN] [vpn.domain.com] Host not found when reso=
lving vpn.xxxx.org, but no Internet connection available, sleeping for 4 se=
conds
2022-01-21 14:04:48.698311: [TUN] [vpn.domain.com] Host not found when reso=
lving vpn.xxxx.org, but no Internet connection available, sleeping for 4 se=
conds
2022-01-21 14:04:52.705238: [TUN] [vpn.domain.com] Host not found when reso=
lving vpn.xxxx.org, but no Internet connection available, sleeping for 4 se=
conds
2022-01-21 14:04:56.719339: [TUN] [vpn.domain.com] Host not found when reso=
lving vpn.xxxx.org, but no Internet connection available, sleeping for 4 se=
conds
2022-01-21 14:05:00.729435: [TUN] [vpn.domain.com] Host not found when reso=
lving vpn.xxxx.org, but no Internet connection available, sleeping for 4 se=
conds
2022-01-21 14:05:04.736110: [TUN] [vpn.domain.com] Host not found when reso=
lving vpn.xxxx.org, but no Internet connection available, sleeping for 4 se=
conds
2022-01-21 14:05:08.740339: [TUN] [vpn.domain.com] Host not found when reso=
lving vpn.xxxx.org, but no Internet connection available, sleeping for 4 se=
conds
2022-01-21 14:05:12.743209: [TUN] [vpn.domain.com] Host not found when reso=
lving vpn.xxxx.org, but no Internet connection available, sleeping for 4 se=
conds
2022-01-21 14:05:16.758777: [TUN] [vpn.domain.com] Host not found when reso=
lving vpn.xxxx.org, but no Internet connection available, sleeping for 4 se=
conds
2022-01-21 14:05:20.766557: [TUN] [vpn.domain.com] Host not found when reso=
lving vpn.xxxx.org, but no Internet connection available, sleeping for 4 se=
conds
2022-01-21 14:05:24.775715: [TUN] [vpn.domain.com] Host not found when reso=
lving vpn.xxxx.org, but no Internet connection available, sleeping for 4 se=
conds
2022-01-21 14:05:28.781491: [TUN] [vpn.domain.com] Host not found when reso=
lving vpn.xxxx.org, but no Internet connection available, sleeping for 4 se=
conds
2022-01-21 14:05:32.796664: [TUN] [vpn.domain.com] Host not found when reso=
lving vpn.xxxx.org, but no Internet connection available, sleeping for 4 se=
conds
2022-01-21 14:05:36.799755: [TUN] [vpn.domain.com] Host not found when reso=
lving vpn.xxxx.org, but no Internet connection available, sleeping for 4 se=
conds
2022-01-21 14:05:40.809000: [TUN] [vpn.domain.com] Host not found when reso=
lving vpn.xxxx.org, but no Internet connection available, sleeping for 4 se=
conds
2022-01-21 14:05:44.820797: [TUN] [vpn.domain.com] Host not found when reso=
lving vpn.xxxx.org, but no Internet connection available, sleeping for 4 se=
conds
2022-01-21 14:05:48.823036: [TUN] [vpn.domain.com] Host not found when reso=
lving vpn.xxxx.org, but no Internet connection available, sleeping for 4 se=
conds
2022-01-21 14:05:52.825687: [TUN] [vpn.domain.com] Host not found when reso=
lving vpn.xxxx.org, but no Internet connection available, sleeping for 4 se=
conds
2022-01-21 14:05:56.826425: [TUN] [vpn.domain.com] Host not found when reso=
lving vpn.xxxx.org, but no Internet connection available, sleeping for 4 se=
conds
2022-01-21 14:05:56.832612: [TUN] [vpn.domain.com] Unable to resolve one or=
 more DNS hostname endpoints: No such host is known.
2022-01-21 14:05:56.832612: [TUN] [vpn.domain.com] Shutting down
2022-01-21 14:05:56.833634: [MGR] [vpn.domain.com] Tunnel service tracker f=
inished
2022-01-21 14:15:52.797687: [MGR] Starting UI process for user =E2=80=98adm=
in@NETBIOS=E2=80=99 for session 2


-----------------------------

Tony Pros - Owner
tony@tpro.tech
615 656 3543

T-Pro Tech LLC
Audio & IT Consulting

=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90 Original Me=
ssage =E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90

On Monday, January 17th, 2022 at 4:51 AM, Simon Rozman <simon@rozman.si> wr=
ote:

> Hi,
>
> > I believe there's a bug in the Windows service implementation, if this
> >
> > issue is by design, it's problematic.
> >
> > I have non-admin users were when I initially set them up with wireguard=
,
> >
> > I configured it to use the service, using the command:
> >
> > wireguard /installtunnelservice "C:\Program
> >
> > Files\WireGuard\Data\Configurations\vpn.domain.org.conf.dpapi"
> >
> > The tunnel worked fine the first time. Then the user reboots the laptop=
,
> >
> > or closes it or leaves whatever coffee shop they were at and get
> >
> > disconnected from the wireless network they were using. When this
> >
> > happens, for some reason, the wireguard service then gets torn down
> >
> > never to come back again until I issue the command from my admin accoun=
t
> >
> > again.
>
> Can you do the wireguard /dumplog > wireguard.log and investigate.
>
> > There was an issue with some users initial configuration in that they
> >
> > could not query hostname via DNS, so that entering the command to
> >
> > installservice would not even create the service.
>
> WireGuard services start early on boot - sometimes even before the DNSCac=
he (DNS Client). If the service can't resolve hostnames used in the config =
file, it will stop. But it will log this. Resolution to this problem is:
>
> -   Use IPs rather than hostnames.
> -   Add hostnames you use in your .conf file to C:\Windows\system32\drive=
rs\etc\hosts.
> -   Add DNSCache dependency to the WireGuardTunnel$<your tunnel name> ser=
vice.
>
> I personally would pick one of the first two options above. Don't like th=
e idea my laptop is asking a coffee shop's DNS what is my VPN endpoint IP a=
ddress.
>
> > Here's a few notes that might help with understanding.
> >
> > -   Users must have the VPN established before they log into the active
> >
> >     directory servers on the remote network so that they can get all of
> >
> >     their GPO directives.
> > -   Wireguard Service should stay up so that any time a users connects =
to
> >
> >     any network, the VPN is established immediately after that.
> > -   The Wireguard service should also stay because non-admin users cann=
ot
> >
> >     create a new service
>
> I understand. That is exactly how we use WireGuard in our company.
>
> > If this issue is how things will stay, and this is not considered a bug=
,
> >
> > how would you configure windows non-admin users to tunnel to an
> >
> > enterprise network before login via WireGuard and to continuously try t=
o
> >
> > establish the tunnel while the user is not connected to a network?
>
> Let me assure you, the behavior you are expecting is definitely pathologi=
cal. Please investigate the log file why the tunnel service does not persis=
t as it should.
>
> Best regards,
>
> Simon
