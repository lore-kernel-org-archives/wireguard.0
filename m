Return-Path: <SRS0=XtlP=3O=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD6A9C35241
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 25 Jan 2020 06:56:36 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 78BA92071A
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 25 Jan 2020 06:56:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="klhfPRzA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 78BA92071A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=honson.id.au
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7282f1c5;
	Sat, 25 Jan 2020 06:56:09 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3f5f669a
 for <wireguard@lists.zx2c4.com>;
 Sat, 25 Jan 2020 06:56:07 +0000 (UTC)
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id eec4ee53
 for <wireguard@lists.zx2c4.com>;
 Sat, 25 Jan 2020 06:56:07 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 77E8321947
 for <wireguard@lists.zx2c4.com>; Sat, 25 Jan 2020 01:56:07 -0500 (EST)
Received: from imap21 ([10.202.2.71])
 by compute3.internal (MEProxy); Sat, 25 Jan 2020 01:56:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=qzctsl
 VlqcubYJxgUZpDHxsWvLNd0BammvkeQ5Zx7dQ=; b=klhfPRzAUtQcWwCDmDNjAm
 YUpVwbOPWU8/Uud2QGqOn+lEQx8eD9YSlyFquWx1eoK6Y0dL/IoT+ZoQhR5sVKPe
 vDQDt9g0MfKh+Yz9P8ZPA7F3j+QEPza5GWKF25GiombRGqFo5z9lxQHEUkP8LsAm
 rRk+vKSRC2bM/+VgMegJHTYq7ejrEkwFlOtvtDYZvl2dmOBF/YF6FQ9c+7P97s9f
 fqQpdMg8Kr1jXOJ4bZTBioldbUB9Kd3xW+sF247SvHUnZPY+vtarzG4F7kan73fe
 is6D/eeApm2cWed3Vo6W/Db5ZnoZpvWB4dpdMIQamUpmqxXkJaer6Ng5z5g7oYTQ
 ==
X-ME-Sender: <xms:huYrXn_d6De7lgrwim6jgPqgXmP5ogTDoniNtn_dyvjS8gqIM7fmLQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrvdeigdellecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhepofgfggfkjghffffhvffutgesthdtre
 dtreertdenucfhrhhomhepfdfuthgvvhgvnhcujfhonhhsohhnfdcuoehsthgvvhgvnhes
 hhhonhhsohhnrdhiugdrrghuqeenucffohhmrghinhepfihirhgvghhurghrugdrtghomh
 dpiiigvdgtgedrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgr
 ihhlfhhrohhmpehsthgvvhgvnheshhhonhhsohhnrdhiugdrrghu
X-ME-Proxy: <xmx:huYrXivKw9i6efskM6NGOVWRrvRGzYwhyiWwrywAF3Jqi45PaOCNdA>
 <xmx:huYrXtRNSgxGrXfEhPxOAh5X11eLIXOMVMAQAgtnhALbYAKqAjtMsg>
 <xmx:huYrXv2wcbouFF-m3mk6sTWcsJgMEt3RDxz4RNhOF4XHeRT0ukQHmA>
 <xmx:h-YrXgx3Mfdk4FSrf20So-dow1NddzRYFh62WWo2Xs_H_mY-dC3wPA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 920C6660069; Sat, 25 Jan 2020 01:56:06 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-777-gdb93371-fmstable-20200123v1
Mime-Version: 1.0
Message-Id: <ea889cc3-9599-4218-a8cc-6daa9d2965e2@www.fastmail.com>
In-Reply-To: <9420fa01-61b9-73cb-21f4-681bf8015b7b@orlandi.com>
References: <9420fa01-61b9-73cb-21f4-681bf8015b7b@orlandi.com>
Date: Sat, 25 Jan 2020 17:55:55 +1100
From: "Steven Honson" <steven@honson.id.au>
To: wireguard@lists.zx2c4.com
Subject: Re: Tunnel traffic in VRF
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Hi Daniele,

By VRFs, do you mean Linux network namespaces, or something different?

If network namespaces, https://www.wireguard.com/netns/#routing-network-namespace-integration talks a little about WireGuards behaviour, but the TLDR is that you need to create the WireGuard interface in the namespace you wish for the outer packets to be bound to, and then move it to the namespace you wish the inner packets to be in, which can be the `init` namespace if you desire.

Cheers,
Steven

On Fri, 24 Jan 2020, at 11:03 AM, Daniele Orlandi wrote:
> 
> Hello,
> 
> I'm attempting to route the WG tunnel traffic (not the inside traffic)
> on a VRF.
> 
> I was able to use an ip rule + fwmark to route outgoing packets to the
> proper VRF, however the incoming traffic *seems* to be rejected due to
> the UDP socket not being bound to an interface in the VRF.
> 
> 00:56:35.606766 IP 172.16.16.32.5180 > 45.66.80.144.5180: UDP, length 148
> 00:56:35.922547 IP 45.66.80.144.5180 > 172.16.16.32.5180: UDP, length 92
> 00:56:35.922680 IP 172.16.16.32 > 45.66.80.144: ICMP 172.16.16.32 udp
> port 5180 unreachable, length 128
> 
> 
> Is there any workaround you know of? Would you consider implementing
> binding to an interface like other tunnel interfaces do?
> 
> 
> (The infrastructure is already present by using the bind_ifindex field
> of udp_port_cfg passed to udp_sock_create)
> 
> Thank you,
> regards,
> 
> -- 
>   Daniele Orlandi
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
>
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
