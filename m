Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E303C61DD3
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  3 Sep 2026 18:45:52 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id b20d7bde;
	Thu, 3 Sep 2026 18:40:39 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 1283519f
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 3 Sep 2026 18:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.com;
 s=s31663417; t=1788460831; x=1789065631; i=leeloored@gmx.com;
 bh=AQaxzuwkAqVMKlvyWKubVW6O16yHvO6obhcqRhw1h60=;
 h=X-UI-Sender-Class:Date:From:Cc:Subject:Message-Id:In-Reply-To:
 References:Mime-Version:Content-Type:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=pHKIakK7n+u7LiIeRDAe3H0tWy7c11XMumjG4z9xadVggD9aqJdRb9imVwkqjiRv
 Gik7ehkimHWGVI4RVF1wJhXsH9meyE9qtTRX3VLEU8RQTkBtdMsILbL4r6edGY8SN
 6ahnGgJlPB6h91eLWm2yNgEGn3CVMS3xQty/OJV06WnCR7td23yfHyddM7HEFnC+x
 psXzFkUwJX7S+25Hx2P6u3r+urmZPzFsobhnNKBhnq/w36bshUN5EzPJ8VN6ISrJQ
 mNoRyp+0GMz/wb1YBrOkb/JDI36B9Uy/UZ+9KD3H1/0E/hoBJMmYoiG3mjXvYjCf3
 8Bm++45bRPZajvVVUg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.174]) with ESMTPSA (Nemesis) id 1MHG8m-1x6Xx02sE4-00D4Iq for
 <wireguard@lists.zx2c4.com>; Thu, 03 Sep 2026 20:40:30 +0200
Date: Thu, 3 Sep 2026 20:40:30 +0200
From: Kent Friis <leeloored@gmx.com>
Cc: wireguard@lists.zx2c4.com
Subject: Re: Remove endpoint
Message-Id: <20260903204030.ee330075df0fba808f1fb065@gmx.com>
In-Reply-To: <721ba96f-b408-4e82-9eec-70df9c29279e@online.de>
References: <20260903202133.2383ecd75a9b94dec9dc3974@gmx.com>
 <721ba96f-b408-4e82-9eec-70df9c29279e@online.de>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-unknown-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:r56cEffwZSv4G5/UVpKBRNATGCR9zd8hlDA59uOYCoQWWtcQdYA
 5SniX+isEUhOKgf3X9Rxhxtcxq2qrCaQ1+aR/nq9G72/1qN1oqmqNtGNn0GJ1HO2lkRx8N3
 7+KKAKsSkhIk1y/ezhtKS9tm0vRIHFex7VkPynwoz54HgQng4vJkh9qIr3bkxmFwBAwliaI
 meYjHZ85tPa7Vk+RrV9IQ==
UI-OutboundReport: notjunk:1;M01:P0:dVEHPu6HPSk=;MG8qI2+wFmALNv/UcOjY4OhDExF
 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
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

That removes the entire peer, not just the endpoint.

On Thu, 3 Sep 2026 20:32:15 +0200
Max Schulze <max.schulze@online.de> wrote:

> Have you seen
>=20
> wg set wg0 peer XXX remove
>=20
> ?
>=20
>=20
> Am 03.09.26 um 20:21 schrieb Kent Friis:
> > I can specify a peer with no endpoint in wg0.conf. It will then simply
> > not have an endpoint until it either receives a packet from the peer,
> > or one is specified with wg set ... endpoint ip:port.
> >=20
> > Now, I'm on a mobile connection, so when I log off, I want to remove
> > the endpoint ip again so the "server" doesn't transmit stray packets
> > to a mobile ip address.
> >=20
> > I tried
> >=20
> > wg set wg0 peer XXX endpoint 0:0
> > wg set wg0 peer XXX endpoint off
> > wg set wg0 peer XXX endpoint none
> > wg set wg0 peer XXX endpoint ""
> >=20
> > The first one sets the endpoint to 0.0.0.0 port 0, which is first of
> > all, usually treated as a broadcast address, and second, AFAIK there i=
s
> > no port zero.
> >=20
> > The other three give errors.
> >=20
> > How to remove the endpoint while keeping the rest of the configuration=
?
> >=20
> > /Kent
>=20
