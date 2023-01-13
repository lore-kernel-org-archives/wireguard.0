Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0FEAC54E76
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 17 Jan 2023 19:00:24 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1b6a5bfc;
	Tue, 17 Jan 2023 18:58:12 +0000 (UTC)
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [2a00:1450:4864:20::12b])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id f8fc21f3
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 13 Jan 2023 08:55:54 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id j17so32194752lfr.3
 for <wireguard@lists.zx2c4.com>; Fri, 13 Jan 2023 00:55:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=holmedal.net; s=google;
 h=to:in-reply-to:cc:references:message-id:date:subject:mime-version
 :from:content-transfer-encoding:from:to:cc:subject:date:message-id
 :reply-to; bh=ULS4fpU5NhrvMPZPdKmYALQ/sx+G0VHjcGteRzf0ocE=;
 b=iJZQq+yImRgGyeB7KJLFZr9ffQCbbjGRogqY3FnDqw+mKm59u6Ih8d6YCZ68VCo0l3
 3wY8D5ObxhvqUI7sxn/QHKWzi5jbo+dXwf0bITHUB3h+2h1Owjy0F8fcKjd7+BF5pgRt
 4jGdMPFJR1uqpncNPyMGETpN423PFI4On3PIM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:in-reply-to:cc:references:message-id:date:subject:mime-version
 :from:content-transfer-encoding:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ULS4fpU5NhrvMPZPdKmYALQ/sx+G0VHjcGteRzf0ocE=;
 b=lJuW39Rooy9+F2OVR9rEt2U75uOWkoOhau4NYqRbj2PKNcd0CAuv2Bo2dEBsaRIrya
 8pwSsVaTkR91iDT0vsKSq/X64AJQx5s+qHm2aliFXGJceuUUyw9OFXe1NV1rj/l/YQ0b
 wliOK5YAewj8aRUZ5jwISA9P5BqEUNRIuhzhI8ObDiWkrmzCT0IcXtIcSAwpffUE9i8V
 c4yrxS0AtNtaC3IHaBdpviCZtLLCtDww/tf7RlUaxNfuejpW7rih66XQNduX8uR3KRzC
 yk9o3X/SHaFtEGyTJ53rftTO6pv+54lxJgR/Kbrala2ufVd6E2ABoibMk8kXVdChSzD2
 B1bA==
X-Gm-Message-State: AFqh2kpma+8LJmg9cfTCJUVcBzJX/8SZOEzabowkUP6LHVj30wRFK5M+
 VPwiipu+93A9Nyrsom7/xazqVg==
X-Google-Smtp-Source: AMrXdXsYbraKms7d7huMphXIjdPxOJ+jhXsUai6lrUg4mOYNSHYWkOPmwxMtuKhVarLvW+ePpve62g==
X-Received: by 2002:ac2:538f:0:b0:4d2:c74:bf67 with SMTP id
 g15-20020ac2538f000000b004d20c74bf67mr57735lfh.45.1673600153897; 
 Fri, 13 Jan 2023 00:55:53 -0800 (PST)
Received: from smtpclient.apple ([2a01:799:e9d:c201:b4d2:20bd:fca8:ef4f])
 by smtp.gmail.com with ESMTPSA id
 s4-20020a056512214400b004cc5f44747dsm3755610lfr.220.2023.01.13.00.55.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Jan 2023 00:55:53 -0800 (PST)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Bjarne Nilsson <bjarne-priv@holmedal.net>
Mime-Version: 1.0 (1.0)
Subject: Re: Wireguard Handshake failures
Date: Fri, 13 Jan 2023 09:55:42 +0100
Message-Id: <4AD2C855-5228-425A-8EC6-B4E76D9FF95D@holmedal.net>
References: <CAFVpa6c6SfxuvYydyazutBuCYWMf19q+YvDBfrKJ0ugRjMkRTg@mail.gmail.com>
Cc: wireguard@lists.zx2c4.com
In-Reply-To: <CAFVpa6c6SfxuvYydyazutBuCYWMf19q+YvDBfrKJ0ugRjMkRTg@mail.gmail.com>
To: Venkatakrishna S <venkata@instasafe.com>
X-Mailer: iPad Mail (20C65)
X-Mailman-Approved-At: Tue, 17 Jan 2023 18:58:10 +0000
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

Hello
The server needs a peer section for the client, listing the clients public k=
ey and the addresses the cliets is alowed to use ( on its interface). Hope t=
his helps

