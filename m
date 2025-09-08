Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5541ECAC586
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  8 Sep 2025 13:22:55 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4096a8e2;
	Mon, 8 Sep 2025 13:22:53 +0000 (UTC)
Received: from sipsolutions.net (s3.sipsolutions.net [2a01:4f8:242:246e::2])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 40b7b89a
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 8 Sep 2025 13:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
 Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
 Resent-Cc:Resent-Message-ID; bh=SuRVL9yTkDR5h545LQmg+jQK9v+68jYw4M9j0Cty4Qw=; 
 t=1757337772; x=1758547372; b=jRUy7+0HlQMGwWdo3IxlS3SGLLWiEyAqERVHdQ6L1pOdMgP
 OK1qCqlsYF0woaR64OGcoSBIJoBd2OCaKS/VWrosq/AYTTjebBb+yZLEyyyNyhAfu/V+qhpJQrM/1
 XWJTfVm+tEq1M3GoLkG7ddb4fBQmfmF7km/+k1U/ze+/FnMKYNFmrExSox+WGYZtDUB99eqd7lDv/
 S6lvxn7DF/Kq6tVF6kcpWPyh5Ujiam4Ge2WTbtH3rZb6LIU2NYLHoo40dicT6WPkNhdDlh5oCV6c9
 nN+qb5rVSpd5GZm5mh+F2q18QervWbEhNI7zcjyo+PP5Po5brqhsQ8CFsm11DkZQ==;
Received: by sipsolutions.net with esmtpsa
 (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.98.2) (envelope-from <johannes@sipsolutions.net>)
 id 1uvbpR-00000007biI-1yNJ; Mon, 08 Sep 2025 15:22:41 +0200
Message-ID: <4ef5406d68805d6b176a0078ed0bf21b00052264.camel@sipsolutions.net>
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
Date: Mon, 08 Sep 2025 15:22:40 +0200
In-Reply-To: <f574e4b9-d0ea-46ef-bbed-8f607ab7276f@fiberby.net>
References: <20250904-wg-ynl-prep@fiberby.net>
 <20250904220156.1006541-2-ast@fiberby.net>
 <e24f5baf-7085-4db0-aaad-5318555988b3@intel.com>
 <6e31a9e0-5450-4b45-a557-2aa08d23c25a@fiberby.net>
 <c1a4da4cb54c0436d5f67efacf6866b4bc057b3e.camel@sipsolutions.net>
 <f574e4b9-d0ea-46ef-bbed-8f607ab7276f@fiberby.net>
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

On Mon, 2025-09-08 at 09:08 +0000, Asbj=C3=B8rn Sloth T=C3=B8nnesen wrote:
>=20
> Thank you for the consensus write up. Should we prohibit indexed-array wi=
th sub-type
> nest for families with a genetlink protocol?
>=20
> It is currently only used in families with a netlink-raw or genetlink-leg=
acy protocol.

I have no strong opinion on that, but I guess maybe so? At least print
out a warning for anyone who's trying to add such a new thing perhaps,
so that new stuff that isn't just a port (to ynl) or annotation of
existing APIs doesn't add it.

> > I can't get rid of the nested array types in nl80211 though, of course.
>=20
> Wireguard is already in the same boat. [...]

Oh, sorry. I didn't look at the linked patch and thought it was adding
such a new thing. Looking now, I see it just makes the policy validate
it instead of (only) doing it in the code. (FWIW, in the code you could
then also set the policy argument for nla_parse_nested() calls to NULL.)

> Given that, as Jacob pointed out, there are more families with nested arr=
ays in
> their YNL spec, than those using NLA_NESTED_ARRAY, then it appears that t=
here
> are more families already in the boat.

Right.

johannes
