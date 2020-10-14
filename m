Return-Path: <SRS0=ZPJq=DX=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2932BC433DF
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 16 Oct 2020 13:17:24 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B4D3C206E5
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 16 Oct 2020 13:17:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=protonmail.ch header.i=@protonmail.ch header.b="CP+SrEqA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B4D3C206E5
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=protonmail.ch
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a1239254;
	Fri, 16 Oct 2020 13:16:53 +0000 (UTC)
Received: from mail-40136.protonmail.ch (mail-40136.protonmail.ch
 [185.70.40.136])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id fdafa2d6
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 14 Oct 2020 11:04:29 +0000 (UTC)
Date: Wed, 14 Oct 2020 11:04:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.ch;
 s=protonmail; t=1602673479;
 bh=pU5x8oOl9uPDtGyQcg7PHkzlwOzM5LpNkmYD1RJTx+c=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=CP+SrEqAsOMu2tSwgNaNklU5oFjR6JOghXLQKzXlmCk9Kk1JgAfo5VTxPGiIV5xbY
 Uden+clezyEKtxhhevUQEaPaX/XRneHmB/+OFANa3HatoTx+VBKs0Vr3AWjpxFzv79
 N80u7xvUdC4/UdOTIAKNcAIxxiEls6gFveyO++to=
To: "Max R. P. Grossmann" <m@max.pm>
From: Thireus <thireus@protonmail.ch>
Cc: Rudi C <rudiwillalwaysloveyou@gmail.com>, wireguard@lists.zx2c4.com
Subject: Re: [FR] How can I expose the wireguard tunnel as a socks5 proxy on
 the client?
Message-ID: <BAFA6A11-22BE-4A91-B1AD-ADA979A94BE6@protonmail.ch>
In-Reply-To: <20201009142612.nyremqtnp2yjp257@desktop42>
References: <CAE9z9A0H8t3op=ewTCUhZXeOoprWEquiiH77mUN_C8EMvwiF2w@mail.gmail.com>
 <20201009142612.nyremqtnp2yjp257@desktop42>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Fri, 16 Oct 2020 15:16:50 +0200
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
Reply-To: Thireus <thireus@protonmail.ch>
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Maybe this could help: https://github.com/kizzx2/docker-wireguard-socks-pro=
xy

> Le 9 oct. 2020 =C3=A0 15:26, Max R. P. Grossmann <m@max.pm> a =C3=A9crit =
:
>=20
> Another idea would be to install WireGuard in a (tiny) virtual machine or=
 a VPS and then ssh into that machine using
>=20
> =09ssh -TD9151 user@example.com
>=20
> This creates a SOCKS5 proxy on port 9151.
>=20
> Then, for example, you could create two Firefox profiles; one without a p=
roxy (for the uncensored websites) and another that utilizes the SOCKS5 pro=
xy on port 9151. The SOCKS5 proxy exposed by ssh will route all traffic ove=
r your virtual machine (example.com above), which will in turn route it thr=
ough WireGuard.
>=20
> Since ssh can now be natively used under Windows, I'd be surprised if its=
 -D option were not available. AFAIR, Putty can also do something similar.
>=20
> Best,
>=20
> Max
>=20
> On 20/10/04 03:41pm, Rudi C wrote:
>> I use Wireguard to circumvent Iran's censorship. A major problem with
>> it is that it's very hard to selectively proxy specific domains/apps
>> through Wireguard, while leaving others alone. This is an essential
>> feature for Iran's internet, as:
>> 1. The connection is terrible, so avoiding using the proxy for
>> uncensored sites helps a lot.
>> 2. International traffic is 2x more expensive, so avoiding the proxy
>> for internal traffic is very beneficial.
>> 3. Some internal sites ban international IPs and need Iranian IPs.
>>=20
>> The easiest way to solve this program, as far as I understand, is to
>> add the ability to expose the tunnel as a socks5 proxy on the client
>> side. This is the approach that shadowsocks, v2ray, etc have adopted.
>> There are mature solutions to selectively routing traffic through a
>> socks proxy.
>>=20
>> I searched around, and there are docker containers that already do
>> this wireguard-to-socks thing; But running docker is expensive on a
>> non-Linux machine, so it'd be much appreciated if you could support
>> exposing socks and HTTP proxy servers natively.


