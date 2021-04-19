Return-Path: <SRS0=oIpX=JQ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BF35C433B4
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 19 Apr 2021 21:46:27 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 90B8861354
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 19 Apr 2021 21:46:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 90B8861354
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=toke.dk
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d7f0dabc;
	Mon, 19 Apr 2021 21:46:23 +0000 (UTC)
Received: from mail.toke.dk (mail.toke.dk [2a0c:4d80:42:2001::664])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 6eb4cc57
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 19 Apr 2021 21:46:20 +0000 (UTC)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=toke.dk; s=20161023;
 t=1618868779; bh=L4qpR2VzQi4GoEyn//HGwLWyaXUfVlJBfriTELYsqi0=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=AAPUN2OD9TuXgd4Q81EWLObsDiyscKJyCA2Pc68XbSWY+tRWM0JdeufkWkqlGKf7I
 ubGnBJcDw2IDoNWrJ/ZWhy8g8VGA+raZ27Dw4Rc5iO3dOAfXRyq0OKaB20nZRPMkM4
 QUJWzZLmur59AfqMLvZGJF0eKv5l2MQg69ZvSob6yvMxntsp8TZ6XHei5+FNl8Zudi
 nyVdG8gdsUSWwFQxZtEVOWatuX8jpzqDDKiBpOI3k2a7dL6DL4OOK80l0aqAIJHavz
 S0wqzV4oXwnyL3p39q+q4XzmQpq2RmJDhjhsCRU66hL8K72YkYr/KuNKT8f1ABGRsj
 g4x4jela/mwxA==
To: Stefan Haller <stefan.haller@stha.de>, "Jason A. Donenfeld"
 <Jason@zx2c4.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: FreeBSD if_wg POINTTOPOINT and MULTICAST behaviour
In-Reply-To: <bcedf3fe-09ce-4964-85fc-b894583bd389@stha.de>
References: <874kg8ldjn.fsf@toke.dk>
 <7be52421-db0d-4971-99b0-ce76307d1a33@stha.de>
 <CAHmME9pxnh6MFdQGQCWRX6aNJu=rM-SyVY1jLb6EurgNNhwJSg@mail.gmail.com>
 <87sg3rigdx.fsf@toke.dk>
 <CAHmME9qerb3LhuJfQ2L=J9gz=vGXV47qUAwC3-LYMTWVWnn62Q@mail.gmail.com>
 <15c3483d-546b-4c86-aca7-9ab37945791e@stha.de> <87a6pyinbh.fsf@toke.dk>
 <87fszmgmhh.fsf@toke.dk> <c93d0e62-8992-4c19-a2d3-08f7af3f5873@stha.de>
 <CAHmME9rVb7vONYxfYfeccCpA3ePhfUifi_FX-=8ugBu_n0_SPg@mail.gmail.com>
 <bcedf3fe-09ce-4964-85fc-b894583bd389@stha.de>
Date: Mon, 19 Apr 2021 23:46:16 +0200
X-Clacks-Overhead: GNU Terry Pratchett
Message-ID: <871rb6gd7b.fsf@toke.dk>
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

Stefan Haller <stefan.haller@stha.de> writes:

> On Mon, Apr 19, 2021 at 01:42:58PM -0600, Jason A. Donenfeld wrote:
>> On Mon, Apr 19, 2021 at 1:42 PM Stefan Haller <stefan.haller@stha.de> wr=
ote:
>> >
>> > On Mon, Apr 19, 2021 at 08:25:46PM +0200, Toke H=C3=B8iland-J=C3=B8rge=
nsen wrote:
>> > > Stefan, any chance you could test this patch to Bird (*instead of* t=
he
>> > > previous one that removes the check from the Babel code)?
>> >
>> > The patch is working on FreeBSD 13.0.
>>=20
>> Just FYI, the previous patch was added to ports, so I wanted to double
>> check that you removed that previous patch before adding this one...
>
> Yes, I did remove the old patch (in proto/babel/babel.c):
>
>> root@fbsd:/usr/ports/net/bird2 # git status .
>> On branch main
>> Changes not staged for commit:
>>   (use "git add/rm <file>..." to update what will be committed)
>>   (use "git restore <file>..." to discard changes in working directory)
>>         deleted:    files/patch-proto_babel_babel.c
>>=20
>> Untracked files:
>>   (use "git add <file>..." to include in what will be committed)
>>         files/patch-sysdep_bsd_krt-sock.c

Awesome! Thank you for testing! :)

-Toke
