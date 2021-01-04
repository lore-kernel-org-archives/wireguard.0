Return-Path: <SRS0=t67z=GH=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CD82C433DB
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  4 Jan 2021 20:41:34 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6EF62216C4
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  4 Jan 2021 20:41:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6EF62216C4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=wolff.to
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a764f8ba;
	Mon, 4 Jan 2021 20:30:38 +0000 (UTC)
Received: from wolff.to (wolff.to [98.103.208.27])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with SMTP id ba59615e
 for <wireguard@lists.zx2c4.com>; Mon, 4 Jan 2021 20:30:36 +0000 (UTC)
Received: (qmail 30170 invoked by uid 500); 4 Jan 2021 20:25:15 -0000
Date: Mon, 4 Jan 2021 14:25:15 -0600
From: Bruno Wolff III <bruno@wolff.to>
To: Joe Doss <joe@solidadmin.com>
Cc: Jack Craig <jack.craig.aptos@gmail.com>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>, Silvan Nagl <mail@53c70r.de>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>,
 Neal Gompa <ngompa13@gmail.com>
Subject: Re: Wireguard not available for CentOS Stream
Message-ID: <20210104202515.GA30080@wolff.to>
References: <a79af0c5-ad54-2b17-964b-9e7891064335@53c70r.de>
 <176cafeade8.27b6.fd5e59abeac6319e4fe4e8192ea7d08d@solidadmin.com>
 <CAHmME9pzOrvHX2bVcHVHh44_j1P_bYaz+o-wCnjnEgxoMeZCyA@mail.gmail.com>
 <CAL0FmdWzknetT9raQcr_BhJwSWSBKPxXZocHSr2TT6bz2QihSA@mail.gmail.com>
 <f1b8bbdc-d669-7236-6632-2c8c48f78b3b@solidadmin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <f1b8bbdc-d669-7236-6632-2c8c48f78b3b@solidadmin.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
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

On Mon, Jan 04, 2021 at 13:42:22 -0600,
  Joe Doss <joe@solidadmin.com> wrote:
>On 1/4/21 1:20 PM, Jack Craig wrote:
>> how is fedora looking? is it stable enough for a small home network?
>
>It's in the Fedora kernel and I use it daily. It works great and it is
>very stable.

Wireguard works fine in Fedora. I have two laptops that route everything 
but dhcp to my home router (no matter what network they are on) via 
a wireguard tunnel. My home router provides them with endpoints that have 
static IP addresses. I also use it for my work desktop so that I can reach it 
from home even though it is behind NAT.
