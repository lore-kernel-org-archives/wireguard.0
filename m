Return-Path: <SRS0=EmC4=DQ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE804C433DF
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  9 Oct 2020 14:52:38 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A655322260
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  9 Oct 2020 14:52:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A655322260
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=ovpn.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b61b6f65;
	Fri, 9 Oct 2020 14:19:42 +0000 (UTC)
Received: from smtpout-38.fbg1.glesys.net (smtpout-38.fbg1.glesys.net
 [2a02:751:100:1::38])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id c8e1a1a2
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 9 Oct 2020 14:19:41 +0000 (UTC)
Received: from MacBook-Pro.local.mail (217-64-148-128.pool.ovpn.com
 [217.64.148.128])
 by mail-halon-01.fbg1.glesys.net (Halon) with ESMTPSA
 id 0d6e5bac-0a3f-11eb-add5-0bec97ae8c39;
 Fri, 09 Oct 2020 16:52:31 +0200 (CEST)
Date: Fri, 9 Oct 2020 16:52:23 +0200
From: David Wibergh <david@ovpn.com>
To: "Jason A. Donenfeld" <jason@zx2c4.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Message-ID: <etPan.5f80792c.2de5c3e3.107c@ovpn.com>
In-Reply-To: <CAHmME9riJ2Mi6FEw5+kftUFqBOmm+i7dZH-jrwPOg-hZ1VQ0PA@mail.gmail.com>
References: <etPan.5f80552b.45639067.8db@ovpn.com>
 <CAHmME9rTGWNuS=AOj_jUnC7QvWW1od5jmJcvLurA-oukFiwf=g@mail.gmail.com>
 <etPan.5f806950.26ad9721.107c@ovpn.com>
 <CAHmME9riJ2Mi6FEw5+kftUFqBOmm+i7dZH-jrwPOg-hZ1VQ0PA@mail.gmail.com>
Subject: Re: Samsung Galaxy S10e =?utf-8?Q?can=E2=80=99t_?=reach local
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

The command output is the same:


Sony

=24 ip route get 10.220.0.4
10.220.0.4 dev wlan0 table 1026 src 10.220.0.6 uid 10356
=C2=A0 =C2=A0 cache


Galaxy S10e

=24 ip route get 10.220.0.4
10.220.0.4 dev wlan0 table 1017 src 10.220.0.5 uid 10294
=C2=A0 =C2=A0 cache


We=E2=80=99ll try to get some of our users to run similar tests. We do ha=
ve an S7 that we can dig up and do some testing on. If you want to go dow=
n the rabbit hole, but don=E2=80=99t have access to a galaxy device, I co=
uld ship the S10e to you.

Thanks,
David


P=C3=A5 9 oktober 2020 kl. 16:03:02, Jason A. Donenfeld (jason=40zx2c4.co=
m) skrev:
> Hmm, from that command output, I'm still not quite sure. The most
> significant difference I can see from casual inspection is:
> =20
> Sony:
> 19000: from all fwmark 0xcd/0x1ffff iif lo lookup 1026
> 21000: from all fwmark 0xce/0x1ffff lookup 1026
> =20
> Galaxy:
> 19000: from all fwmark 0x2ad/0x1ffff iif lo lookup 1017
> 21000: from all fwmark 0x2ab/0xffff lookup 1017
> =20
> Is the galaxy missing a leading 0x1 in the mask of that second rule the=
re=3F
> =20
> What do you get on each when you run =60ip route get 10.220.0.4=60=3F S=
ame
> thing or is it different=3F
> =20
> I also noticed that on the Galaxy, there's a direct route to some
> telco server -- =6090.132.128.59 via 10.220.0.1 dev wlan0 table 99 prot=
o
> static=60. I didn't see this direct route on the Sony. I doubt it's
> related to the above, but I've also never seen this before and wonder
> if it's some VoLTE/VoWI=46I hand-over trick in recent Android networkin=
g
> stacks.
> =20

