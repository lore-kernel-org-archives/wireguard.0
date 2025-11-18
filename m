Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06C22CF6482
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 19 Nov 2025 21:54:39 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7b51a498;
	Tue, 18 Nov 2025 17:33:45 +0000 (UTC)
Received: from mail1.fiberby.net (mail1.fiberby.net [193.104.135.124])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 09b6ac40
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 18 Nov 2025 17:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fiberby.net;
 s=202008; t=1763486205;
 bh=HhJcusgK4gBGdJeJoNSwYRT1qkaAQlNrgbmsRu5oSFs=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=KI5buituNFxmPC1Ezzluw4+/nkc/uuapbnCZVH3CP3sYH0GDSpuiUUDDagz1lr3s3
 4tA7yx2+KtPXaVRtJmup/psjBjRI3wlAFp11m+dldHlfJYLpU9YQVSTDWZruJEuLQ+
 AcWrSI7+tb3VRte7/WSuJ01dC5EQGbc7M3Byzdmpq5Ejz1IxSpNPhPQvxyPhh+sCH5
 CP8HphNNflhH62kP7i7jd+8JhiyPgBEsgUqD22/wA6owtOHUgHaIvcZnp9ggdylxXE
 h9KLd3LeaCs3cyRaCsry3miMNMaGIlqUnWb0qtJdDu/+ethufv+uesjBCkQMLr6ycH
 v2wEOP6kBs8zw==
Received: from x201s (193-104-135-243.ip4.fiberby.net [193.104.135.243])
 by mail1.fiberby.net (Postfix) with ESMTPSA id BD11A600FC;
 Tue, 18 Nov 2025 17:16:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by x201s (Postfix) with ESMTP id 591372017A4;
 Tue, 18 Nov 2025 17:16:12 +0000 (UTC)
Message-ID: <29155dac-97c4-4213-8db5-194d9109050e@fiberby.net>
Date: Tue, 18 Nov 2025 17:16:12 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v3 08/11] tools: ynl: add sample for wireguard
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Donald Hunter <donald.hunter@gmail.com>,
 Simon Horman <horms@kernel.org>, Jacob Keller <jacob.e.keller@intel.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, wireguard@lists.zx2c4.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jordan Rife <jordan@jrife.io>
References: <20251105183223.89913-1-ast@fiberby.net>
 <20251105183223.89913-9-ast@fiberby.net> <aRyO2mvToYf4yuwY@zx2c4.com>
Content-Language: en-US
From: =?UTF-8?Q?Asbj=C3=B8rn_Sloth_T=C3=B8nnesen?= <ast@fiberby.net>
In-Reply-To: <aRyO2mvToYf4yuwY@zx2c4.com>
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

On 11/18/25 3:20 PM, Jason A. Donenfeld wrote:
> On Wed, Nov 05, 2025 at 06:32:17PM +0000, Asbjørn Sloth Tønnesen wrote:
>> +CFLAGS_wireguard:=$(call get_hdr_inc,_LINUX_WIREGUARD_H,wireguard.h) \
>> +	-D _WG_UAPI_WIREGUARD_H # alternate pre-YNL guard
> 
> I don't totally grok what's going on here. As I understand it, this
> makefile creates `wireguard-user.h` in the generated/ include path,
> which has all the various netlink wrapper declarations. And then this
> also references, somehow, include/uapi/linux/wireguard.h, for the constants.
> For some reason, you're then defining _WG_UAPI_WIREGUARD_H here, so that
> wireguard.h from /usr/include doesn't clash. But also, why would it?
> Isn't this just a matter of placing $(src)/include/uapi earlier in the
> include file path?

The aim is to use the generated in-tree header, while avoiding making a
copy, and avoiding the system header.

As an example then in tools/net/ynl/generated/Makefile:

%-user.o: %-user.c %-user.h
         @echo -e "\tCC $@"
         @$(COMPILE.c) $(CFLAGS_$*) -o $@ $<

Where for the "wireguard-user.o" target, then "$(CFLAGS_$*)" expands to
"$CFLAGS_wireguard".

CFLAGS_wireguard has two parts the normal one similar to the other families,
and a transitional extra guard.

The header guard in the old UAPI header is "_WG_UAPI_WIREGUARD_H".
The header guard in the new UAPI header in-tree is "_UAPI_LINUX_WIREGUARD_H".
The header guard in the new UAPI header in-system is "_LINUX_WIREGUARD_H".

Linux uapi headers are installed using scripts/headers_install.sh, which
transforms the headers slightly, one of these transformations is to alter
the header guard, stripping the _UAPI in the beginning of the guard.

So "get_hdr_inc=-D$(1) -include $(UAPI_PATH)/linux/$(2)" does:
1) Defines the in-system guard
2) Includes the in-tree header

The purpose of defining the in-system guard is disable the include in
the code, as it's header guard is already defined.

I added the extra transitional define of the old UAPI guard, so that
it also works on systems with the old header installed in /usr.
This extra line can be removed in a few releases, when we don't care
about compiling these tools on a system with the old header installed.
