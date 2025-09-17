Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C88ECF34C2
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 19 Nov 2025 14:47:50 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e26f1b5b;
	Tue, 18 Nov 2025 17:32:21 +0000 (UTC)
Received: from mail1.fiberby.net (mail1.fiberby.net [193.104.135.124])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 0406ecab
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 17 Sep 2025 11:52:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fiberby.net;
 s=202008; t=1758109961;
 bh=l8P6VVsXBU38WfjdWgZ0TeaKIxF9oSBoHAXutncct44=;
 h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
 b=fEjfsLAhripGLJL0TJTLwBJDhbRCWdGFbHexy7CEmiK6TqC8UXCzV7TvXoT69QiOL
 wAz3Eefbyv7RavbL837tWA/UXoBSDTG8MVSG+ravzS86rYjoV9difpkFNg1jn03rUO
 M+OIKskjaAEZCbpQbHwHfVbu+f/wu13v82+40j/Czss3GdTR5PRb4kYcd8Fq28a40z
 wYo/FHrdJn+kShx0To4hB1Q02fAiG/nkgLSL2rR4vpHWUSVDeeTixBakEd+VswVNlp
 SycmVV6ZsC3v2gCKxkQvu1igIdNgx4ALAT/JSl0Acw+mYW4jha0c8+PDH/UIzPo+FB
 bBRVNTNT6t9Tg==
Received: from x201s (193-104-135-243.ip4.fiberby.net [193.104.135.243])
 by mail1.fiberby.net (Postfix) with ESMTPSA id DF60460132;
 Wed, 17 Sep 2025 11:52:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by x201s (Postfix) with ESMTP id 1EA39201672;
 Wed, 17 Sep 2025 11:52:32 +0000 (UTC)
Message-ID: <de8ecfb8-ca4d-4397-9d70-4fe789e706f5@fiberby.net>
Date: Wed, 17 Sep 2025 11:52:31 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: =?UTF-8?Q?Asbj=C3=B8rn_Sloth_T=C3=B8nnesen?= <ast@fiberby.net>
Subject: Re: [RFC net-next 00/14] wireguard: netlink: ynl conversion
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Donald Hunter <donald.hunter@gmail.com>,
 Simon Horman <horms@kernel.org>, Jacob Keller <jacob.e.keller@intel.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, wireguard@lists.zx2c4.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250904-wg-ynl-rfc@fiberby.net>
 <CAHmME9ra4_P0-FdVV75gaAWiW8yWsUJJsmTes_kac0EdTgnjHQ@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CAHmME9ra4_P0-FdVV75gaAWiW8yWsUJJsmTes_kac0EdTgnjHQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 18 Nov 2025 17:23:15 +0000
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

On 9/16/25 3:51 PM, Jason A. Donenfeld wrote:
> On Fri, Sep 5, 2025 at 12:03 AM Asbjørn Sloth Tønnesen <ast@fiberby.net> wrote:
>>
>> This series contains the wireguard changes needed to adopt
>> an YNL-based generated netlink code.
>>
>> This RFC series is posted for reference, as it is referenced
>> from the current v1 series of ynl preparations, which has to
>> go in before this series can be submitted for net-next.
> 
> I'm not actually convinced this makes anything better. It seems like
> the code becomes more complicated and less obvious. What is the
> benefit here? As is, I really don't like this direction.

By adding an YNL spec, we lower the barrier for implementing and
using the protocol especially from non-C languages.

The specs are currently used for:
- Documentation generation [1].
- Optional UAPI header generation.
- Optional kernel netlink code generation.
- In-tree user-space clients:
   - Auto-generated C library code.
   - Optional sample program using above C library.
   - Python client - ./tools/net/ynl/pyynl/cli.py.

The generated kernel code is still committed in git,
and is thus protected from accidental changes.

When we can generate the UAPI from the spec., with only cosmetic
differences it proves that the spec is correct. Same goes for generating
the netlink policy generation.

I have split up adopting the generated UAPI and netlink code, over many
patches mostly to keep the diff readable, as the code moves would
otherwise become interlaced.

Including a sample program, makes it trivial to exercise the generated
C library.

This RFC is a bit more complicated, than v1 will be, as it includes an
alternative implementation for patch 4 in patch 12, I had hoped those
patches would have generated some comments. Right now it looks like,
they will both be squashed into patch 3 in v1.

I can also split this series up further, if you would prefer that.

[1] https://docs.kernel.org/networking/netlink_spec/
