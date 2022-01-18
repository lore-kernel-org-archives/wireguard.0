Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B24EC433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 18 Jan 2022 12:52:54 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 882f202b;
	Tue, 18 Jan 2022 12:51:11 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org
 [2604:1380:4601:e00::1])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 85042e84
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 18 Jan 2022 12:51:10 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id C20A1B8122A
 for <wireguard@lists.zx2c4.com>; Tue, 18 Jan 2022 12:51:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43A36C340E6
 for <wireguard@lists.zx2c4.com>; Tue, 18 Jan 2022 12:51:08 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="eYC5MTOk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1642510265;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aSiR7YEHvJaKHTnMIILFzOkcmwUIlMPzXsxw9ZnBI3Y=;
 b=eYC5MTOkijSIrXgJ+k9o+9KWJ3k4ZYH2b1OIOqxYemd/Sd4xXrqQDKVRW33Ae06nJH4FCT
 cCOSIY3yudO5RQFcm8ks3iuV4NAKzzceXEV9o61UZZPsYi6N9KD5ZpfdGusTScaPUL57Cm
 dtff/SjvdeOrA9qjq4Wyv6a+4uv4Els=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id db94b8c8
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 18 Jan 2022 12:51:04 +0000 (UTC)
Received: by mail-yb1-f172.google.com with SMTP id g81so55374196ybg.10
 for <wireguard@lists.zx2c4.com>; Tue, 18 Jan 2022 04:51:04 -0800 (PST)
X-Gm-Message-State: AOAM530XkidOWtTpB2BoYq+zGjSOhy0vH9YRzv64wTlbxVM7WQLNbE6Y
 Fv3j5H7+8v9Em2SoWzS6nGDXxJI6Qi7zoMAMWOk=
X-Google-Smtp-Source: ABdhPJwY2ELAn5kS+mwPaaHBQswuJ3oE0RiWfmcengPaj3auGPdAvQB2OXUdKUyLLnqvr41yhKrLp/xzPpJ5HkesbqY=
X-Received: by 2002:a25:bc52:: with SMTP id d18mr3401186ybk.255.1642510262147; 
 Tue, 18 Jan 2022 04:51:02 -0800 (PST)
MIME-Version: 1.0
References: <CAHmME9rxdksVZkN4DF_GabsEPrSDrKbo1cVQs77B_s-e2jZ64A@mail.gmail.com>
 <YeZhVGczxcBl0sI9@gondor.apana.org.au>
 <CAHmME9ogAW0o2PReNtsD+fFgwp28q2kP7WADtbd8kA7GsnKBpg@mail.gmail.com>
 <ad862f5ad048404ab452e25bba074824@AcuMS.aculab.com>
In-Reply-To: <ad862f5ad048404ab452e25bba074824@AcuMS.aculab.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 18 Jan 2022 13:50:51 +0100
X-Gmail-Original-Message-ID: <CAHmME9qqqz80hd4er8eAqYpo1gzLSPVyDub0sfmY0YBEqLeiHw@mail.gmail.com>
Message-ID: <CAHmME9qqqz80hd4er8eAqYpo1gzLSPVyDub0sfmY0YBEqLeiHw@mail.gmail.com>
Subject: Re: [PATCH crypto v3 0/2] reduce code size from blake2s on m68k and
 other small platforms
To: David Laight <David.Laight@aculab.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, 
 "geert@linux-m68k.org" <geert@linux-m68k.org>, 
 "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>, 
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>, 
 "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "bpf@vger.kernel.org" <bpf@vger.kernel.org>, 
 "tytso@mit.edu" <tytso@mit.edu>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, 
 "jeanphilippe.aumasson@gmail.com" <jeanphilippe.aumasson@gmail.com>,
 "ardb@kernel.org" <ardb@kernel.org>
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

On Tue, Jan 18, 2022 at 1:45 PM David Laight <David.Laight@aculab.com> wrote:
> I've rammed the code through godbolt... https://godbolt.org/z/Wv64z9zG8
>
> Some things I've noticed;

It seems like you've done a lot of work here but...

>    But I've not got time to test the code.

But you're not going to take it all the way. So it unfortunately
amounts to mailing list armchair optimization. That's too bad because
it really seems like you might be onto something worth seeing through.
As I've mentioned a few times now, I've dropped the blake2s
optimization patch, and I won't be developing that further. But it
appears as though you've really been captured by it, so I urge you:
please send a real patch with benchmarks on various platforms! (And CC
me on the patch.) Faster reference code would really be terrific.

Jason
