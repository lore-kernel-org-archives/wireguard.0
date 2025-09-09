Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70D0ECF2591
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 19 Nov 2025 13:21:02 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0fb95455;
	Tue, 18 Nov 2025 17:32:13 +0000 (UTC)
Received: from fhigh-a3-smtp.messagingengine.com
 (fhigh-a3-smtp.messagingengine.com [103.168.172.154])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 010e987a
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 9 Sep 2025 18:10:06 +0000 (UTC)
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
 by mailfhigh.phl.internal (Postfix) with ESMTP id 7BFA21400077;
 Tue,  9 Sep 2025 14:10:05 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-01.internal (MEProxy); Tue, 09 Sep 2025 14:10:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=queasysnail.net;
 h=cc:cc:content-transfer-encoding:content-type:content-type
 :date:date:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:subject:subject:to:to; s=fm2;
 t=1757441405; x=1757527805; bh=le/lK8mLuhjbFLfZDsOm1kwSbZZOkQC+
 xNBDwVJ54F8=; b=MEowf36tFPlNVS4TJdzkKEkaDWRbcoBs7PvG4mxU9ijmhYb3
 DtVy4nUs7+fZPCVB58mzQHpXP3GAWhU58K+1jj3tnDVcX1s5AuKiP/4fjg+WDnyK
 IOANr5xdEktcOEe8CjWnwbRlQ7aFdnWrjarOOoQqMqF+SA20v4ZJRJlH2+gZJqpy
 CWRHEddzC/mh2XYOSUK+toHRD4HXcT5jKB3i7CcLkzS8yTJPyssQIRTb9tn5ea+S
 K3atI/oQ0GwDPJGXhMPEu6CgJhg4I3fvayMbXXNgWBpYM4RW8AFXJ8F5Ovvslc02
 CzP33tZAAH+IO9P6fGPzh+KoPxsGhLZmnhDn/Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1757441405; x=
 1757527805; bh=le/lK8mLuhjbFLfZDsOm1kwSbZZOkQC+xNBDwVJ54F8=; b=h
 QyxjK6dlQoxutmlUpMYu/2Kav4r1iZEZmL+AMoE0DPmhrQwDHUrn6/LkQU3HQHuU
 +ucmXZsgvFPwycpDURl7Pa7LwbVZrd4LC8sY4fKRixLESSdsNxtSFpbAPZZ54Cqp
 c9AX5xnPHz+UGZhcf8AMph1/LDqlgvXT7CUdwmHN9dD7CRjQvaXVINhax5n+8B2/
 TwvptSWaHK4v8BM9YIj+/rVcrCugqWx8oyE6Bq7un0I7drFkFNwb5rc0S8pCwhD+
 yR+YE+gLAOP7/N3ltd+QBCnhaq+ghPmmxlBUUdCxaDC7qZZ7tnRdngskdlSMqcWw
 GqXHzA4Jn1OfUX8B8BUaw==
X-ME-Sender: <xms:fG3AaPndiZZvY2KsEo-IO9r-Yo1NafrmA2xL_BOjvm8EgJtHYyOnBQ>
 <xme:fG3AaAUcm__8hmjymCK5tdZV4DARxr7zzXSVCTkPqyuHqkvSSjTg9zzRaCmsoKnNK
 lA6lyxMs4oKcdIsCxk>
X-ME-Received: <xmr:fG3AaIRfmfg_4dyDuK8POGr9sFvDI4vogOdQINpmr3SPlHxWxElo4QNTo7WW>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddvuddtlecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
 ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
 hrpeffhffvvefukfhfgggtugfgjgesthekredttddtjeenucfhrhhomhepufgrsghrihhn
 rgcuffhusghrohgtrgcuoehsugesqhhuvggrshihshhnrghilhdrnhgvtheqnecuggftrf
 grthhtvghrnhepgfdvgeeitefffedvgfdutdelgeeihfegueehteevveegveejudelfeff
 ieehledvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epshgusehquhgvrghshihsnhgrihhlrdhnvghtpdhnsggprhgtphhtthhopedufedpmhho
 uggvpehsmhhtphhouhhtpdhrtghpthhtoheprghsthesfhhisggvrhgshidrnhgvthdprh
 gtphhtthhopehjrghsohhnseiigidvtgegrdgtohhmpdhrtghpthhtohepuggrvhgvmhes
 uggrvhgvmhhlohhfthdrnhgvthdprhgtphhtthhopegvughumhgriigvthesghhoohhglh
 gvrdgtohhmpdhrtghpthhtohepkhhusggrsehkvghrnhgvlhdrohhrghdprhgtphhtthho
 pehprggsvghnihesrhgvughhrghtrdgtohhmpdhrtghpthhtohepughonhgrlhgurdhhuh
 hnthgvrhesghhmrghilhdrtghomhdprhgtphhtthhopehhohhrmhhssehkvghrnhgvlhdr
 ohhrghdprhgtphhtthhopehjrggtohgsrdgvrdhkvghllhgvrhesihhnthgvlhdrtghomh
