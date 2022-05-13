Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0944C433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 13 May 2022 23:39:30 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 3a855a98;
	Fri, 13 May 2022 23:31:32 +0000 (UTC)
Received: from mr85p00im-ztdg06011201.me.com (mr85p00im-ztdg06011201.me.com
 [17.58.23.181])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 66417f2e
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 13 May 2022 05:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com;
 s=1a1hai; t=1652418658;
 bh=hP+wlwnL8A4EQKPx8KoFTLrjn7rKxnLqExTV3i5/5cQ=;
 h=From:Content-Type:Mime-Version:Subject:Message-Id:Date:To;
 b=dnMr/xuEdeXiKnu5GyWRHX90vvlCsSTVRjDCMDdEJdIxDzKfV3yArysfKuImafLtK
 /XQO8EbzGsPr7ntls0qkM2LA3w40l2iiFNzKTe5od/dzSv71xNp8uHX0eSvSWgSf+E
 WJgcD8WKqhONPmeo1/3V1CJ1TaZ3J425gPlgcUzMMeaLfypuw5rfFR/IQ/seZgby9s
 Ju2PKseJ5RhUqVSjVvR6z3zoGAykBwKW+NSye8vNCLcfA12NDGVAHeXoqMtLo8HkX8
 udD0LlOgGkGJF9J636YHEgdBz2qSy+avECYppcS8cHx7Zi3+bXFEzLPwSnDJUYvFeL
 iozupT2lnQvmA==
Received: from smtpclient.apple (mr38p00im-dlb-asmtp-mailmevip.me.com
 [17.57.152.18])
 by mr85p00im-ztdg06011201.me.com (Postfix) with ESMTPSA id 0B07A960B3B
 for <wireguard@lists.zx2c4.com>; Fri, 13 May 2022 05:10:57 +0000 (UTC)
From: Felix Geschwindner <felix.geschwindner@icloud.com>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.80.82.1.1\))
Subject: WireGuard Windows client handshake packets appear to be blackholed
Message-Id: <7C8C19EF-9076-4A65-9656-EEC28E688B4B@icloud.com>
Date: Thu, 12 May 2022 22:10:57 -0700
To: wireguard@lists.zx2c4.com
X-Mailer: Apple Mail (2.3696.80.82.1.1)
X-Proofpoint-ORIG-GUID: cnM9rikurlZXMsIJfeke6toR0LDzVJ3g
X-Proofpoint-GUID: cnM9rikurlZXMsIJfeke6toR0LDzVJ3g
X-Proofpoint-Virus-Version: =?UTF-8?Q?vendor=3Dfsecure_engine=3D1.1.170-22c6f66c430a71ce266a39bfe25bc?=
 =?UTF-8?Q?2903e8d5c8f:6.0.138,18.0.572,17.0.605.474.0000000_definitions?=
 =?UTF-8?Q?=3D2020-02-14=5F11:2020-02-14=5F02,2020-02-14=5F11,2020-01-23?=
 =?UTF-8?Q?=5F02_signatures=3D0?=
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 malwarescore=0 clxscore=1015
 suspectscore=0 mlxlogscore=999 phishscore=0 bulkscore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205130023
X-Mailman-Approved-At: Fri, 13 May 2022 23:31:24 +0000
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

Hey folks,

I sent a similar mail a week ago and it said it=E2=80=99s waiting for =
approval but haven=E2=80=99t gotten anything else back so I thought, try =
again since there were other mails on the list that came through in the =
meantime.

I=E2=80=99ve been using WireGuard on my macOS, Linux & Windows machines =
for a while now and recently the Windows machines started to block =
WireGuard in a strange way.
I=E2=80=99m using Windows 10 & 11 with the latest updates. WireGuard =
client version is v0.5.3.

The config looks like this:

[Interface]
PrivateKey =3D <client_private_key>
Address =3D 10.0.0.10/32
DNS =3D 192.168.0.1

[Peer]
PublicKey =3D <server_public_key>
AllowedIPs =3D 192.168.0.0/24
Endpoint =3D vpn.example.com:51820

When I activate the WireGuard VPN it reports that the connection is =
active and ready to go. I even see the new adapter created in the =
Windows network settings but when I try to ping resources behind the =
VPN, I get a =E2=80=9CGeneral Failure=E2=80=9D message from the command =
line.
Pinging the local client VPN adapter IP works.

First I tried a couple simple things that may help the WireGuard client =
to succeed:

	=E2=80=A2 Reboot
	=E2=80=A2 Run as administrator
	=E2=80=A2 Re-install client
	=E2=80=A2 Re-generate keys & config
	=E2=80=A2 Try same config on a Mac to rule out mismatches (this =
works)
	=E2=80=A2 Run WireGuard in Windows 7 compatibility mode
	=E2=80=A2 Configure the TCP/IP stack in the registry to favor =
IPv4 over IPv6
	=E2=80=A2 Disable IPv6 entirely
	=E2=80=A2 Add explicit firewall rule to allow WireGuard ports
	=E2=80=A2 Disable firewall entirely
	=E2=80=A2 Try full-tunnel via 0.0.0.0/0 in "AllowedIPs"

None of the above points produced any change whatsoever.

Finally I took to WireShark to see if it can help me identify where the =
packets get stuck and surprisingly WireShark doesn=E2=80=99t show ANY =
packets destined for the 51820 UDP port on ANY interface. Which is the =
point at which I ran out of ideas.
I tried this on 2 different Windows machines and both exhibit the same =
behavior so it doesn=E2=80=99t look like it is something that is special =
to a machine. I have not yet gotten to test a complete fresh install of =
windows as that is a bigger undertaking.

Thanks,
Felix=
