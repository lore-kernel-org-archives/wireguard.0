Return-Path: <SRS0=3w+q=AJ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C23CC433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 28 Jun 2020 15:20:52 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 07F7A20708
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 28 Jun 2020 15:20:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 07F7A20708
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pallas.us
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 26940b87;
	Sun, 28 Jun 2020 15:01:06 +0000 (UTC)
Received: from telperion.info (telperion.info [66.160.141.240])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 3cc6014f
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 28 Jun 2020 15:01:04 +0000 (UTC)
Received: from [192.168.127.224] (184-23-8-77.dsl.static.fusionbroadband.com
 [::ffff:184.23.8.77]) (AUTH: LOGIN pallas, )
 by telperion.info with ESMTPSA
 id 0000000000048461.000000005EF8B62B.00000954; Sun, 28 Jun 2020 08:24:24 -0700
From: Derrick Lyndon Pallas <derrick@pallas.us>
Subject: Re: Standardized IPv6 ULA from PublicKey
To: Arti Zirk <arti.zirk@gmail.com>,
 Reid Rankin <reidrankin@gmail.com>, ch@ntrv.dk
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
References: <372AE79B-69E5-4B18-926C-E402FDFB2E95@lonnie.abelbeck.com>
 <20171205035352.01ffe1f5@vega.skynet.aixah.de>
 <CAHmME9ouUNV4pc7qwr4bO-5bEecFc1U64PF13ExgmYnH9q45tw@mail.gmail.com>
 <20200624153706.3yngzzslepqh7q54@ws.flokli.de>
 <CA+cYV6uWUC1YDbpXz+ft-fKug7SY4_QNrR-x7q_z_qWmj7u-Ww@mail.gmail.com>
 <CAMaqUZ0nTL9mbYEifHP-sc8kQ6ehAOOWfmEb7ARNfZWWDkv4eA@mail.gmail.com>
 <0675d275c3b540e0bc9553e85ab00a833f1f7e44.camel@gmail.com>
Message-ID: <4a5e13c9-0c39-97f3-1a46-88deddf0dc14@pallas.us>
Date: Sun, 28 Jun 2020 08:19:01 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <0675d275c3b540e0bc9553e85ab00a833f1f7e44.camel@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
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

I've been using something similar for ORCHIDv2-ish addressing, q.v. [1].

from base64 import b64decode
from hashlib import shake_128
from ipaddress import IPv6Network

public_key = b64decode(...)
secret = "somesecret".encode('utf-8')
network = IPv6Network("2001:20::/28")

hash = shake_128(secret + public_key).digest(network.max_prefixlen//8)
mask = int.from_bytes(network.hostmask.packed, byteorder='big')
host = int.from_bytes(hash, byteorder='big')
addr = network[host & mask]

The use of secret is optional but allows one to mix the addresses based 
on a shared secret. Substituting the link local range for the ORCHIDv2 
range above should produce results similar to what you're getting. One 
thing to note, it's worth checking to see if the algorithm generates the 
network or broadcast addresses and either failing or shifting. (I'm 
considering adding a +1 or -1 based on whether we hit said address to 
the above; the real code just asserts right now.)

~Derrick

[1] 
https://github.com/pallas/wgnlpy/commit/5c1f4bf876b39bad29135370e5f297e305dab840


On 6/28/20 3:15 AM, Arti Zirk wrote:

> On L, 2020-06-27 at 17:43 -0400, Reid Rankin wrote:
>> Luckily, Blake2s is a simple and elegant algorithm, and in an effort
>> to get some working code out there I've [implemented][1] it in ~100
>> lines of Bash script.
> It turns out that Python includes blake2s implementation that seems to
> work with default arguments. So it's possible to implement this IPv6
> address calculation algorithm in 7 lines.
>
> https://gist.github.com/artizirk/c91e4f8c237dec07e3ad1b286f1855a7
>
