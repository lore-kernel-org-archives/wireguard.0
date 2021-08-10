Return-Path: <SRS0=EM+o=NB=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23B18C4320A
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 10 Aug 2021 21:13:15 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1808761073
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 10 Aug 2021 21:13:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1808761073
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=protonmail.ch
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8add6fb7;
	Tue, 10 Aug 2021 21:13:12 +0000 (UTC)
Received: from mail-4317.protonmail.ch (mail-4317.protonmail.ch [185.70.43.17])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id a7532e84
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 10 Aug 2021 21:13:09 +0000 (UTC)
Date: Tue, 10 Aug 2021 21:13:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.ch;
 s=protonmail; t=1628629988;
 bh=6aENy3pBub1nFJ+eqa8hlDy0jfcwbgz9PQHy9+KqD8Q=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=HqDx5XBTz2NcAyyhttw2cCfuwQvg4xG4G1YjY8ktALFM+a7BZc12aJ1A3HWjKOjjK
 +jnElpzw7uVL2spYPZqBuVUfRfwhVDC2CXEuRHyxOEVaKuKbn9vKhKRS6Uet3PhElD
 Q+qGfOro9HTk+jxQATUOXlazjQeZvTi07bKsnlyU=
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
From: Neutron <dotneutron@protonmail.ch>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [PATCH] embeddable-dll-service: add ability to derive public key
 from private key
Message-ID: <7-v7jwwWMXai6l5Uqxgo8UjeuKNOvY2FDx4rsGB1yrAHkfDqrGGfoLOIHQuJuTBJ0HIpmxlqTTFJgWqbGDn5eFT-7bLT8D60enB3pVrc-2o=@protonmail.ch>
In-Reply-To: <CAHmME9oc2yoSjuh+Mkv_ERTLSocoRDF1Lh4M6HrciRPNqRBx7w@mail.gmail.com>
References: <20210810202936.1537-1-dotneutron@protonmail.ch>
 <CAHmME9oc2yoSjuh+Mkv_ERTLSocoRDF1Lh4M6HrciRPNqRBx7w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Reply-To: Neutron <dotneutron@protonmail.ch>
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Hey,

I started working on a C# WPF client based on the reference implementation =
you provided. I made it so the tunnel configurations can be added or edited=
 via a custom form much alike the one of wg-android. Since I'm only storing=
 the private key in the interface section of a config file, I need to be ab=
le to derive the public key and display it to the user.

As a personal example, I'm using Mullvad's wg configurations to test it. I'=
m able to export all configurations for their servers, for a given private =
key. I'm left with the typical wg conf files. When I fill in the details fo=
r a tunnel configuration in the client I created, I want to be able to writ=
e in the private key and have it generate the public key automatically. Thi=
s is the behavior of wg-android.

Adding that method, rebuilding the dll and invoking it from C# worked like =
a charm, so I thought it might help other people as well. It is a convenien=
ce method for anyone who wants to create a client of their own.

Neutron
