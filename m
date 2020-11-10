Return-Path: <SRS0=x2E1=EQ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBF60C388F7
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 10 Nov 2020 08:19:07 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 125592080A
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 10 Nov 2020 08:19:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=tomcsanyi-net.20150623.gappssmtp.com header.i=@tomcsanyi-net.20150623.gappssmtp.com header.b="s7l+iXQD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 125592080A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=tomcsanyi.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9c8652c7;
	Tue, 10 Nov 2020 08:14:54 +0000 (UTC)
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 8a0c549a
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 10 Nov 2020 08:14:52 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id o23so16213553ejn.11
 for <wireguard@lists.zx2c4.com>; Tue, 10 Nov 2020 00:18:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tomcsanyi-net.20150623.gappssmtp.com; s=20150623;
 h=content-transfer-encoding:from:mime-version:subject:date:message-id
 :references:cc:in-reply-to:to;
 bh=3IqKE9qbhiBqb/sbQDTR5rG4idVvscQP67PWb3CTQbA=;
 b=s7l+iXQDbWuTN/ksz0G55E/dehSsspiSUrn/W2rVUICRtBAnFa2yZ1pCWEhST9kANx
 59xnMZuXKW7cWIHakBzxsBhztZjqNKpEKvuHGvaBEVxcaNYdhYaz85c0P2MY7XMjmV70
 RBU8LzKIPvqFy8naiEjiM8i0HcIwFKk3QoDFbhOhYKpppZbRWphwtwEPmE1BTxAtbo1u
 5IETPmRcTqrLknRHloJoteTkkdAbhOqF113lBbdVJHFi8A0pl7TVagXt4SIwC0gLI13x
 o9b13CFXmd159TRyePzyOuZof8sGRUbk7f5ZiLYCpqZAO8dpbw9ZctYZ1jnb6X9ZJ8yN
 tFdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:content-transfer-encoding:from:mime-version
 :subject:date:message-id:references:cc:in-reply-to:to;
 bh=3IqKE9qbhiBqb/sbQDTR5rG4idVvscQP67PWb3CTQbA=;
 b=K6fUIODM/ANgKr0uI0UWX90WrTTZukI5VqA0UbsyBRhbtkdT5KCyQFTFps7IIuBbQe
 jEtW6V5FikkHcQXH4fXTVwbob2Qi26v6PM2yezPWI1qkRctQvB4hPxs7wF44PH3nOq5v
 ymvioYYQzHXKrqN5jzhgySLu1K96+e8LU0VoEE+7jLhCCMI0FzMdCELJH4dcH1FtRmPr
 H4/Ji3jQQJPP8Xo2BEJ2L1W2Ld8iu6jS256g/9yQINCWGU0zL7ojK7r9/a7Wj3CGyBZN
 ovg66/pN4dyuWI8dKQdV0WTEu+D+FX099UQez6M6ja0v0DclbHsGZVN+IbyrZmNyrFM6
 qX7Q==
X-Gm-Message-State: AOAM530LQ1L2XNZv8OmYPkuPZIe7sAqrNIdomGO3zQfmQFzXLO0pAbx5
 oEMtwp55iWUIYDAn6e6EBn4oJTx62eIORJJP
X-Google-Smtp-Source: ABdhPJyZywdB+HN3g3KoFqeO8KHdI90ovbU6neZ85GNoB9VgxI6rbyncGvjfWugiY83oKZTAebfbfw==
X-Received: by 2002:a17:906:3813:: with SMTP id
 v19mr6374783ejc.462.1604996311791; 
 Tue, 10 Nov 2020 00:18:31 -0800 (PST)
Received: from [192.168.0.103] (85-238-77-56.pool.digikabel.hu. [85.238.77.56])
 by smtp.gmail.com with ESMTPSA id p4sm9889722ejw.101.2020.11.10.00.18.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Nov 2020 00:18:31 -0800 (PST)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: "Tomcsanyi, Domonkos" <domi@tomcsanyi.net>
Mime-Version: 1.0 (1.0)
Subject: Re: Transient Connection Issue
Date: Tue, 10 Nov 2020 09:18:30 +0100
Message-Id: <589074B2-A2F2-4B87-AA27-0B60704A5798@tomcsanyi.net>
References: <CAFzYBZ6LPb-ro=2F1GvRseav+67vkgVQBDJmECEbFAXi-94LNw@mail.gmail.com>
Cc: wireguard@lists.zx2c4.com, Pulkit Anand <pulkit@provakil.com>
In-Reply-To: <CAFzYBZ6LPb-ro=2F1GvRseav+67vkgVQBDJmECEbFAXi-94LNw@mail.gmail.com>
To: Ashish Madeti <ashish@provakil.com>
X-Mailer: iPhone Mail (18A8395)
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

Hi Ashish,

With the amount of information given it is very hard to comment anything mea=
ningful.
Have you gone through standard network connectivity issue investigation step=
s?
E.g.: does ping work? Do you have correct routes setup? What does wg show te=
ll during downtime? What does tcpdump shows on the wire?

Cheers,
Domi


> 10.11.2020 d=C3=A1tummal, 0:21 id=C5=91pontban Ashish Madeti <ashish@prova=
kil.com> =C3=ADrta:
>=20
> =EF=BB=BFHi All
>=20
> Background: I am using Wireguard VPN to secure intra-server
> communications among my 5-6 ubuntu servers sitting in different data
> centers.
>=20
> Today, we had a downtime of around 15 minutes because the server
> running nginx was not able to connect to the web-application server
> using the wireguard interface [0]. I ascertained that it was not a
> connection issue between nginx server and web-application server by
> trying to connect to web-application server via its public IP, which
> worked [1]. I even tried restarting wireguard service [2] on both
> nginx and web-application server but to no avail.
> So, before investigating further, I decided to first route all the
> traffic to a failover server (which was also a part of the VPN). It
> took me around 5-10 minutes to pull the latest configuration and
> application changes onto the failover server and then route all
> traffic to it. Once our site was up, I again tried connecting to the
> original web-application server from nginx server, using curl, but
> this time it worked fine.
>=20
> Can anybody help me understand the problem or anything I should try if
> it happens again?
>=20
> Please let me know if you need any more information.
>=20
> [0] Tried via curl. curl 10.0.0.10:8080. Received the error
> 'Connection timed out'
> [1] curl w.x.y.z:8080 returned the html content as expected.
> [2] sudo service wg-quick@wg0 restart
>=20
> Regards
> --=20
> Ashish Madeti
