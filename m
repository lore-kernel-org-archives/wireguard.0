Return-Path: <SRS0=Ms3O=GR=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6E56C433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 14 Jan 2021 10:47:16 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 38A8C23A3B
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 14 Jan 2021 10:47:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 38A8C23A3B
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=toke.dk
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4b217203;
	Thu, 14 Jan 2021 10:44:47 +0000 (UTC)
Received: from mail.toke.dk (mail.toke.dk [45.145.95.4])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id d2e17e38
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 14 Jan 2021 10:44:46 +0000 (UTC)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=toke.dk; s=20161023;
 t=1610621085; bh=BaQgqz+3+txI4gmm4JRTK98udlspyEdiyfRVZcSvDag=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=btyYLb2dZWKddQJYL/NDQGdeDl6QvKLx7mxsydAHUkgy8mLpznEOhNYzJ146LEAsS
 v1DUVrq3zsPbis2XIXL9mDnpxEIYAQBKu8pqQKiv5AgGdNk+7zCwRAtuY2TgPMhF/y
 nMYhUYXbjaoeLPhBohjjC5lAKXSMi+cwgpZEq+MOd7PDnSBe0hVMGbaVRQG04KKoqQ
 yqU+BqgbyAInFeipjLIgdrR50wsdY2523qNK5uAqocfQHduQuyKaUc4ktr4k8qNz7A
 rdwzjtQlJSxI3YjXBk5Kz/rqQiTUxbqm6IYH+0y+lEQxgVQb4S8Dr5ZrTdWngqTXvZ
 OmqqV25x+MT5Q==
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Julian Orth <ju.orth@gmail.com>, WireGuard mailing list
 <wireguard@lists.zx2c4.com>
Subject: Re: network namespace wireguard routing [Was: Re: Userspace
 Networking Stack + WireGuard + Go]
In-Reply-To: <CAHmME9rMJ2R3X0iUdYZhGfL6+J0xRyrnvmBws-6T4itP0tZFmA@mail.gmail.com>
References: <X/8aDfdkod+rCPqK@zx2c4.com>
 <33997a3d-591e-9aa3-92fe-a06a4d3c5b26@gmail.com>
 <CAHmME9rbUbEZah0MDtdRXhUxMtOSrcdo4BCN1LY-iDtXUWHy5Q@mail.gmail.com>
 <87v9c09450.fsf@toke.dk>
 <CAHmME9rMJ2R3X0iUdYZhGfL6+J0xRyrnvmBws-6T4itP0tZFmA@mail.gmail.com>
Date: Thu, 14 Jan 2021 11:44:45 +0100
X-Clacks-Overhead: GNU Terry Pratchett
Message-ID: <87mtxbsspu.fsf@toke.dk>
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

"Jason A. Donenfeld" <Jason@zx2c4.com> writes:

> On Wed, Jan 13, 2021 at 5:46 PM Toke H=C3=B8iland-J=C3=B8rgensen <toke@to=
ke.dk> wrote:
>> 5. also requires CAP_SYS_ADMIN (and I think by extension, so does 3.,
>> and 4.). From 'man setns':
>>
>>        Network, IPC, time, and UTS namespaces
>>               In order to reassociate itself with a new network, IPC,
>>               time, or UTS namespace, the caller must have the
>>               CAP_SYS_ADMIN capability both in its own user namespace
>>               and in the user namespace that owns the target namespace.
>
> For this, you just create a new user namespace first. You can try it
> yourself from the command line:
>
> zx2c4@thinkpad ~ $ unshare -n
> unshare: unshare failed: Operation not permitted
> zx2c4@thinkpad ~ $ unshare -Un
> nobody@thinkpad ~ $ ip a
> 1: lo: <LOOPBACK> mtu 65536 qdisc noop state DOWN group default qlen 1000
>     link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00

Ah, right, of course, silly me :)

-Toke
