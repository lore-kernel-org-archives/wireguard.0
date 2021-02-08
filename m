Return-Path: <SRS0=sRnz=HN=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9081C433DB
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 11 Feb 2021 14:46:43 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0ACA664E7A
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 11 Feb 2021 14:46:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0ACA664E7A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ea12dbe7;
	Thu, 11 Feb 2021 14:46:40 +0000 (UTC)
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [2607:f8b0:4864:20::32c])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id bd02f69d
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 8 Feb 2021 10:42:49 +0000 (UTC)
Received: by mail-ot1-x32c.google.com with SMTP id q4so4068592otm.9
 for <wireguard@lists.zx2c4.com>; Mon, 08 Feb 2021 02:42:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=k+r5L4evbF81f/pqmSeQikmJQgPn6Z2foc92ZNx3PCo=;
 b=GFdBV+PLEJLCFGfNAYuivDjMBoos7Yyno5VvqvOewoAgE03lUIDU0Pi2Oeh0XoPyQ2
 KMTHVBs07iRayUfdV6Er1kUvs/FA9Fu5jOA0k2b3InLZsycGIscia+fEHXmWgcbLhkNV
 fRBx4TlJp7zMVMHcFDUZjIGlPlbFtwiU1cJ0abP8XSX/Z86b3qCLpe5fFPCPNlnG9aZj
 REx2Qel1S2b2iYoZRxPA1TjAkNY3iEHJE68PtOLnuSHF+rN9BWM5wpYGk7HhvLqDIFMC
 aU6VMJCj9W1+/w4yKgiIVMti2GWKExS3VTYfQn8db3ZOOojoVdLi039tEj3XmWhMX7Oi
 kufQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=k+r5L4evbF81f/pqmSeQikmJQgPn6Z2foc92ZNx3PCo=;
 b=KriSx3KnYISp3wwoZMt8ZEEuw84KK3xHZ8eX6W84CpuQ/6FsF50b1JoU7Bz2aFJWNM
 UfaPw5wDPnYqQ7XoYNwAKgamIKm9I1BZ3RoSXMEMFSrqeXFdvXOyGja1XWZjbLNJGtVC
 evQ0e/v/raYyBpRFEs/OcYz9d/pl7zQg3Szf9kBUh1LyTS1yzCH25LtBPnujMESj0d11
 gW/RK3f4LJzMP7SAa6o1RbRsLKhR3W7yZX7f5kf+D19VHpvBXi+W4w3cHFXWZXwEPwGm
 ZQdF/TDNjcnh5SW24ysaEb8hZJKHtVdJ7eh2gnDxxghorub1EKqp5PFZF4B2TEy1EY6k
 ZkxQ==
X-Gm-Message-State: AOAM533K5+ZCL/aawlWLGszkBExIxxf2gA8P95sCTswrSoDsAQNHjamh
 KDbaBOv8IcuKyB0rllpsrhoxU7xNvZnv8vR8XgDvYJs7xRqsZHIp
X-Google-Smtp-Source: ABdhPJyuQLALLp4oOeABN4+y1Kbxm4FR/40Lth8MuOIo/OD1xTqcwiGnXQUJzOLya2mZ3jI1GylF50YEHmOqlk7ad7M=
X-Received: by 2002:a9d:61c9:: with SMTP id h9mr9619309otk.129.1612780968111; 
 Mon, 08 Feb 2021 02:42:48 -0800 (PST)
MIME-Version: 1.0
From: i iordanov <iiordanov@gmail.com>
Date: Mon, 8 Feb 2021 05:42:12 -0500
Message-ID: <CAMS0tn3oqdty_DKoxkQF0jNFGfS5i+hhC20SBOChOuZAN67CAw@mail.gmail.com>
Subject: Nested Wireguard tunnels not working on Android
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Thu, 11 Feb 2021 14:46:38 +0000
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

Hello,

In order to allow traffic to assist devices that cannot reach each
other directly, I am setting up wireguard tunnels through a server
with a public IP (40.30.40.30 in the example below).

For reasons of privacy, I'd like for the server to not be able to
decrypt my traffic. As a result, I would like for one encapsulating
Wireguard tunnel (subnet 10.1.2.0/24) to be peered through the server,
while a second nested Wireguard tunnel (subnet 10.1.3.0/24) to be
established through the first tunnel, peered only at the two devices
(Android and Linux in this case) that need to communicate.

An attempt was made to use a single Wireguard interface. Doing it this
way works between two Linux machines and even between Linux and Mac OS
X, but does not work between a Pixel 3a XL running Android 11 with the
GoBackend Wireguard implementation and my Linux laptop.

The config on the Android device, obtained with toWgQuickString():
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
    [Interface]
    Address =3D 10.1.2.5/24, 10.1.3.5/24
    ListenPort =3D 46847
    MTU =3D 1200
    PrivateKey =3D PRIVATE_KEY

    [Peer]
    AllowedIPs =3D 10.1.2.0/24
    Endpoint =3D 40.30.40.30:10000
    PersistentKeepalive =3D 3600
    PublicKey =3D VF5dic+a+6MllssbV+ShVwEBRrX9gr4do2iNylWrPGs=3D

    [Peer]
    AllowedIPs =3D 10.1.3.1/32
    Endpoint =3D 10.1.2.1:51555
    PersistentKeepalive =3D 3600
    PublicKey =3D 0Awdb451Z4+3Gezm7UlbRquC1kcF52r68J9wG1x/zUE=3D
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