> On 12 Jan 2023, at 01:40, Venkatakrishna S <venkata@instasafe.com> wrote:
>=20
> =EF=BB=BFI came across a weird problem when I connect and disconnect
> continuously. The handshakes are failing and the wireguard(server) is
> generating and destroying key pairs continuously for the client. I
> have added the wireguard logs ,client and server configuration below.
> Checked the iptable input rules for the client , those are correct.
> But the wireguard traffic is blocked. Tried with persistent-keepalive
> enabled and disabled. The same conf below works if I do not connect
> and disconnect continuously within a short span of time. It starts
> working after I stop the wireguard on my client and remove the peer on
> the server. Need help as I'm unable to figure out the root cause.
> Thanks in advance!
>=20
> Server conf :
> # interface_server start Created by wrapper @ 2022-12-28
> 17:02:22.645524175 +0000 UTC
> [Interface]
> Address =3D 10.0.0.48/26
> ListenPort =3D 443
> PrivateKey =3D <privateKey>
> PostUp =3D sysctl -w net.ipv4.ip_forward=3D1; iptables -t nat -A
> POSTROUTING -o eth0 -j MASQUERADE;
> PostDown =3D iptables -t nat -D POSTROUTING -o eth0 -j MASQUERADE;
> SaveConfig =3D false
> # interface_server end
>=20
>=20
> Client conf :
>=20
> PrivateKey =3D <privatekey>
> Address =3D 10.0.0.41/32
> DNS =3D 8.8.8.8, 8.8.4.4
> [Peer]
> PublicKey =3D <public key>
> AllowedIPs =3D <ip1>, <ip2>  , <ip3> ,   8.8.8.8/32, 8.8.4.4/32
> Endpoint =3D endpointip:443
>=20
>=20
> Server Wireguard logs :
>=20
> [Wed Jan 11 11:42:21 2023] wireguard: wg0: Sending handshake response
> to peer 247 (ip:port)
> [Wed Jan 11 11:42:21 2023] wireguard: wg0: Keypair 12666 destroyed for pee=
r 247
> [Wed Jan 11 11:42:21 2023] wireguard: wg0: Keypair 12667 created for peer 2=
47
> [Wed Jan 11 11:42:26 2023] wireguard: wg0: Receiving handshake
> initiation from peer 247 (ip:port)
> [Wed Jan 11 11:42:26 2023] wireguard: wg0: Sending handshake response
> to peer 247 (ip:port)
> [Wed Jan 11 11:42:26 2023] wireguard: wg0: Keypair 12667 destroyed for pee=
r 247
> [Wed Jan 11 11:42:26 2023] wireguard: wg0: Keypair 12668 created for peer 2=
47
> [Wed Jan 11 11:42:31 2023] wireguard: wg0: Receiving handshake
> initiation from peer 247 (ip:port)
> [Wed Jan 11 11:42:31 2023] wireguard: wg0: Sending handshake response
> to peer 247 (ip:port)
> [Wed Jan 11 11:42:31 2023] wireguard: wg0: Keypair 12668 destroyed for pee=
r 247
> [Wed Jan 11 11:42:31 2023] wireguard: wg0: Keypair 12669 created for peer 2=
47
> [Wed Jan 11 11:42:36 2023] wireguard: wg0: Receiving handshake
> initiation from peer 247 (ip:port)
> [Wed Jan 11 11:42:36 2023] wireguard: wg0: Sending handshake response
> to peer 247 (ip:port)
> [Wed Jan 11 11:42:36 2023] wireguard: wg0: Keypair 12669 destroyed for pee=
r 247
> [Wed Jan 11 11:42:36 2023] wireguard: wg0: Keypair 12670 created for peer 2=
47
> [Wed Jan 11 11:42:41 2023] wireguard: wg0: Receiving handshake
> initiation from peer 247 (ip:port)
> [Wed Jan 11 11:42:41 2023] wireguard: wg0: Sending handshake response
> to peer 247 (ip:port)
> [Wed Jan 11 11:42:41 2023] wireguard: wg0: Keypair 12670 destroyed for pee=
r 247
> [Wed Jan 11 11:42:41 2023] wireguard: wg0: Keypair 12671 created for peer 2=
47
> [Wed Jan 11 11:42:46 2023] wireguard: wg0: Receiving handshake
> initiation from peer 247 (ip:port)
> [Wed Jan 11 11:42:46 2023] wireguard: wg0: Sending handshake response
> to peer 247 (ip:port)
> [Wed Jan 11 11:42:46 2023] wireguard: wg0: Keypair 12671 destroyed for pee=
r 247
> [Wed Jan 11 11:42:46 2023] wireguard: wg0: Keypair 12672 created for peer 2=
47
> [Wed Jan 11 11:42:51 2023] wireguard: wg0: Receiving handshake
> initiation from peer 247 (ip:port)
> [Wed Jan 11 11:42:51 2023] wireguard: wg0: Sending handshake response
> to peer 247 (ip:port)
> [Wed Jan 11 11:42:51 2023] wireguard: wg0: Keypair 12672 destroyed for pee=
r 247
> [Wed Jan 11 11:42:51 2023] wireguard: wg0: Keypair 12673 created for peer 2=
47
>=20
>=20
> Client Logs :
>=20
> 2023-01-11 17:10:28.493: [TUN] [ZTNATunnelService] Sending handshake
> initiation to peer 7 (endpoint:port)
> 2023-01-11 17:10:33.601: [TUN] [ZTNATunnelService] Handshake for peer
> 7 (endpoint:port) did not complete after 5 seconds, retrying (try 2)
> 2023-01-11 17:10:33.601: [TUN] [ZTNATunnelService] Sending handshake
> initiation to peer 7 (endpoint:port)
> 2023-01-11 17:10:38.616: [TUN] [ZTNATunnelService] Handshake for peer
> 7 (endpoint:port) did not complete after 5 seconds, retrying (try 2)
> 2023-01-11 17:10:38.616: [TUN] [ZTNATunnelService] Sending handshake
> initiation to peer 7 (endpoint:port)
> 2023-01-11 17:10:43.637: [TUN] [ZTNATunnelService] Handshake for peer
> 7 (endpoint:port) did not complete after 5 seconds, retrying (try 2)
> 2023-01-11 17:10:43.637: [TUN] [ZTNATunnelService] Sending handshake
> initiation to peer 7 (endpoint:port)
> 2023-01-11 17:10:48.699: [TUN] [ZTNATunnelService] Handshake for peer
> 7 (endpoint:port) did not complete after 5 seconds, retrying (try 2)
> 2023-01-11 17:10:48.699: [TUN] [ZTNATunnelService] Sending handshake
> initiation to peer 7 (endpoint:port)
> 2023-01-11 17:10:53.781: [TUN] [ZTNATunnelService] Handshake for peer
> 7 (endpoint:port) did not complete after 5 seconds, retrying (try 2)
> 2023-01-11 17:10:53.781: [TUN] [ZTNATunnelService] Sending handshake
> initiation to peer 7 (endpoint:port)
> 2023-01-11 17:10:58.835: [TUN] [ZTNATunnelService] Handshake for peer
> 7 (endpoint:port) did not complete after 5 seconds, retrying (try 2)
> 2023-01-11 17:10:58.835: [TUN] [ZTNATunnelService] Sending handshake
> initiation to peer 7 (endpoint:port)
> 2023-01-11 17:11:03.922: [TUN] [ZTNATunnelService] Handshake for peer
> 7 (endpoint:port) did not complete after 5 seconds, retrying (try 2)
> 2023-01-11 17:11:03.922: [TUN] [ZTNATunnelService] Sending handshake
> initiation to peer 7 (endpoint:port)
> 2023-01-11 17:11:08.968: [TUN] [ZTNATunnelService] Handshake for peer
> 7 (endpoint:port) did not complete after 5 seconds, retrying (try 2)
> 2023-01-11 17:11:08.968: [TUN] [ZTNATunnelService] Sending handshake
> initiation to peer 7 (endpoint:port)
> 2023-01-11 17:11:14.079: [TUN] [ZTNATunnelService] Handshake for peer
> 7 (endpoint:port) did not complete after 5 seconds, retrying (try 2)
> 2023-01-11 17:11:14.079: [TUN] [ZTNATunnelService] Sending handshake
> initiation to peer 7 (endpoint:port)
> 2023-01-11 17:11:19.183: [TUN] [ZTNATunnelService] Handshake for peer
> 7 (endpoint:port) did not complete after 5 seconds, retrying (try 2)
> 2023-01-11 17:11:19.183: [TUN] [ZTNATunnelService] Sending handshake
> initiation to peer 7 (endpoint:port)
> 2023-01-11 17:11:24.196: [TUN] [ZTNATunnelService] Handshake for peer
> 7 (endpoint:port) did not complete after 5 seconds, retrying (try 2)
> 2023-01-11 17:11:24.196: [TUN] [ZTNATunnelService] Sending handshake
> initiation to peer 7 (endpoint:port)
> 2023-01-11 17:11:29.345: [TUN] [ZTNATunnelService] Handshake for peer
> 7 (endpoint:port) did not complete after 5 seconds, retrying (try 2)
> 2023-01-11 17:11:29.345: [TUN] [ZTNATunnelService] Sending handshake
> initiation to peer 7 (endpoint:port)
> 2023-01-11 17:11:34.360: [TUN] [ZTNATunnelService] Sending handshake
> initiation to peer 7 (endpoint:port)
> 2023-01-11 17:11:39.376: [TUN] [ZTNATunnelService] Handshake for peer
> 7 (endpoint:port) did not complete after 5 seconds, retrying (try 2)
> 2023-01-11 17:11:39.376: [TUN] [ZTNATunnelService] Sending handshake
> initiation to peer 7 (endpoint:port)
> 2023-01-11 17:11:44.537: [TUN] [ZTNATunnelService] Handshake for peer
> 7 (endpoint:port) did not complete after 5 seconds, retrying (try 2)
> 2023-01-11 17:11:44.537: [TUN] [ZTNATunnelService] Sending handshake
> initiation to peer 7 (endpoint:port)
