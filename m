Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDFA4CAC582
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  8 Sep 2025 07:57:08 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7c187d36;
	Mon, 8 Sep 2025 07:55:41 +0000 (UTC)
Received: from sipsolutions.net (s3.sipsolutions.net [2a01:4f8:242:246e::2])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id c4780b05
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 8 Sep 2025 07:55:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
 Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
 Resent-Cc:Resent-Message-ID; bh=nhqRh9PPeHATPPUMi9j7S6OlMPAIqMETQQdLoQOlCxc=; 
 t=1757318140; x=1758527740; b=oUKNRh67iljHFY9Df2sx/eGOl2watoqvP/lRNECclW0ov/4
 +r4/UoUN/STo1gCzBzlU5FtXu3V6bmUi1TVBT6aAFzULUrJtEzXoLR7nuaT61PAWSbhZR4M0mK8aA
 2qujxMqNAP5opKbPuMuCw54c558aFjGf4h31CevCo3C771L4oxgGWAYkJExPID+DqVINwmOskQyEo
 jmUzRzHABh8l6uoj7whrBRphWmjjaEvmTs7dKCi0WEdL9npP447xCLSFmr9dyIctQVDB9LhLoECwB
 GVUPJKALaZSX0Nk38VT47aVZUB96N5Em7AfaCNi/3hm8LrDRetcPBGBIIwEn6OGw==;
Received: by sipsolutions.net with esmtpsa
 (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.98.2) (envelope-from <johannes@sipsolutions.net>)
 id 1uvWir-00000006ziP-1450; Mon, 08 Sep 2025 09:55:33 +0200
Message-ID: <96db85326505785727bcfe45b99ae12fdbfb548a.camel@sipsolutions.net>
Subject: Re: [PATCH net-next 06/11] tools: ynl-gen: don't validate nested
 array attribute types
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
Date: Mon, 08 Sep 2025 09:55:31 +0200
In-Reply-To: <d612ce20-ae4a-4f6d-9d1b-a3d56f3d10a9@fiberby.net>
References: <20250904-wg-ynl-prep@fiberby.net>
 <20250904220156.1006541-6-ast@fiberby.net>
 <d2705570-7ad2-4771-af2a-4ba78393a8c4@intel.com>
 <d612ce20-ae4a-4f6d-9d1b-a3d56f3d10a9@fiberby.net>
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

On Sat, 2025-09-06 at 15:10 +0000, Asbj=C3=B8rn Sloth T=C3=B8nnesen wrote:
>=20
> For the other families, I don't know how well defined it is, Johannes hav=
e
> stated that nl80211 doesn't care which types are used, but I have no idea
> how consistent clients have abused that statement to send random data,
> or do they all just send zeros?

I think most clients probably send incrementing numbers (1, 2, 3, ...),
but maybe some start at 0, some sometimes might use band numbers and
thus have sparse values, etc.

But as I just wrote, I'm not really sure it should be used at all.

joahnnes
