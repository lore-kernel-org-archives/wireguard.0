Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E8FACA1016
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  8 Sep 2025 07:54:25 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 295ffbfe;
	Mon, 8 Sep 2025 07:54:23 +0000 (UTC)
Received: from sipsolutions.net (s3.sipsolutions.net [2a01:4f8:242:246e::2])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 96a0470e
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 8 Sep 2025 07:54:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
 Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
 Resent-Cc:Resent-Message-ID; bh=xRtcOqdjtsdZI6kf5ebzBEjwO+H4XBq0PeK8BgyDANI=; 
 t=1757318061; x=1758527661; b=rO+gsWxfSyWvCmjqF6wmpOGHH/Up+pJSoIwBHrcS4Jh8zcO
 VNe+dtf+wJ5HzT+nrFniR06k9iUpHEpGPUMICyg4jNAO6scZsu0Pt0Z83dPT3e2GKxu4GA4WLoBaw
 Wp9JIxR6uGDd4JQI4tdgnsz/qJ9DxY1auVzOS2z3BE3krYTIXTD6V56vUF4aE6dxTW4O6tyQ2iuoE
 zWGkc3lm2UKG9OUYGvAdSL6wfoQFDyuK7yGWHJtU6ClZbhFVgqtIBqF4d8gXRw9Q0mqM3H+1i6mUJ
 Uj1E0bDp2J2MJjpbEAfdShI17RoGfE1u+PB6OyyFPksAGQH4LH6AxnjBIAF5tA4g==;
Received: by sipsolutions.net with esmtpsa
 (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.98.2) (envelope-from <johannes@sipsolutions.net>)
 id 1uvWhQ-00000006zQ9-1xiK; Mon, 08 Sep 2025 09:54:04 +0200
Message-ID: <c1a4da4cb54c0436d5f67efacf6866b4bc057b3e.camel@sipsolutions.net>
Subject: Re: [PATCH net-next 02/11] tools: ynl-gen: generate nested array
 policies
From: Johannes Berg <johannes@sipsolutions.net>
To: =?ISO-8859-1?Q?Asbj=F8rn?= Sloth =?ISO-8859-1?Q?T=F8nnesen?=	
 <ast@fiberby.net>, "Keller, Jacob E" <jacob.e.keller@intel.com>, "Jason A.
 Donenfeld" <Jason@zx2c4.com>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>,  Jakub Kicinski	 <kuba@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>
Cc: Donald Hunter <donald.hunter@gmail.com>, Simon Horman
 <horms@kernel.org>,  Andrew Lunn <andrew+netdev@lunn.ch>,
 "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>, 
 "netdev@vger.kernel.org"	 <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org"	 <linux-kernel@vger.kernel.org>
Date: Mon, 08 Sep 2025 09:54:03 +0200
In-Reply-To: <6e31a9e0-5450-4b45-a557-2aa08d23c25a@fiberby.net>
References: <20250904-wg-ynl-prep@fiberby.net>
 <20250904220156.1006541-2-ast@fiberby.net>
 <e24f5baf-7085-4db0-aaad-5318555988b3@intel.com>
 <6e31a9e0-5450-4b45-a557-2aa08d23c25a@fiberby.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
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

On Sat, 2025-09-06 at 14:13 +0000, Asbj=C3=B8rn Sloth T=C3=B8nnesen wrote:
>=20
> Johannes introduced NLA_NESTED_ARRAY and the NLA_POLICY_NESTED_ARRAY()
> macro in commit 1501d13596b9 for use in nl80211, and it's therefore
> used in net/wireless/nl80211.c, but outside of that the macro is
> only sparsely adopted (only by mac80211_hwsim.c and nf_tables_api.c).
>=20
> Wireguard adopts the macro in this RFC patch:
> https://lore.kernel.org/netdev/20250904220255.1006675-2-ast@fiberby.net/

I think the general consensus now is that preference should be towards
arrays being expressed by giving the attribute holding the array
multiple times, i.e. each occurrence of an attribute holds a single
entry of the array:

[header][type1:a1][type2:b][type1:a2][type1:a3]

resulting in an array

[a1, a2, a3] and a separate value "b",

rather than a nested array:

[header][type1:[1:a1][2:a2][3:a3]][type2:b]


Of course if each entry has multiple values, then you'd still need
nesting:

[header][type1:[subtype1:x1][subtype2:x2]][type1:[subtype1:y1][subtype2:y2]=
]

would be an array

[[x1, x2], [y1, y2]].


I can't get rid of the nested array types in nl80211 though, of course.

I'm not sure the nl80211 ynl code was ever merged, but it wasn't
authoritative anyway, just for some limited userspace generation, so I'm
not sure the whole ynl handling this is needed at all?


johannes
