Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43138CCA47B
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 14 Jun 2022 09:52:55 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 5b2f3b50;
	Tue, 14 Jun 2022 09:51:41 +0000 (UTC)
Received: from iedub0.y7.hu (iedub0.y7.hu [2a05:d018:563:7900::25])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id dd8c76f8
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 14 Jun 2022 09:51:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=wg-ml-rkaofgr.redir.email; s=may2017; h=Message-ID:Content-Type:
 MIME-Version:Subject:To:From:Date:List-Unsubscribe;
 bh=v1it6OLw3aADYAddlMOiSOY96vqpiv+lMyHy40bnpiU=; b=JkjQ8iy40cAQnuSyoOMY4PNAxY
 UajMgcQZWHDHcZau4K0CRRaG/KlMpBEa42qxtc4n5R+jedGt2sD/DLbfc5jPVM65lNqwbevH6btl+
 /8uBgwRI3+NeddHWil+FgzmeWLKgKSBC7erjVVTkx4H6ybZXYlGkfmfOFX1Bx8Vkkkhbmdf24ECpt
 KCdCP4Xv/vK6rnlvPXlqPhs5LRTnjvuR5JeC/QpR8xTx0z9AgiFgHtT2Tsb1RHzlEx6hlNXwz5MKB
 kEd+suwFmYubEcb3a61P6pD3sR6Mrji30RUiFbH/qN+9DEoTf+P9tU5LCM8dzcCrV4JdKLuPP3sus
 hkIMxNNw==;
Received: from localhost ([::1]) helo=localhost by localhost with ESMTPSA 
 id c0b24e8e56a672859849ebdd1563ba38
 for wireguard@lists.zx2c4.com; Tue, 14 Jun 2022 09:51:39 +0000
Date: Tue, 14 Jun 2022 09:51:07 +0000
From: Endre Szabo <endre.szabo@wg-ml-rkaofgr.redir.email>
To: wireguard@lists.zx2c4.com
Subject: Re: How to generate the QR Code
References: <CAC9cSOATKiXuaFO8UQZezP7RLebBoo-UWwM-KQJMEwhg_-+VTw@mail.gmail.com>
 <CAC9cSOBv7Zkj0uPqyaBDKC+aiwOzTrbjNGUP41iyKZb9u2i-Lw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAC9cSOBv7Zkj0uPqyaBDKC+aiwOzTrbjNGUP41iyKZb9u2i-Lw@mail.gmail.com>
Message-ID: <c0b24e8e56a672859849ebdd1563ba38@wg-ml-rkaofgr.redir.email>
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

Hi Philip,

While it is not complicated, it is not that simple to generate the QR codes just based on the Mikrotik configs. QR codes are basically encoded config files for the clients. And the added complexity is that they have the private key in them as well, which I'm sure you have on file somewere, as you had to give Mikrotik the public counterpart of that keypair.

What I really miss of the QR code config file is a 'metadata' field that should function as a 'connection name suggestion' the user can accept (or edit as prefilled connetction name field) upon QR code reading. This would be really handly in case of a lot of connections to add to a phone.

--Endre

On Fri, Jun 03, 2022 at 14:40:47-0400, Saint Michael wrote:
> Dear friends
> I have a Mikrotikotic router and configured all that is necessary for
> the VPN.  I also configured a windows client for testing. Once it
> worked, I downloaded the Wireguard app from the Google Play Store. The
> question is, how can I generate the QR Code so all my employees can
> use it on their phones?
> I could not find the answer.
> 
> Philip
