Return-Path: <SRS0=EQWa=OY=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7942C433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  4 Oct 2021 05:33:28 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 86AFC61216
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  4 Oct 2021 05:33:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 86AFC61216
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=emdete.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1051e377;
	Mon, 4 Oct 2021 05:30:50 +0000 (UTC)
Received: from emdete.de (emdete.de [2a01:4f8:140:81c4::2])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 4dff5ae0
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 4 Oct 2021 05:30:49 +0000 (UTC)
Received: from emdete.de (<unknown> [185.254.75.44])
 by emdete.de (OpenSMTPD) with ESMTPSA id 3afeff30
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Mon, 4 Oct 2021 05:30:48 +0000 (UTC)
Received: from localhost (emdete.de [local])
 by emdete.de (OpenSMTPD) with ESMTPA id 208d8b97;
 Mon, 4 Oct 2021 05:30:44 +0000 (UTC)
Date: Mon, 04 Oct 2021 07:30:44 +0200
From: "M. Dietrich" <mdt@emdete.de>
Subject: Re: Behaviour on MTU problem
To: Art Botterell <art@botterell.net>, wireguard@lists.zx2c4.com
References: <1630347517.szy5mrrs16.astroid@morple.none>
 <08C6DA98-A534-451D-9007-FF8627C48065@gmail.com>
In-Reply-To: <08C6DA98-A534-451D-9007-FF8627C48065@gmail.com>
MIME-Version: 1.0
User-Agent: astroid/0.16.0 (https://github.com/astroidmail/astroid)
Message-Id: <1633325115.iotxkgm6j2.astroid@morple.none>
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
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Quotation from Art Botterell at August 30, 2021 21:55:
> One reads about fragmentation-induced failures and about=20
> various MTU values that did or didn't work in a particular=20
> situation.  [...]  what we could look out for in order=20
> automatically to detect MTU issues [...] Is there some sort=20
> of a =E2=80=98fragtest=E2=80=99 network utility out there?

My request was neither about anekdotic problems with different=20
MTU sizes nor any automatic detection of a correct size and=20
test utilities.

i was asking why the kernel module is completly locking up if=20
a MTU size problem is present.

best regards, Michael
