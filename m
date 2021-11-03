Return-Path: <SRS0=+otM=PW=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6924EC433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  3 Nov 2021 16:39:25 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 96E0E60D07
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  3 Nov 2021 16:39:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 96E0E60D07
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chil.at
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 153659ec;
	Wed, 3 Nov 2021 16:39:22 +0000 (UTC)
Received: from mail.onetrix.net (eleanor.onetrix.net [86.59.13.171])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 82eab640
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 3 Nov 2021 16:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=chil.at;
 s=default; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID;
 bh=wZBd7/AnKNHRpGobEpkAt62RyWcN+Bqe3L5wfnQmApc=; 
 b=yeECjkFJZ2Kksa8UBzp/CVjrtbpjynHaSbvoUowbLccMSO7uvdvOZW2i1qyEsgcJyETP6w8/YXwPY5HLEuFjw7+eXS83/dxmDL5HvRyZBIJnDsZ9Z2dZuoSBCZcgDxGJEZwYo+vZbYusgF9BOesRfdtPh69X/cu6ARG5AZkKJ+0=;
Received: from [10.5.44.225] (port=32840 helo=mail.onetrix.net)
 by mail.onetrix.net with esmtps (TLSv1:DHE-RSA-AES256-SHA:256)
 (Exim 4.82_1-5b7a7c0-XX) (envelope-from <mail@chil.at>)
 id 1miJI8-0005wE-2D; Wed, 03 Nov 2021 17:39:13 +0100
Received: from [172.22.0.123] (193.238.156.229) by mail.onetrix.net
 (10.5.44.225) with Microsoft SMTP Server (TLS) id 14.1.438.0; Wed, 3 Nov 2021
 17:39:11 +0100
X-CTCH-RefID: str=0001.0A682F17.6182BB31.0007, ss=1, re=0.000, recu=0.000,
 reip=0.000, cl=1, cld=1, fgs=0
Message-ID: <f2766c96-151d-ae9b-8e35-5e57f0c663d1@chil.at>
Date: Wed, 3 Nov 2021 17:39:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: WireGuard connection without interface-address / linknet
Content-Language: de-AT
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
CC: WireGuard mailing list <wireguard@lists.zx2c4.com>
References: <1da52141-2cca-9ebb-e415-af471b14e74e@chil.at>
 <ddc62364-6764-3662-5d76-f720a4a375ff@chil.at>
 <CAHmME9pDZ30wAYYgEe3TNp8pwiEW4TF0Lj=oxsaEsvvoQNGQwA@mail.gmail.com>
From: Christoph Loesch <wireguard-mail@chil.at>
In-Reply-To: <CAHmME9pDZ30wAYYgEe3TNp8pwiEW4TF0Lj=oxsaEsvvoQNGQwA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [193.238.156.229]
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

Thank you for the fix!

Am 03.11.2021 um 17:18 schrieb Jason A. Donenfeld:
> Fixed, thanks.
>
> https://git.zx2c4.com/wireguard-windows/commit/?id=46da2d426aa79725abafdfb615f623ef1d2d9aa2
