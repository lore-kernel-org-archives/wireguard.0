Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9707C433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 23 Nov 2021 23:23:14 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 02d0cc03;
	Tue, 23 Nov 2021 23:23:12 +0000 (UTC)
Received: from zeus.servers.mnus.de (zeus.servers.mnus.de [78.47.191.162])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 2b29b42c
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 23 Nov 2021 23:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mnus.de;
 s=mnus.de-helios; t=1637709790;
 bh=CoM5YhBRISg2lFgdDuCfVCujkpufW1t6lOkydJ6Fsnc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=NrK+vCEHgW+Gw8RjigRP8xSQKx8K05cmYIOu5Iimqn9mGl2rOMXmbFrSpBoStJj4H
 CaisxdnmzY+PY5bYMfyiJaG0WmE5NsR3Mhcd2jsF0DedqmaPsEzjYmaukgPphkNvIf
 rDc/EU3bzeD5mRwBG/IsuScCESxUhhCOzD+JJaos8kVw0NouXJS+0tIVhJDRwd0pvw
 uKez4PGJwSrycUmhJxu6lzU5TkaXOihf9MCU1n31qRwnBZ+ydpZvGbW8jFj8U8NE/I
 Gfh2UOXyTHN/H2m8uLGSrZM6fa4uYznWJbhVo+ScU8yU09esb3tX1bvc1mXnn0ApLu
 +uGmCt2Z10fj+JzDYCrOPFxLVeY+dezd/BmvqHDtv+5Xh31LEXFD0XZjdFrkWY3yLy
 3QPEAfZGmAuzRYkNeN8pT7OU6l3chvIJ4A4gLBrNsE4iQpsHH5/aLHifk1/cNMOx0G
 HzifsNWuNS+cCm2reiqscmQvZRU6zWgvvd3CvsQyghN6eRdUGEZVjbOwDhNvVljww1
 e2zsQZuHxDMI875Njg0hTPTJ9yxJK/M01/QJJSrZyPpYaID9XPOvCjcCFvxWf6IuqZ
 Hy4C5LnrA7MnYqwXU8jAoA3n/rz4m16ZycTNhcvmTO7/pbjH3EglakUOMYMpE501sG
 ADYbnqBT5eSiZIWIOgapPUx8=
Message-ID: <fef7daf2-adf7-e042-4977-46fda04aa07d@mnus.de>
Date: Wed, 24 Nov 2021 00:23:10 +0100
MIME-Version: 1.0
Subject: Re: [PATCH wireguard-go] conn: linux: fix incorrect endpoint address
Content-Language: en-US
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
References: <20211123190331.101346-1-minus@mnus.de>
 <CAHmME9pEf9=6C3eAXfanftBt4LJ4viRszQc5oG3Jt9H7Fxd68A@mail.gmail.com>
From: minus <minus@mnus.de>
In-Reply-To: <CAHmME9pEf9=6C3eAXfanftBt4LJ4viRszQc5oG3Jt9H7Fxd68A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 23/11/2021 22.01, Jason A. Donenfeld wrote:
> Thank you for catching this regression!You're welcome. Unfortunately, I found another one: On an old Debian 8 
system, wireguard-go does not receive or send packets anymore, nor does 
`wg show` show any sent/received stats. On a current Arch system it 
works fine. git bisect points to e3134bf (device: defer state machine 
transitions until configuration is complete) as first bad commit. I 
haven't further tried reproducing it, hoping that it's something obvious 
to you.
