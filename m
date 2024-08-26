Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB19BC5321D
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 26 Aug 2024 08:53:36 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a89642aa;
	Mon, 26 Aug 2024 08:52:14 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [2604:1380:45d1:ec00::3])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 1378be15
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 26 Aug 2024 08:52:12 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 063A2A41D8A
 for <wireguard@lists.zx2c4.com>; Mon, 26 Aug 2024 08:52:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51E02C8CDDA
 for <wireguard@lists.zx2c4.com>; Mon, 26 Aug 2024 08:52:09 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="dZ79ExFH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1724662327;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:resent-to:
 resent-from:resent-message-id:in-reply-to:in-reply-to:  references:references; 
 bh=aZYC7K+XBTK3R5DbyGiUCuluVCF5DvrRw9TEYQkbztM=;
 b=dZ79ExFHkpNmbxaXMe2FwNCLM0JznSi6H3klyErO90xvulxuRmr1TIZIvrvJsSSfUbG5uk
 wFVjlBwxn7+2vncSdE9N3/HN0bI1PCo/4Zy/Nht7TdzpVMnQFCJjE5ybtLAo6G3FYd8Dnz
 vSbNsKdMSPfNYmJo3KQbISJ5hgOmIW4=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id de196486
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 26 Aug 2024 08:52:07 +0000 (UTC)
Resent-From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Resent-Date: Mon, 26 Aug 2024 10:52:04 +0200
Resent-Message-ID: <ZsxCNBs-C_ZdghF7@zx2c4.com>
Resent-To: wireguard@lists.zx2c4.com
MIME-Version: 1.0
Date: Mon, 26 Aug 2024 10:35:12 +0200
References: <87a5h6e4fk.fsf@dell.be.48ers.dk>
In-Reply-To: <87a5h6e4fk.fsf@dell.be.48ers.dk>
Message-ID: <CAHmME9qXiEmKTZ56+bz3-ZP3udQsgZHcKtV3RU_WK1as9c=e4Q@mail.gmail.com>
Subject: Re: wireguard-tools-1.0.20210914.tar.xz hash changed
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Peter Korsgaard <peter@korsgaard.com>
Cc: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
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

On Wed, Aug 21, 2024 at 9:11=E2=80=AFAM Peter Korsgaard <peter@korsgaard.co=
m> wrote:
>
> Hi Jason,
>
> Did you recently upgrade xz on git.zx2c4.com? I see that the hash of
> wireguard-tools-1.0.20210914.tar.xz changed:
>
> http://autobuild.buildroot.org/results/d63b8f5b14487f6d79c9779bb7fe4829fa=
e0653b/build-end.log
>
> We have a backup of the original file on sources.buildroot.net:
>
> mkdir a b
> wget -q -P a https://git.zx2c4.com/wireguard-tools/snapshot/wireguard-too=
ls-1.0.20210914.tar.xz
> wget -q -P b https://sources.buildroot.net/wireguard-tools/wireguard-tool=
s-1.0.20210914.tar.xz
>
> sha256sum */*
> 942ed32d1d6631932c82ff86c91ae8428d4c90bfec231a14ebdf6c29f068e60b  a/wireg=
uard-tools-1.0.20210914.tar.xz
> 97ff31489217bb265b7ae850d3d0f335ab07d2652ba1feec88b734bc96bd05ac  b/wireg=
uard-tools-1.0.20210914.tar.xz
>
> The uncompressed tarball is identical:
>
> unxz */*xz
> sha256sum */*tar
> 22d6d0b12ec69be002313a89dbe2c08c07d48c5b93af528189ceab351b3b718d  a/wireg=
uard-tools-1.0.20210914.tar
> 22d6d0b12ec69be002313a89dbe2c08c07d48c5b93af528189ceab351b3b718d  b/wireg=
uard-tools-1.0.20210914.tar
>
> It would be great if we could have a bit-identical .tar.xz.

I updated xz on the system. Bah, that's annoying.

I've downgraded it now and the hash should check out. But this issue
is sure to come up again in the future....

Jason