X-ME-Proxy: <xmx:fG3AaNCQRfIhDT5jto05Ke8hRI9TbHELJ6xms4rMKWsGqZfp4CJ4yw>
 <xmx:fG3AaAvQ-bfFmhhOvAIlaPj5votbaiHnoNnCoYHNSwE0ZlRZ14zfPA>
 <xmx:fG3AaL_-1Tlct-_UNXxEBrHqCsbRvgLs8JJZ_6WKBPDdY0wi72Y_eQ>
 <xmx:fG3AaHRQL_sa5jxSsxbUNpY8AsjlJaR8oncaoQS0WGcpmdzslGKKUg>
 <xmx:fW3AaNdttPE6D-MVg_npUKs8inrXT3X0SDUeQlKiVuD9LYlEyHtVPj1S>
Feedback-ID: i934648bf:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 9 Sep 2025 14:10:03 -0400 (EDT)
Date: Tue, 9 Sep 2025 20:10:02 +0200
From: Sabrina Dubroca <sd@queasysnail.net>
To: =?utf-8?Q?Asbj=C3=B8rn_Sloth_T=C3=B8nnesen?= <ast@fiberby.net>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Donald Hunter <donald.hunter@gmail.com>, Simon Horman <horms@kernel.org>,
 Jacob Keller <jacob.e.keller@intel.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, wireguard@lists.zx2c4.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 10/11] tools: ynl: decode hex input
Message-ID: <aMBteqR5KP9KGcc3@krikkit>
References: <20250904-wg-ynl-prep@fiberby.net>
 <20250904220156.1006541-10-ast@fiberby.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250904220156.1006541-10-ast@fiberby.net>
X-Mailman-Approved-At: Tue, 18 Nov 2025 17:23:16 +0000
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

2025-09-04, 22:01:33 +0000, Asbjørn Sloth Tønnesen wrote:
> This patch add support for decoding hex input, so
> that binary attributes can be read through --json.
> 
> Example (using future wireguard.yaml):
>  $ sudo ./tools/net/ynl/pyynl/cli.py --family wireguard \
>    --do set-device --json '{"ifindex":3,
>      "private-key":"2a ae 6c 35 c9 4f cf <... to 32 bytes>"}'
> 
> Signed-off-by: Asbjørn Sloth Tønnesen <ast@fiberby.net>
> ---
>  tools/net/ynl/pyynl/lib/ynl.py | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/tools/net/ynl/pyynl/lib/ynl.py b/tools/net/ynl/pyynl/lib/ynl.py
> index a37294a751da..78c0245ca587 100644
> --- a/tools/net/ynl/pyynl/lib/ynl.py
> +++ b/tools/net/ynl/pyynl/lib/ynl.py
> @@ -973,6 +973,8 @@ class YnlFamily(SpecFamily):
>                  raw = ip.packed
>              else:
>                  raw = int(ip)
> +        elif attr_spec.display_hint == 'hex':
> +            raw = bytes.fromhex(string)

I'm working on a spec for macsec and ended up with a similar change,
but doing instead:

+        elif attr_spec.display_hint == 'hex':
+            raw = int(string, 16)

since the destination attribute is u32/u64 and not binary for macsec.

So maybe this should be:

+            if attr_spec['type'] == 'binary':
+                raw = bytes.fromhex(string)
+            else:
+                raw = int(string, 16)

to cover both cases?

I think it matches better what's already in _formatted_string.

(I don't mind having the current patch go in and making this change
together with the macsec spec when it's ready)

>          else:
>              raise Exception(f"Display hint '{attr_spec.display_hint}' not implemented"
>                              f" when parsing '{attr_spec['name']}'")
> -- 
> 2.51.0
> 
> 

-- 
Sabrina
