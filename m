Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8C62C433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 14 Feb 2022 13:55:09 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 92b77762;
	Mon, 14 Feb 2022 13:55:07 +0000 (UTC)
Received: from cynic.org (harbard.cynic.org [75.144.22.203])
 by lists.zx2c4.com (OpenSMTPD) with ESMTP id 879df0dc
 for <wireguard@lists.zx2c4.com>;
 Tue, 25 Jan 2022 16:47:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cynic.org;
 s=default; t=1643129261;
 bh=zK5ejFNiXuEJ5QJCy4B8tOAd3zWTw15WD/VPtUYUyjE=;
 h=Subject:From:Date:To;
 b=lzuCJGtShOlfjcr/hfHR4H6MztKafG+t9TqOELxN28Zr1BukyTVI5aI3sG+J8eatx
 Wq5pAm2DX0rzEdqlmGe59fJgxHTl5EgyRegO5lCIjyxeGInypl64K2FZVOAB3CmvIs
 sqV8U/qIxmlQ6Nj9x8Pa8l7h4nmWfeBTWjIdJfIGgRpbd+1IpOcZy016HY1ndi2//I
 p8EvhGMy9fhCLNxlz/V/ErHOWrfg0yjlXyipnWLJCLp9CEmTrkWxJBpsnfbv1Nh7U1
 z5bXsm6j1qclb93eQFutqi1JvgW6pvmhTE3GG+Cs//tbeCCpegTKXeqsy2Xh84MMWh
 Tj68hWuRxpEmw==
X-Default-Received-SPF: pass (skip=loggedin (res=PASS))
 x-ip-name=192.231.102.155; envelope-from=<perry@cynic.org>; 
Received: from smtpclient.apple (unverified [192.231.102.155]) 
 by cynic.org (SurgeMail 7.4e) with ESMTP (TLS) id 14406-1282950 
 for multiple; Tue, 25 Jan 2022 08:47:40 -0800
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: [macOS] possible bug
From: Perry The Cynic <perry@cynic.org>
In-Reply-To: <948FB3D5-2990-48E1-B27F-FDA699AEAF24@netcore.se>
Date: Tue, 25 Jan 2022 08:47:39 -0800
Cc: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <05FC8CC3-BCE1-420A-ACFD-AA6F7B06D218@cynic.org>
References: <948FB3D5-2990-48E1-B27F-FDA699AEAF24@netcore.se>
To: Richard Werner <richard@netcore.se>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-Authenticated-User: perry@cynic.org 
X-Mailman-Approved-At: Mon, 14 Feb 2022 13:55:05 +0000
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

FWIW, -25300 is errSecItemNotFound (keychain item not found). The MacOS =
keychain environment is much more complex than on iOS (in fact, =
there=E2=80=99s an iOS port inside it). Check whether the affected =
environments have multiple keychains (which can confuse the =E2=80=9Cexist=
s=E2=80=9D issue), and look (with Keychain Access.app) for broken items =
that keep the code from recreating good items with a particular primary =
key. The "Removing orphaned tunnel with non-verifying keychain entry=E2=80=
=9D message points that way.

See if you can reproduce with a fresh user account (which comes with a =
fresh keychain configuration); if resetting the keychain environment =
cures the problem, you=E2=80=99re very likely looking at a broken item =
and/or broken cleanup code.

Cheers
  =E2=80=94 perry


> On Jan 17, 2022, at 11:49 AM, Richard Werner <richard@netcore.se> =
wrote:
>=20
> Hi everyone.
> We found a strange issue regarding macOS client and hope this is a =
proper way to start (and get some help debugging) a possible bug.
> I=E2=80=99ve not been able to capture the actual error message shown =
to the user, but I have the a log file.
>=20
> What seem to happen is something like this:
> 1. Have a working configuration.
> 2. Some unknown event happens (still investigating).
> 3. An error message is shown (something along the lines of "unable to =
read config=E2=80=9D).
> 4. Orphaned configs are removed, but there seems to be more going on =
which we can=E2=80=99t identify.
> 5. No WG VPN's will work regardless of removing configs, keychains, =
etc.
>=20
> Even if all tunnels are removed and added again, no traffic leaves the =
client. It effectively enters a state of not being able to use any =
wireguards vpns on the client.
>=20
>=20
> Some entries from the log that shows going from working to not =
functioning will follow.
> More complete log at https://pastebin.com/m2MqHhPF
>=20
> -Working:
> 2022-01-17 17:55:59.292781: [NET] peer(ZY6x=E2=80=A61ZBc) - Sending =
handshake initiation
> 2022-01-17 17:55:59.337042: [NET] peer(ZY6x=E2=80=A61ZBc) - Received =
handshake response
> 2022-01-17 17:59:22.007634: [NET] peer(ZY6x=E2=80=A61ZBc) - Receiving =
keepalive packet
>=20
> -Error message is shown:
> 2022-01-17 18:35:29.081737: [APP] App version: 1.0.15 (26)
> 2022-01-17 18:36:22.662281: [APP] startActivation: Entering (tunnel: =
VPN X)
> 2022-01-17 18:36:23.490825: [APP] Unable to open config from keychain: =
-25300
> 2022-01-17 18:36:23.491058: [APP] startActivation: Starting tunnel
> 2022-01-17 18:36:23.491288: [APP] startActivation: Success
> 2022-01-17 18:36:23.497349: [APP] Tunnel 'VPN X' connection status =
changed to 'connecting'
> 2022-01-17 18:36:23.582298: [APP] Unable to open config from keychain: =
-25300
> 2022-01-17 18:36:28.491285: [APP] Status update notification timeout =
for tunnel 'VPN X'. Tunnel status is now 'connecting'.
> 2022-01-17 18:36:29.517132: [APP] Unable to open config from keychain: =
-25300
>=20
> -Tunnel config is removed:
> 2022-01-17 18:38:47.127836: [APP] App version: 1.0.15 (26)
> 2022-01-17 18:38:47.337355: [APP] Removing orphaned tunnel with =
non-verifying keychain entry: VPN X
>=20
> -Tunnel now fails with same config (imported or manually entered)
> 2022-01-17 18:39:51.924221: [APP] Status update notification timeout =
for tunnel 'VPN X'. Tunnel status is now 'connected'.
> 2022-01-17 18:39:52.248987: [NET] peer(ZY6x=E2=80=A61ZBc) - Sending =
handshake initiation
> 2022-01-17 18:39:57.410547: [NET] peer(ZY6x=E2=80=A61ZBc) - Handshake =
did not complete after 5 seconds, retrying (try 2)
> 2022-01-17 18:39:57.410877: [NET] peer(ZY6x=E2=80=A61ZBc) - Sending =
handshake initiation
> 2022-01-17 18:39:57.411226: [NET] peer(ZY6x=E2=80=A61ZBc) - Failed to =
send handshake initiation: write udp4 0.0.0.0:52982-><server ip>:443: =
sendto: broken pipe
> [=E2=80=A6]
> 2022-01-17 18:40:00.396146: [APP] Tunnel 'VPN X' connection status =
changed to 'disconnected'
> 2022-01-17 18:41:27.735004: [APP] Tunnel 'VPN X' connection status =
changed to =E2=80=98invalid'
>=20
>=20
> =E2=80=94Richard
>=20

