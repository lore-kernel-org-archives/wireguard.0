Return-Path: <SRS0=oIpX=JQ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59602C433ED
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 19 Apr 2021 18:27:04 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B164C60FE4
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 19 Apr 2021 18:27:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B164C60FE4
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=toke.dk
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 163ea6e7;
	Mon, 19 Apr 2021 18:25:50 +0000 (UTC)
Received: from mail.toke.dk (mail.toke.dk [2a0c:4d80:42:2001::664])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id a8f6e4b6
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 19 Apr 2021 18:25:48 +0000 (UTC)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=toke.dk; s=20161023;
 t=1618856747; bh=SHWiOpRsqVzp08PsAAtTAg0Cj9TVumKiqsfIRuy7X8Y=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=I2rWLl7YyZcMSDj2NC+cVKnLg4RQJNEijOMD9c0PxmzUblEamvmL8ZGLkTKksWYw4
 Bzdk2wNehsAq3x3FezahJpgp0AVjIW6XfH48rGGjgVMg7uYgBBvC61XGGrA24KIBn4
 YaZp1YTzWA9sPXVc/SdU3dXcDEWLFAe1KVeaBtwZ8tlcgB6Sfqj3c9VSkI+RTZ0T7K
 KC/64meX5syb8d8SdSqMkfbBE4Fkxi7+kvQgJ8g5iDyPs+V3yoGnjYfXSTxXCgH/+7
 iDlsccmfjM7IfMZlvkVlSjWplBQVzeWHOZUMPPieGFcyTIMvYFn9Ie7YMp9zv6SLvT
 9DNRE8VGIyDNw==
To: Stefan Haller <stefan.haller@stha.de>, "Jason A. Donenfeld"
 <Jason@zx2c4.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: FreeBSD if_wg POINTTOPOINT and MULTICAST behaviour
In-Reply-To: <87a6pyinbh.fsf@toke.dk>
References: <9afe6dc9-5c53-4c25-b09f-5b4cf6ff8046@stha.de>
 <CAHmME9rAzGauYJuq4Qpn561f1YrYTaSN1mj2HB2Kdhgd2QJs9A@mail.gmail.com>
 <87371254-15f1-494b-8740-38071d7f7d68@stha.de> <874kg8ldjn.fsf@toke.dk>
 <7be52421-db0d-4971-99b0-ce76307d1a33@stha.de>
 <CAHmME9pxnh6MFdQGQCWRX6aNJu=rM-SyVY1jLb6EurgNNhwJSg@mail.gmail.com>
 <87sg3rigdx.fsf@toke.dk>
 <CAHmME9qerb3LhuJfQ2L=J9gz=vGXV47qUAwC3-LYMTWVWnn62Q@mail.gmail.com>
 <15c3483d-546b-4c86-aca7-9ab37945791e@stha.de> <87a6pyinbh.fsf@toke.dk>
Date: Mon, 19 Apr 2021 20:25:46 +0200
X-Clacks-Overhead: GNU Terry Pratchett
Message-ID: <87fszmgmhh.fsf@toke.dk>
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

Toke H=C3=B8iland-J=C3=B8rgensen <toke@toke.dk> writes:

> Stefan Haller <stefan.haller@stha.de> writes:
>
>> Hi Jason,
>>
>> On Thu, Apr 15, 2021 at 06:05:03PM -0600, Jason A. Donenfeld wrote:
>>> I spent the day playing around with bird and babel and sorted out
>>> FreeBSD's v6 situation. Basically, ff00::/8 addresses are treated
>>> differently, and they're blocked unless the interface sets
>>> IFF_MULTICAST. So I've committed
>>> https://git.zx2c4.com/wireguard-freebsd/commit/?id=3Da7a84a17faf784857f=
076e37aa4818f6b6c12a95
>>> to do this.
>>
>> That is also what I observed. Without IFF_MULTICAST I see the following
>> error in bird's log:
>>
>> bird[8045]: babel1: Socket error: IPV6_MULTICAST_IF: Can't assign reques=
ted address
>> bird[8045]: babel1: Cannot open socket for wg1
>>
>>> Stefan - please let me know if those work for you. In my testing thus
>>> far, things seem to work for me.
>>
>> After applying Toke's patch for bird and your Wireguard patch in
>> a7a84a17faf784 everything is working as before (with minor config
>> changes).
>>
>> Just for the record, my previous configuration looked like this (using
>> POINTTOPOINT interfaces, I use ifconfig to set the peer address):
>>
>>> [Interface]
>>> ...
>>> Address =3D fe80::5/64
>>> PostUp =3D ifconfig %i inet 169.254.42.5/32 169.254.42.2
>>
>> My new configuration without POINTTOPOINT, but only a single peer
>> directly attached to other side of the wg tunnel:
>>
>>> [Interface]
>>> ...
>>> Address =3D 169.254.42.5/32, fe80::5/64
>>> PostUp =3D route add 169.254.42.2 -iface %i
>>
>> So for me everything works as expected again. A big thanks to all of you=
 for
>> figuring out what was going wrong and getting it fixed so quickly.
>
> Great! You're welcome :)

Stefan, any chance you could test this patch to Bird (*instead of* the
previous one that removes the check from the Babel code)?

-Toke

diff --git a/sysdep/bsd/krt-sock.c b/sysdep/bsd/krt-sock.c
index c2faa23dd44f..cd89544063c7 100644
--- a/sysdep/bsd/krt-sock.c
+++ b/sysdep/bsd/krt-sock.c
@@ -665,6 +665,9 @@ krt_read_ifinfo(struct ks_msg *msg, int scan)
   else
     f.flags |=3D IF_MULTIACCESS;      /* NBMA */
=20
+  if (fl & IFF_MULTICAST)
+    f.flags |=3D IF_MULTICAST;
+
   iface =3D if_update(&f);
=20
   if (!scan)