The 10.1.2.0/24 subnet is the one that is "visible" to the public
server. The 10.1.3.0/24 subnet is the one that is private to the two
devices.

The devices can actually reach each other with netcat over UDP at
10.1.2.5:46847 and 10.1.2.1:51555 respectively. So the "encapsulating"
tunnel is working, and iperf3 were used to test it over UDP and TCP
successfully.

The "nested" tunnel does not get established.

The following permutations of the above config have the commented problems:

# Only 10.1.2.0/24 works, 10.1.3.0/24 does not.
    Address =3D 10.1.2.1/24, 10.1.3.1/24

# Only 10.1.2.0/24 works, 10.1.3.0/24, as expected, does not.
    Address =3D 10.1.2.1/24

# Neither network works
    Address =3D 10.1.3.1/24, 10.1.2.1/24

Suspecting routing, i ran ip route over adb, and obtained:
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
$ ip route show table 0 | grep 10.1
10.1.2.0/24 dev tun0 table 1548 proto static scope link
10.1.3.0/24 dev tun0 table 1548 proto static scope link
10.1.3.1 dev tun0 table 1548 proto static scope link
10.1.2.0/24 dev tun0 proto kernel scope link src 10.1.2.5
10.1.3.0/24 dev tun0 proto kernel scope link src 10.1.3.5
broadcast 10.1.2.0 dev tun0 table local proto kernel scope link src 10.1.2.=
5
local 10.1.2.5 dev tun0 table local proto kernel scope host src 10.1.2.5
broadcast 10.1.2.255 dev tun0 table local proto kernel scope link src 10.1.=
2.5
broadcast 10.1.3.0 dev tun0 table local proto kernel scope link src 10.1.3.=
5
local 10.1.3.5 dev tun0 table local proto kernel scope host src 10.1.3.5
broadcast 10.1.3.255 dev tun0 table local proto kernel scope link src 10.1.=
3.5
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

ip addr over adb shows:
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
    550: tun0: <POINTOPOINT,UP,LOWER_UP> mtu 1200 qdisc pfifo_fast
state UNKNOWN group default qlen 500
    link/none
    inet 10.1.2.5/24 scope global tun0
       valid_lft forever preferred_lft forever
    inet 10.1.3.5/24 scope global tun0:1
       valid_lft forever preferred_lft forever
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

On the Android logcat, the log appears to show handshakes exchanged:
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
peer(VF5d=E2=80=A6rPGs) - Received handshake response
peer(VF5d=E2=80=A6rPGs) - Sending keepalive packet
peer(0Awd=E2=80=A6/zUE) - Received handshake initiation
peer(0Awd=E2=80=A6/zUE) - Sending handshake response
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

The other device (not the public server) is a Linux box. Dmesg shows
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[334831.125034] wireguard: LinuxWg: Handshake for peer 520
(10.1.2.5:46847) did not complete after 5 seconds, retrying (try 17)
[334831.125062] wireguard: LinuxWg: Sending handshake initiation to
peer 520 (10.1.2.5:46847)
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

wg showconf shows:
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[Interface]
ListenPort =3D 51555
PrivateKey =3D PRIVATE_KEY

[Peer]
PublicKey =3D BOApHt2nj7Tvm/LAGpYB9/2KsZ8iYkWjfEUEUm7x6Q0=3D
AllowedIPs =3D 10.1.3.5/32
Endpoint =3D 10.1.2.5:46847
PersistentKeepalive =3D 25
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

wg show:
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
interface: LinuxWg
  public key: 0Awdb451Z4+3Gezm7UlbRquC1kcF52r68J9wG1x/zUE=3D
  private key: (hidden)
  listening port: 51555

peer: BOApHt2nj7Tvm/LAGpYB9/2KsZ8iYkWjfEUEUm7x6Q0=3D
  endpoint: 10.1.2.5:46847
  allowed ips: 10.1.3.5/32
  transfer: 0 B received, 37.00 KiB sent
  persistent keepalive: every 25 seconds

interface: LinuxWg2
  public key: Bb92MANIA5rzukELvNdTXMDWaBAi8+T8s7C+nnytRiE=3D
  private key: (hidden)
  listening port: 51556

peer: VF5dic+a+6MllssbV+ShVwEBRrX9gr4do2iNylWrPGs=3D
  endpoint: 40.30.40.30:10000
  allowed ips: 10.1.2.0/24
  latest handshake: 1 minute, 22 seconds ago
  transfer: 11.89 KiB received, 61.08 KiB sent
  persistent keepalive: every 25 seconds
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Kernel:
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Linux hostname 5.4.0-59-generic #65~18.04.1-Ubuntu SMP Mon Dec 14
15:59:40 UTC 2020 x86_64 x86_64 x86_64 GNU/Linux
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Would you expect for this to work with GoBackend, or is there an
inherent limitation that would break it?

Any suggestions on what to do differently are welcome!

Thank you very much,
iordan


--=20
The conscious mind has only one thread of execution.
