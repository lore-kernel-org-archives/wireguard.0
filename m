Return-Path: <SRS0=EmC4=DQ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26860C433DF
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  9 Oct 2020 12:18:58 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3F5172184D
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  9 Oct 2020 12:18:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3F5172184D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=ovpn.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e9922faa;
	Fri, 9 Oct 2020 11:46:03 +0000 (UTC)
Received: from smtpout-38.fbg1.glesys.net (smtpout-38.fbg1.glesys.net
 [2a02:751:100:1::38])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id fb3539f1
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 9 Oct 2020 11:46:01 +0000 (UTC)
Received: from MacBook-Pro.lan.mail (c80-217-156-23.bredband.comhem.se
 [80.217.156.23])
 by mail-halon-01.fbg1.glesys.net (Halon) with ESMTPSA
 id 9766a2e6-0a29-11eb-add5-0bec97ae8c39;
 Fri, 09 Oct 2020 14:18:51 +0200 (CEST)
Date: Fri, 9 Oct 2020 14:18:46 +0200
From: David Wibergh <david@ovpn.com>
To: wireguard@lists.zx2c4.com
Message-ID: <etPan.5f80552b.45639067.8db@ovpn.com>
Subject: Samsung Galaxy S10e =?utf-8?Q?can=E2=80=99t_?=reach local
 devices in network
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
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

Hi everyone,

Sorry for bothering you, but we do have an Android specific question. Whe=
n using the official WireGuard app on Android (v1.0.20200927), as well as=
 our own, on certain device types we have issues reaching local devices i=
n the network, even if we exclude private IPs. It works entirely fine on =
other device models though. I have tried on several different wireless ne=
tworks & different subnets (192.168.0.1/24, 192.168.0.1/16, 10.220.0.1/16=
), as well as reaching various devices.

So far, we have had issues on OnePlus HD1903 & Samsung Galaxy S10e (model=
 number SM-G970=46).


Network
I have three devices in the wireless network (10.220.1.1/16).

1. Samsung Galaxy S10e (10.220.0.2)
2. Macbook (10.220.0.1)
3. Lenovo thinkpad (10.220.1.7)

On the S10e, I can not ping 10.220.0.1 nor 10.220.1.7 when connected.

On the Macbook, I can ping 10.220.1.7 when connected.


Configurations

Macbook uses following config:

=5BInterface=5D
PrivateKey =3D XXX
Address =3D 172.20.196.X/32, fd00:0:1337:cafe:1111:1111:X:1a60/128
DNS =3D 46.227.67.134, 192.165.9.158

=5BPeer=5D
PublicKey =3D 0CvxLBss+WQyJqidXRUnd5iO9gMJwM=46NPidg09d4Onk=3D
AllowedIPs =3D ::/0, 0.0.0.0/5, 8.0.0.0/7, 11.0.0.0/8, 12.0.0.0/6, 16.0.0=
.0/4, 32.0.0.0/3, 64.0.0.0/2, 128.0.0.0/3, 160.0.0.0/5, 168.0.0.0/6, 172.=
0.0.0/12, 172.32.0.0/11, 172.64.0.0/10, 172.128.0.0/9, 173.0.0.0/8, 174.0=
.0.0/7, 176.0.0.0/4, 192.0.0.0/9, 192.128.0.0/11, 192.160.0.0/13, 192.169=
.0.0/16, 192.170.0.0/15, 192.172.0.0/14, 192.176.0.0/12, 192.192.0.0/10, =
193.0.0.0/8, 194.0.0.0/7, 196.0.0.0/6, 200.0.0.0/5, 208.0.0.0/4, 46.227.6=
7.134/32, 192.165.9.158/32
Endpoint =3D vpn90.prd.erfurt.ovpn.com:9929


Samsung Galaxy S10e uses the following config:

=5BInterface=5D
Address =3D X/32, fd00:0:1337:cafe:1111:1111:e827:X/128
DNS =3D 46.227.67.134, 192.165.9.158
PrivateKey =3D XXX

=5BPeer=5D
AllowedIPs =3D 0.0.0.0/5, 8.0.0.0/7, 11.0.0.0/8, 12.0.0.0/6, 16.0.0.0/4, =
32.0.0.0/3, 64.0.0.0/2, 128.0.0.0/3, 160.0.0.0/5, 168.0.0.0/6, 172.0.0.0/=
12, 172.32.0.0/11, 172.64.0.0/10, 172.128.0.0/9, 173.0.0.0/8, 174.0.0.0/7=
, 176.0.0.0/4, 192.0.0.0/9, 192.128.0.0/11, 192.160.0.0/13, 192.169.0.0/1=
6, 192.170.0.0/15, 192.172.0.0/14, 192.176.0.0/12, 192.192.0.0/10, 193.0.=
0.0/8, 194.0.0.0/7, 196.0.0.0/6, 200.0.0.0/5, 208.0.0.0/4, ::/0, 46.227.6=
7.134/32, 192.165.9.158/32
Endpoint =3D vpn11.prd.kista.ovpn.com:9929
PublicKey =3D p4s2Su=46gKgWnV56Uh3yCx6ZWnaVy=46XegV9=46Qqv670So=3D


Is this an issue you=E2=80=99re aware of=3F Is there anything else needed=
 from me=3F

Thanks,
David Wibergh


