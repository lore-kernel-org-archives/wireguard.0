Return-Path: <SRS0=NpDZ=H6=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE80EC433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 28 Feb 2021 22:14:37 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6E28F64DCF
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 28 Feb 2021 22:14:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6E28F64DCF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dresearch-fe.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f18a8e31;
	Sun, 28 Feb 2021 22:14:34 +0000 (UTC)
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [2607:f8b0:4864:20::22a])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id d1785b1e
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 27 Feb 2021 11:19:31 +0000 (UTC)
Received: by mail-oi1-x22a.google.com with SMTP id x20so12665963oie.11
 for <wireguard@lists.zx2c4.com>; Sat, 27 Feb 2021 03:19:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dresearch-fe-de.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=yc81vVfSDKEdzy4YK1Xn7E5E3FqZPfT7KPwFx9OJV7g=;
 b=Zaz/HpLFEgpAaWGh/96TrzlwCWg4qQmCnXJ5aH0ot+lGL7URdT6KBzn7cPj00kqstu
 w1xi2PEbB3mtlqktl6p0zZTdm/Gm+J2S/Y9xqwVvdt/H50PAycRIfOJ3uIhZzg6Tq9oW
 um+jrfuLj1hhALjRl68We5d/NC1l3pR9KN1sYXuAmCXmCwcBQTs/PSc7VsP/tn0OeDy2
 eZRdKL64pVioumABt96nFMSu6e5aqq2GYgWAeY/u/rPQBXusZ8wcL18XV9n8NBmo80f7
 FzGRkuoKq+k7r6UQ3uc1QliR/BJMvENMHLVw4H+sDjf/MMJj3PAFZJm2VDlYgh7ruipZ
 9IRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:content-transfer-encoding;
 bh=yc81vVfSDKEdzy4YK1Xn7E5E3FqZPfT7KPwFx9OJV7g=;
 b=qbt4earmwJ+p6QvUQpnAbq9HIvksVkaktWKB0+3ybTndXKlH2SQ0WKfFRw+4GVtBg0
 MX2HJWNK/99LNKCE0oIsAnOch6J6eELKRKsH4ln52+ywtv7mHMGbghLeEXRjsTUL1Qty
 2mzJQtKUABqxHSBSOasyC+DlNMUs/6vIy8ScofpA2oRu0gamLlBxxQYXnqLZhHWA0jU7
 PE0eZwore0qA+sLlprSn5VUTgLjQH5NUxcVxBplTwGo7PBuMModPM2A2QJMULr6nJzZ5
 QfqZJiNBH3cQkuwZHr2mDxEY+5EXFUU7XXdzviVxheiH9zIz5InkFnoY12pRqe+/Ux29
 mguQ==
X-Gm-Message-State: AOAM531KvpgFc1INZxQ1ZUfM5jykeBJM8c8VNkLgDNRrZw7W51TUy0oe
 Tr7SS3tOjSuMSMkuDXnNhr/ZY3eKgw6gRDjRDOyrsEy1vbI=
X-Google-Smtp-Source: ABdhPJztnuBJ79OSEpLPuDiiqydoGqSrbIeE1a1uIpkibk596i4tPW4XDvlv2TLa4hSwD4SNxjyLF+JpUEVvN68qH6o=
X-Received: by 2002:aca:ba02:: with SMTP id k2mr1648908oif.60.1614424769893;
 Sat, 27 Feb 2021 03:19:29 -0800 (PST)
MIME-Version: 1.0
References: <CAA4ESQ28f+Q77uduCHRmb9YDqCfE3qKp7+P=n=0MU9VDOCCbDg@mail.gmail.com>
In-Reply-To: <CAA4ESQ28f+Q77uduCHRmb9YDqCfE3qKp7+P=n=0MU9VDOCCbDg@mail.gmail.com>
From: Heiko Kendziorra <kendziorra@dresearch-fe.de>
Date: Sat, 27 Feb 2021 12:19:16 +0100
Message-ID: <CAA4ESQ2k-EK9-o6ThDQYt+C87ojvE71PLmXFyKpMg4BC2jNTYA@mail.gmail.com>
Subject: Fwd: Wireguard Win10 Client not work through an openVPN tunnel on the
 same machine
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Sun, 28 Feb 2021 22:14:32 +0000
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

Machine A in Intranet Windows 10 Prof Version : 20H2
Address 172.1.2.3
Firewall is open for  webserver und wireguard (8080 tcp, 44444 udp)
is WireguardServer  Version 0.3.7

