Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B234C433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 18 Jan 2022 11:43:18 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id ed115219;
	Tue, 18 Jan 2022 11:43:17 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id ea16a950
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 18 Jan 2022 11:43:15 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3C11F6131E
 for <wireguard@lists.zx2c4.com>; Tue, 18 Jan 2022 11:43:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F70AC00446
 for <wireguard@lists.zx2c4.com>; Tue, 18 Jan 2022 11:43:13 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="UWhDxVOV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1642506192;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UY51soStDeX7hSwfxW/Nourib51ic30YjyXLLEp9HtA=;
 b=UWhDxVOVNcUjzvUjwHhHyZQFX3zZLK5d4RfOkN0lnf3m9KvPS3j6bQjJKu4LDZbLIqNc1D
 LOZX8oz9CBYHnFxK7r275wTMloTj8R9AJqU6I2NYT5FDs0zM946ELlHB3z3o4AyPMb5TjY
 fp/rXFKHgo4ERVJ7g8yCS6L+u4GdKbc=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 58220e35
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 18 Jan 2022 11:43:11 +0000 (UTC)
Received: by mail-yb1-f170.google.com with SMTP id m6so54757735ybc.9
 for <wireguard@lists.zx2c4.com>; Tue, 18 Jan 2022 03:43:11 -0800 (PST)
X-Gm-Message-State: AOAM5327A8a0Pybzxww0zg1X9bLnWJqeLAJ0OkmiFc/BmMigHjyEQ+hC
 VorpYNCCyfMy7noBds9itaJPfCuI+pbKCbJMUxQ=
X-Google-Smtp-Source: ABdhPJyEGJF0pwT3RY1nsH6lCBYOcSCuzgxGWqoaEC3w3XUMUZqr+gElLrE5UBtj52h3avkewVEljTNUn5n2TrbaiKo=
X-Received: by 2002:a25:854f:: with SMTP id f15mr32699113ybn.121.1642506189835; 
 Tue, 18 Jan 2022 03:43:09 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:7110:209:b0:11c:1b85:d007 with HTTP; Tue, 18 Jan 2022
 03:43:09 -0800 (PST)
In-Reply-To: <YeZhVGczxcBl0sI9@gondor.apana.org.au>
References: <CAHmME9rxdksVZkN4DF_GabsEPrSDrKbo1cVQs77B_s-e2jZ64A@mail.gmail.com>
 <YeZhVGczxcBl0sI9@gondor.apana.org.au>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 18 Jan 2022 12:43:09 +0100
X-Gmail-Original-Message-ID: <CAHmME9ogAW0o2PReNtsD+fFgwp28q2kP7WADtbd8kA7GsnKBpg@mail.gmail.com>
Message-ID: <CAHmME9ogAW0o2PReNtsD+fFgwp28q2kP7WADtbd8kA7GsnKBpg@mail.gmail.com>
Subject: Re: [PATCH crypto v3 0/2] reduce code size from blake2s on m68k and
 other small platforms
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: geert@linux-m68k.org, linux-crypto@vger.kernel.org, netdev@vger.kernel.org,
 wireguard@lists.zx2c4.com, linux-kernel@vger.kernel.org, bpf@vger.kernel.org, 
 tytso@mit.edu, gregkh@linuxfoundation.org, jeanphilippe.aumasson@gmail.com, 
 ardb@kernel.org
Content-Type: text/plain; charset="UTF-8"
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

On 1/18/22, Herbert Xu <herbert@gondor.apana.org.au> wrote:
> As the patches that triggered this weren't part of the crypto
> tree, this will have to go through the random tree if you want
> them for 5.17.

Sure, will do.
