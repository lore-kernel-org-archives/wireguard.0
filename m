Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08F04C54E5D
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 18 Mar 2024 11:51:01 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 16af8d9b;
	Mon, 18 Mar 2024 11:51:00 +0000 (UTC)
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 847e6cde
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 18 Mar 2024 11:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1710762652;
 bh=Iu+6WHoni3dZzZuI+kVQY9A4E2w/WBparVAHCv9ZkRM=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=BBhRlJhMpEsQqRM73j78u3Juw7S4OXn2Z4iUr/buzSoGd41Bo0Z24s9N76AewzXJs
 vbR6crRw1mcM9vRdUXm+THHQLVmfH/FTtaeN7YFoEYBi3OETrCnsLC0D7aVen6+BJE
 cY1ZnIX3r+YqBW+pXeNEaxxqsrMIIpqbZMdZnNrC4nhTBJlV1/ebv/QhIfb1ZKU5CY
 EZQVP/SWN+gPkTgSXJ1kYfEDpS4b+Aj5SMrnFK4TsD/GX/L1S0xIxL2Fk2P/kbObXg
 TLCyjFNV0JwxliMhCKUi4Lo3f16xWDx84Bn//bIcFNcotpeOelonHxlAr7v39SB7Ie
 c+0e6wZPiMhmQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4TytTl197Pz4wcR;
 Mon, 18 Mar 2024 22:50:51 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Michal =?utf-8?Q?Such=C3=A1nek?= <msuchanek@suse.de>, dtsen@linux.ibm.com
Cc: linuxppc-dev@lists.ozlabs.org, wireguard@lists.zx2c4.com, "Jason A.
 Donenfeld" <Jason@zx2c4.com>, netdev@vger.kernel.org
Subject: Re: Cannot load wireguard module
In-Reply-To: <87jzm32h7q.fsf@mail.lhotse>
References: <20240315122005.GG20665@kitsune.suse.cz>
 <87jzm32h7q.fsf@mail.lhotse>
Date: Mon, 18 Mar 2024 22:50:49 +1100
Message-ID: <87r0g7zrl2.fsf@mail.lhotse>
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
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Michael Ellerman <mpe@ellerman.id.au> writes:
> Michal Such=C3=A1nek <msuchanek@suse.de> writes:
>> Hello,
>>
>> I cannot load the wireguard module.
>>
>> Loading the module provides no diagnostic other than 'No such device'.
>>
>> Please provide maningful diagnostics for loading software-only driver,
>> clearly there is no particular device needed.
>
> Presumably it's just bubbling up an -ENODEV from somewhere.
>
> Can you get a trace of it?
>
> Something like:
>
>   # trace-cmd record -p function_graph -F modprobe wireguard
>
> That should probably show where it's bailing out.
>
>> jostaberry-1:~ # uname -a
>> Linux jostaberry-1 6.8.0-lp155.8.g7e0e887-default #1 SMP Wed Mar 13 09:0=
2:21 UTC 2024 (7e0e887) ppc64le ppc64le ppc64le GNU/Linux
>> jostaberry-1:~ # modprobe wireguard
>> modprobe: ERROR: could not insert 'wireguard': No such device
>> jostaberry-1:~ # modprobe -v wireguard
>> insmod /lib/modules/6.8.0-lp155.8.g7e0e887-default/kernel/arch/powerpc/c=
rypto/chacha-p10-crypto.ko.zst=20
>> modprobe: ERROR: could not insert 'wireguard': No such device
>=20=20
> What machine is this? A Power10?

I am able to load the module successfully on a P10 running v6.8.0.

I tried running the demo (client-quick.sh) to check it actually works,
but that hangs sending the public key, I suspect because my development
machine is behind multiple firewalls.

cheers
