Return-Path: <SRS0=hP/g=5B=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C96E8C18E5B
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 16 Mar 2020 00:20:45 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 30622205ED
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 16 Mar 2020 00:20:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (4096-bit key) header.d=rumpelsepp.org header.i=@rumpelsepp.org header.b="exGK3otH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 30622205ED
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=rumpelsepp.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f183fb3f;
	Mon, 16 Mar 2020 00:14:24 +0000 (UTC)
Received: from coruscant.sevenbyte.org (coruscant.sevenbyte.org
 [45.32.152.104])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 6b90591b
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 14 Mar 2020 07:35:09 +0000 (UTC)
Received: from kronos (p200300CD370ABC00C8C54BD202E7D6E5.dip0.t-ipconnect.de
 [IPv6:2003:cd:370a:bc00:c8c5:4bd2:2e7:d6e5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 (Authenticated sender: stefan@rumpelsepp.org)
 by coruscant.sevenbyte.org (Postfix) with ESMTPSA id 3C83F421F1;
 Sat, 14 Mar 2020 08:40:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rumpelsepp.org;
 s=dkim; t=1584171656;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nu4MUA1Wv2LYsyZCVqYo9scFamrZMwlSpL/yUIDaOYg=;
 b=exGK3otHU6lPW3jRVN/tTD5pvj7Ld8xh+E9m/NoVPm3SB4IKKPFkLeX9CqpEc2k+vcbIXB
 RYGx7BNtNIpFRp6+vbrpNvDKYTcQ5R17rd/IJkT+XpBXo2fne7rpSvj4PVC4FmWdLhZsA0
 L/TOq5QA7sRnErpaOlZp0x7oGwvjCr12n0vPa8GXShNZ9ZfX3wpS5v1uUbxq5NKSimlNDq
 At71+pqhnf6r+xBQbLXFJzaBx+TaQo5I9Fvb8G+fgP00BSNKw54HZXFvplm4J4ISTo3pvT
 pW2kvDLFAd6wcjzCxnQlKrrQIQstilbRj29UupHGEwwQhg6Hzqcn290qrhwQttanKUg12e
 X/Yg3LNhyRwz3aYrJ0oI3ltOmcjV5it+RSrws1ktX1QGKm8nUxQrNLcKGUHNZExQYj5uO0
 B/XrWNHeANMSGNjxWFo6pILgc6GfZMrik6zuHqxRTLgN6z1Dc/89g5Ymp7oWQ+zo1dMlQ8
 KZpSROaud/57ggY/LIGV4dKcJ4kaJR275QCdh1CXT+5+tttKM/cbOfhHVHH5FcfEeYVeKU
 5yVPPyQccxXJBZ3B+6dZOqWiJO4xQQGPF2Lk+IvDFqdNDa+YnKOZBTkpAlZyTPq8LhTjOF
 /jl5F3iXaSZSUhyvI5LIFp9cm2trEGeu+eHMS/pNR3sobZClWviOc=
Message-ID: <7526f16bb72b9bb1fdb6384e2c5c01fd0d0e4af4.camel@rumpelsepp.org>
Subject: Re: Endpoint address dns resolution - option to prefer IPv6 or IPv4
From: Stefan Tatschner <stefan@rumpelsepp.org>
To: krah.tm@gmail.com, wireguard@lists.zx2c4.com
Date: Sat, 14 Mar 2020 08:40:55 +0100
In-Reply-To: <327df26ff0e515425bc0b18084117b7ae065d97b.camel@gmail.com>
References: <327df26ff0e515425bc0b18084117b7ae065d97b.camel@gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.0 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=rumpelsepp.org; 
 s=dkim; t=1584171656;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nu4MUA1Wv2LYsyZCVqYo9scFamrZMwlSpL/yUIDaOYg=;
 b=D1T2CMuh8db2Z7NpEvuY2Z5CAERTYpxGKkgVrF7y+9aPYNcdp9y0QDJrN4XBnEe0HfxW1S
 IInE/Mkr1Ptg9wJvHYzgsp2DOqtHekb3YLg2u2NOmONRbDZQ0nWb26LlUFhkO66mioxRYj
 LxxwJoY6gG6G1U5qo0frQYKks3uuw4EZ/dI5I2w4lwgTBDdne6iG3gzEStI6S9mOw2IzD3
 uo/vqFMLQs3wr+/4s3nffOkk5JlUgTBo7Db5fJpsnVHEaR5G4cNfmVESmxczwtrSNIgJXi
 sIXr62TcdWJ+k5r2tlTGWVV7wuAIKvLXCGTKBMirmQyE6m9asE9yPYQt0CNs4Ra5ktjVVe
 256DhFRyoLWhC08eu8KLo/CtPZxN970terlIXBa9N2/NXW8Uci6EL87RytULvvmIXT/uHD
 RyCftqTmnNiKogiShlPU10z6RcPMQLcmkPQnOd7ZFLC0IX9y96yOCv7tpWGgiL/xsOlZ/g
 HRR0njO81MAJJUOKus6l65BlUk/VcRIeBKaJosgcouVEbkjfZlmcrA/fb9Gr94mdUtOhpK
 nWQk5oCI9rttV7+1meOtmGuJRYhJIce6mb+Xlvs7TPIY23jBNmg2SnLvEONSIynwRf1AyO
 C5eR6xKvI/cHxq6wIL9e/zpgHRiPQAHhlKYESGaOXRpImaj22+3mg=
ARC-Seal: i=1; s=dkim; d=rumpelsepp.org; t=1584171656; a=rsa-sha256; cv=none;
 b=oOm+BGUOwOgt02el3xW9Z7zkq0jbDlIHqsk57agx9jLwJRe18akV4O1Uot3tIOVBfsMNjS
 1fR5kJ6YiGWxU5LoQ1QRqYyU+Cmudeetvls31r8PsLDho56mGqtnOdkcWdg4OuuGNNoK0c
 60B8o0Mg1SijKb0z3u2tH2OhPKbS6mw65qIwh2Z29Y6Ys9spzG/Et70gtxl/wDZdZyNPOD
 m9TaLuSRp2GCesV2G3QhT9RpKohbqLk5DOfvI4Ibt8SfwX3o/GbeZ9BfU1djeVQQw0l1Dz
 8L3fpkJQN/jqbwiBOZde4slWYjqt21Nvn2ZoZ+yWX/iwuw8mxHQJTmfQ9DRzXdHuNUouTM
 i/bq0gweUitihcgpCO6I5rHOR+l37t+tH5m+kktiO8qyS/Yz+QsUFouYsxF99B2O3GUaN9
 FncqxoL0AsYY91cNY2tVUxpEUaFe/U0lDFuBI4reAi2yAgpes+2O5KptGdHdPqC7HV1SRQ
 hajNwx9+mGA7559KsVP8KZq0qWqlxw/P/kCYS9ectNzsZ6K+J72s3tzEYfGDb7uVhNVAtW
 Bo+eyEC8MNsyBPsOBRgkl3CmmNC3cxQOlQV/qg8d8nL813FsL8f/mB5mrloyK6ZSlG027m
 6QwXnMe2NtUkQm8zkm6CVnW/nCt3VRha2vh66bG9OAhfgC3h25Lnk=
ARC-Authentication-Results: i=1; ORIGINATING;
 auth=pass smtp.auth=stefan@rumpelsepp.org smtp.mailfrom=stefan@rumpelsepp.org
X-Mailman-Approved-At: Mon, 16 Mar 2020 01:14:22 +0100
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

On Fri, 2020-03-13 at 15:52 +0100, Torsten Krah wrote:
> I would like to configure the client, so that I can tell him, to
> either prefer IPv6 or IPv4 for the vpn connection.

If you use the Wireguard Support in NetworkMananger, it does update the
Endpoint dynamically. I am not sure if you can configure a preference
on v4/v6, but at least it updates the endpoint automatically depending
on the current network capabilities. IIRC it uses the system wide
settings in /etc/gai.conf.