wg.conf:
PublicKey =3D A8C8+bRYaqu2MKs2SpwuRRgmwqItYwFFJjk77UtUUxU=3D
[Interface]
PrivateKey =3D ********************************
ListenPort =3D 44444
Address =3D 192.168.44.44/32
[Peer]
PublicKey =3D JkacJ6IYPUgCOv+OdHN6ZMJ+JRZr6V5/kDzthil/CUs=3D
AllowedIPs =3D 192.168.44.4/32
PersistentKeepalive =3D 25
---------------------------------------------------------------------------=
-----
Machine B extern over openVPN connected with the Intranet Windows 10
Prof Version : 20H2  (OpenVPN Client running on B)
Address 172.11.12.13 could reach A over Routing  (Test: Webserver on
A: 172.1.2.3:8080)
is WireguardClient Version 0.3.7

wg.conf:
PublicKey =3D JkacJ6IYPUgCOv+OdHN6ZMJ+JRZr6V5/kDzthil/CUs=3D
[Interface]
PrivateKey =3D **********************
Address =3D 192.168.44.4/32

[Peer]
PublicKey =3D A8C8+bRYaqu2MKs2SpwuRRgmwqItYwFFJjk77UtUUxU=3D
AllowedIPs =3D 192.168.44.44/32
Endpoint =3D 172.16.41.20:44444
PersistentKeepalive =3D 25
---------------------------------------------------------------------------=
-----

Result after Activation
The Client B could not estable a working Wireguard-Connetion to A :

Protokoll Server:
2021-02-27 10:53:02.636: [TUN] [44444] Startup complete
2021-02-27 10:53:03.615: [TUN] [44444] peer(Jkac=E2=80=A6/CUs) - Received
handshake initiation
2021-02-27 10:53:03.615: [TUN] [44444] peer(Jkac=E2=80=A6/CUs) - Sending
handshake response
2021-02-27 10:53:07.821: [TUN] [44444] peer(Jkac=E2=80=A6/CUs) - Handshake =
did
not complete after 5 seconds, retrying (try 2)
2021-02-27 10:53:11.480: [MGR] [Wintun] IsPoolMember: Reading pool
devpkey failed, falling back: Element nicht gefunden. (Code
0x00000490)
2021-02-27 10:53:28.626: [TUN] [44444] peer(Jkac=E2=80=A6/CUs) - Sending
handshake initiation
2021-02-27 10:53:33.794: [TUN] [44444] peer(Jkac=E2=80=A6/CUs) - Handshake =
did
not complete after 5 seconds, retrying (try 2)
2021-02-27 10:53:33.794: [TUN] [44444] peer(Jkac=E2=80=A6/CUs) - Sending
handshake initiation
2021-02-27 10:53:39.094: [TUN] [44444] peer(Jkac=E2=80=A6/CUs) - Handshake =
did
not complete after 5 seconds, retrying (try 3)
2021-02-27 10:53:39.094: [TUN] [44444] peer(Jkac=E2=80=A6/CUs) - Sending
handshake initiation
2021-02-27 10:53:44.286: [TUN] [44444] peer(Jkac=E2=80=A6/CUs) - Handshake =
did
not complete after 5 seconds, retrying (try 4)
2021-02-27 10:53:44.286: [TUN] [44444] peer(Jkac=E2=80=A6/CUs) - Sending
handshake initiation
2021-02-27 10:53:49.549: [TUN] [44444] peer(Jkac=E2=80=A6/CUs) - Handshake =
did
not complete after 5 seconds, retrying (try 5)
2021-02-27 10:53:49.549: [TUN] [44444] peer(Jkac=E2=80=A6/CUs) - Sending
handshake initiation

