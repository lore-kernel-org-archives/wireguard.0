Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82ACAC624DA
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  3 Sep 2026 18:34:48 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 792c4f7d;
	Thu, 3 Sep 2026 18:32:20 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.73])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 3f8ef80f
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 3 Sep 2026 18:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=online.de;
 s=s42582890; t=1788460335; x=1789065135; i=max.schulze@online.de;
 bh=hpa1IPVQ7HR22j4QzFWZncwNjXX7qREVg6TGh7wulhE=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=I+sWIz8Kbn/gFd01pODMiV9RR35d5jHH1o4siVjM5JkF00ai80P+NpRrSkZKBN+2
 F3DAnfn3nR4b7DA+fqN+1HA03qpmus7aXkDs/NySFBPhS43r5alZaJCBfuaflDRxQ
 yiIi/9HOiWUtNKP3fSh2VIrxCgzZhQN/0x9huqoh8noO53MXCYQY2F4119A8sYv+d
 Ifdwhd86Bsa1C/DMvKjx7aeCKyk5VuNIrraeFm/qEzlANfFhoCP8PKlCSRA6nxCnl
 MHsZCT807m0qp95+9vVzwUPFDzuhMHVnFmHmmbxtC2Y55jHUqbsuHwZG++Kl+gXS9
 eh6Ufi5ZVLVrM+Aqyw==
X-UI-Sender-Class: 6003b46c-3fee-4677-9b8b-2b628d989298
Received: from client.hidden.invalid by mrelayeu.kundenserver.de (mreue109
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MyseC-1wgfHB29BK-012ZWn; Thu, 03
 Sep 2026 20:32:15 +0200
Message-ID: <721ba96f-b408-4e82-9eec-70df9c29279e@online.de>
Date: Thu, 3 Sep 2026 20:32:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Remove endpoint
To: Kent Friis <leeloored@gmx.com>, wireguard@lists.zx2c4.com
References: <20260903202133.2383ecd75a9b94dec9dc3974@gmx.com>
Content-Language: en-US
From: Max Schulze <max.schulze@online.de>
In-Reply-To: <20260903202133.2383ecd75a9b94dec9dc3974@gmx.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:hTJr8Hb4gjUaLFgVshR45ThGqDLEfGwkWYBtgvK9NUCkvXm7RbX
 ozFC2LzNKoUO0O3TpJIMWCtBScg6cMuT8xLWXrgpkyoAs8hL3JBtNoXojWYhD7fPqjKCTAO
 9FfPLuoliLYs02M7bGwF59kSBsevD27YFVk8BbG7PQyfl8tHDSA8WDsYVOx9LbYVAFPFo9g
 j3M979KThmpMvLkiMMt5w==
UI-OutboundReport: notjunk:1;M01:P0:biBA+axk5BQ=;h7wJnQflYT4rZxbvQcduH1C69GB
 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
 g3pstqSPVlDTZGwwNUKMzw1tu0Q==
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

Have you seen

wg set wg0 peer XXX remove

?


Am 03.09.26 um 20:21 schrieb Kent Friis:
> I can specify a peer with no endpoint in wg0.conf. It will then simply
> not have an endpoint until it either receives a packet from the peer,
> or one is specified with wg set ... endpoint ip:port.
>=20
> Now, I'm on a mobile connection, so when I log off, I want to remove
> the endpoint ip again so the "server" doesn't transmit stray packets
> to a mobile ip address.
>=20
> I tried
>=20
> wg set wg0 peer XXX endpoint 0:0
> wg set wg0 peer XXX endpoint off
> wg set wg0 peer XXX endpoint none
> wg set wg0 peer XXX endpoint ""
>=20
> The first one sets the endpoint to 0.0.0.0 port 0, which is first of
> all, usually treated as a broadcast address, and second, AFAIK there is
> no port zero.
>=20
> The other three give errors.
>=20
> How to remove the endpoint while keeping the rest of the configuration?
>=20
> /Kent

