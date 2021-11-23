Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC373C433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 23 Nov 2021 23:05:07 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 917b972c;
	Tue, 23 Nov 2021 23:03:04 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 06a4074f
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 23 Nov 2021 23:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1637708582;
 bh=EF+SU6fdzyQUPvj+yMEHP0ZXMf0lvNYuW8FjRp63liY=;
 h=X-UI-Sender-Class:Date:Subject:To:References:From:In-Reply-To;
 b=lkHDxhal36BqSsDHJpzE4nEB+irx5TpjTR0zipCXAuwg1DSp48IuX49a+Pih2COBM
 Af9c85Uv6SfHZcY+Qb33UKhVSKhmK1bJPEh9qM3ULsTfUsztJXWMuwR7NaX1y6Tnon
 XxRHid+GdBldid96bgj35UqIrNtSR5H2ehvdNFGg=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.1.3] ([93.198.60.174]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MYvY2-1nBXHS3GLo-00Uo46; Wed, 24
 Nov 2021 00:03:02 +0100
Message-ID: <3b6549b1-7ed0-00fc-2951-fc77049faf13@gmx.net>
Date: Wed, 24 Nov 2021 00:03:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: Dynamic routes
Content-Language: en-US
To: Jonathon Fernyhough <jonathon.fernyhough@york.ac.uk>,
 wireguard@lists.zx2c4.com
References: <3c70475b-64e5-acf7-819c-94f721fed8b6@gmx.net>
 <edfa128e-7c6d-c329-5d63-4a3b32c2517c@york.ac.uk>
From: Robert Dahlem <Robert.Dahlem@gmx.net>
In-Reply-To: <edfa128e-7c6d-c329-5d63-4a3b32c2517c@york.ac.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:lJMniz0klx9gY/RTgfGc4/07ewtqzwYn2WWzQGPCNQa+H7kRkLv
 +ct3YWPrhRSHva5/nhibx3IjhZ7Jpf61cn8beIxBMlsml4kjFRgWwvQIkfnYI5bl//7aTDm
 tLcPyONs7gbtruEtBzepaP9QniRW2PlK8l8Zh5yZ/I3ddGL4QH4rioH1kaJFFTCp7GhsSjs
 yuBoKPCXk1galvkHgBrBw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:mXr9GgBNANA=:GyjWxf58LGJnSy3TsDZooz
 fb/oYEtb12Z3n6Kdymw2PxxGMonY6P77hoOk+Z2a+yFEuiyRHA2Fjs0yseX+cXg8i60zgoyD6
 GsG48kahtytlUaQx2VwKGsaMMm9FfE8grXrZxX3OmJWhJeQV2fSfCJ5IFJoNO0RAm17iORwR/
 f0lJ9W0bdSYOijsvv4lCVI9W96DlA3TUj6W8eemeKd7RiSawxMT0eK+amPvJptWud6aes+ggb
 t3jQMkaBDnWkyDbuxwhvdizyoVxPAFuBVfKNzNmci/8MDmr2rEGpSE5gYOQWzxa/r+F6sCaxF
 T+9FhgUEkdmni3whHNxL5Wyfz1Lva2Vr8otxJ9EhBcdNr/mI/ehEBERlEjTcf/TL0nBOTDXB/
 rp/wTifc0u/IKVdYXiaowX0jzud/tstVh2f/B1cwyvh17nG5FJkUriRRcbpirx/zuw21p1m6X
 xO8/gvgQc/l6nJWcRbw/NGeXW2sVhVjdiGUTeHzeWCj0eSwz8tyUH04Rv5VnZTjysSx1+0XpR
 EKomqmhv8JM0S5CtBPqg+P+rQL4jLpoXq6WfM/HO3HkYVYE2vblR/sdpZyvv3SP9aei+U/ze7
 92ORORJCx3lybTVTY7fI3QVUV4i87r18mgddtqvSCvUWZXHOe/minca7QD8J+NqKPdbwGwEFS
 v4yRXN/qAHZ0Ur9h4tdS7SSVZkwm9tTFEW4wLJq1x7P6qq4L0GJCUnDludtO9az/45MAyMCeI
 JtCu/xANbKem5XPhV4RuLtM2LBRp330qsCTfWHoWvgbNJ0cFTQSAnc71e1ZDkm3BSHJa9JwrS
 lNaSDCvzXSWhmFb/ndHde6/Df7HqX8ReTXp447c5KeoZJSHBpFTdArfE9/rJI2NRA5GdCCGf3
 CmaeuUlGcL/tL3J1OQE2RC+y2lNfn/RnonX/nJTd38EpuDqICefOM2wxqKiZ26ba35n5ELow8
 KBwHpiEtRzvrhVpWzWiuu8luU3BPBFcBmtkaR+beNWHA+HlpeqUQ+IxGqXwfHgfeFSczKPK4H
 1Tx/uex9FIHlilPYWD0EpOrvmzhPJGFlL+3LwYuF7TMG5z2yVcp15GwWv6bfr/Cj4dKtiyy2X
 k1O5gXqnVZQlSA=
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

Hi,

On 23.11.2021 23:40, Jonathon Fernyhough wrote:

>> The idea behind this is to have redundant tunnels. Let's say a Wireguar=
d
>> client has a preferred server and a secondary server. Packets should be
>> routed through the preferred router while that tunnel is established an=
d
>> through the secondary server when the preferred server is not available
>> for some reason.

> Would route metrics work for this?

Yes and no.

Metrics do useful things when there are identical prefixes with
different metrics over *working* paths. So when both tunnels are up
metrics can choose the preferred path.

With Wireguard (as far as I understand it) routes exist independently
from tunnel state. If the path through the preferred server has a better
metric, but doesn't work, the system does not fall back to the path
through the secondary server.

Metrics work fine when routes are installed/uninstalled dynamically. Say
you have a system with LAN connectivity (best metric), Wifi connectivity
(medium metric) and mobile (UMTS/LTE) connectivity (worst metric). All
of them give you a default route. If all of them are actually connected,
the system would use the route through the LAN. As soon as you unplug
the LAN cable, the LAN routes disappear and the Wifi routes are
selected. Plug the cable back in, the LAN routes reappear and the system
uses the LAN route.

Yes, metrics would work for this. But only if the routes don't appear
before a tunnel comes up and disappear when the tunnel goes down.

Regards,
Robert