Protokoll Client:
2021-02-27 10:53:02.793: [TUN] [test-44444] Startup complete
2021-02-27 10:53:02.836: [TUN] [test-44444] peer(A8C8=E2=80=A6UUxU) - Recei=
ved
handshake response
2021-02-27 10:53:23.530: [TUN] [test-44444] peer(A8C8=E2=80=A6UUxU) - Retry=
ing
handshake because we stopped hearing back after 15 seconds
2021-02-27 10:53:23.530: [TUN] [test-44444] peer(A8C8=E2=80=A6UUxU) - Sendi=
ng
handshake initiation
2021-02-27 10:53:27.815: [TUN] [test-44444] peer(A8C8=E2=80=A6UUxU) - Recei=
ved
handshake initiation
2021-02-27 10:53:27.815: [TUN] [test-44444] peer(A8C8=E2=80=A6UUxU) - Sendi=
ng
handshake response
2021-02-27 10:53:28.815: [TUN] [test-44444] peer(A8C8=E2=80=A6UUxU) -
Handshake did not complete after 5 seconds, retrying (try 2)
2021-02-27 10:53:32.982: [TUN] [test-44444] peer(A8C8=E2=80=A6UUxU) - Recei=
ved
handshake initiation
2021-02-27 10:53:32.982: [TUN] [test-44444] peer(A8C8=E2=80=A6UUxU) - Sendi=
ng
handshake response
2021-02-27 10:53:38.283: [TUN] [test-44444] peer(A8C8=E2=80=A6UUxU) - Recei=
ved
handshake initiation
2021-02-27 10:53:38.283: [TUN] [test-44444] peer(A8C8=E2=80=A6UUxU) - Sendi=
ng
handshake response
2021-02-27 10:53:43.475: [TUN] [test-44444] peer(A8C8=E2=80=A6UUxU) - Recei=
ved
handshake initiation
2021-02-27 10:53:43.475: [TUN] [test-44444] peer(A8C8=E2=80=A6UUxU) - Sendi=
ng
handshake response
2021-02-27 10:53:48.738: [TUN] [test-44444] peer(A8C8=E2=80=A6UUxU) - Recei=
ved
handshake initiation
2021-02-27 10:53:48.738: [TUN] [test-44444] peer(A8C8=E2=80=A6UUxU) - Sendi=
ng
handshake response
2021-02-27 10:53:54.066: [TUN] [test-44444] peer(A8C8=E2=80=A6UUxU) - Recei=
ved
handshake initiation
2021-02-27 10:53:54.066: [TUN] [test-44444] peer(A8C8=E2=80=A6UUxU) - Sendi=
ng
handshake response
2021-02-27 10:53:59.148: [TUN] [test-44444] peer(A8C8=E2=80=A6UUxU) - Recei=
ved
handshake initiation
2021-02-27 10:53:59.148: [TUN] [test-44444] peer(A8C8=E2=80=A6UUxU) - Sendi=
ng
handshake response
2021-02-27 10:54:04.459: [TUN] [test-44444] peer(A8C8=E2=80=A6UUxU) - Recei=
ved
handshake initiation
2021-02-27 10:54:04.459: [TUN] [test-44444] peer(A8C8=E2=80=A6UUxU) - Sendi=
ng
handshake response
2021-02-27 10:54:09.601: [TUN] [test-44444] Device closing

Apparently, the only message that the server has received from the
client is the one that was sent to the public address on port 44444.
After that, the client can no longer send a message - but the other
way round it can.

Modifikation

start a Win10 Sandbox on B.
install the Wireguard Client  there with the same configuration like on B
deactivate  WG-Client on  B
the Sandbox could reach A over routing through the running Open-VPN of B
under these conditions, the wiregiard connection can also be established!!

Protokoll Server:
2021-02-27 11:46:04.958: [TUN] [44444] Startup complete
2021-02-27 11:46:05.762: [TUN] [44444] peer(Jkac=E2=80=A6/CUs) - Received
handshake initiation
2021-02-27 11:46:05.762: [TUN] [44444] peer(Jkac=E2=80=A6/CUs) - Sending
handshake response
2021-02-27 11:46:05.786: [TUN] [44444] peer(Jkac=E2=80=A6/CUs) - Receiving
keepalive packet
2021-02-27 11:46:13.757: [MGR] [Wintun] IsPoolMember: Reading pool
devpkey failed, falling back: Element nicht gefunden. (Code
0x00000490)
2021-02-27 11:46:30.795: [TUN] [44444] peer(Jkac=E2=80=A6/CUs) - Sending
keepalive packet
2021-02-27 11:46:30.812: [TUN] [44444] peer(Jkac=E2=80=A6/CUs) - Receiving
keepalive packet

Protokoll Client:
2021-02-27 11:46:05.050: [TUN] [wg-test-sandbox] Startup complete
2021-02-27 11:46:05.065: [TUN] [wg-test-sandbox] peer(A8C8=E2=80=A6UUxU) -
Received handshake response
2021-02-27 11:46:05.088: [TUN] [wg-test-sandbox] peer(A8C8=E2=80=A6UUxU) -
Receiving keepalive packet
2021-02-27 11:46:30.093: [TUN] [wg-test-sandbox] peer(A8C8=E2=80=A6UUxU) -
Sending keepalive packet
2021-02-27 11:46:30.097: [TUN] [wg-test-sandbox] peer(A8C8=E2=80=A6UUxU) -
Receiving keepalive packet

Heiko Kendziorra
