Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66CA1C433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  1 Jun 2022 09:54:39 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id d1f530f3;
	Wed, 1 Jun 2022 09:51:46 +0000 (UTC)
Received: from rin.romanrm.net (rin.romanrm.net [51.158.148.128])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id a3328127
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 1 Jun 2022 09:51:45 +0000 (UTC)
Received: from nvm (nvm2.home.romanrm.net [IPv6:fd39::4a:3cff:fe57:d6b5])
 by rin.romanrm.net (Postfix) with SMTP id B460158;
 Wed,  1 Jun 2022 09:51:44 +0000 (UTC)
Date: Wed, 1 Jun 2022 14:51:43 +0500
From: Roman Mamedov <rm@romanrm.net>
To: Houman <houmie@gmail.com>
Cc: Janne Johansson <icepic.dz@gmail.com>, WireGuard mailing list
 <wireguard@lists.zx2c4.com>
Subject: Re: How to improve Wireguard speed?
Message-ID: <20220601145143.75234bd8@nvm>
In-Reply-To: <CABBZOs=kxe4DwHN=utdb8FzDTt3=TcSo05JVAo=-JCUjC_eEug@mail.gmail.com>
References: <CABBZOs=CRGXaYmajx6GLJMU0sxZbda=qDgKsiB_KM_k3DygCJg@mail.gmail.com>
 <CAA6-MF84eCwegH3UcQuqrL7YaCQULf5=KafQYZPVJWATEtfL0Q@mail.gmail.com>
 <CABBZOs=kxe4DwHN=utdb8FzDTt3=TcSo05JVAo=-JCUjC_eEug@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Wed, 1 Jun 2022 10:07:31 +0100
Houman <houmie@gmail.com> wrote:

> I didn't change the MTU settings, but I have a suspicion about MTU. I
> found this article here that makes some interesting suggestions to set
> MTU to 1280: https://keremerkan.net/posts/wireguard-mtu-fixes/
> 
> And beyond that iptables -A FORWARD -p tcp --tcp-flags SYN,RST SYN -j
> TCPMSS --clamp-mss-to-pmtu

So did you apply both of that, and what was the effect?

What are the other point that you test against, is it another VPS (better if
you could try with that), or your home connection?

It could be your home provider has different speed limits (shaping) in place
for UDP. Should be possible to test this with:

  iperf3 -s                        # on VPS

  iperf3 -u -b 500M -c <VPS IP> -R # on the other side

And then see how many "Lost/Total Datagrams" (xx %) you get. A high percentage
would indicate that the actual top speed for UDP is less than 500Mbit by this
value.

-- 
With respect,
Roman
