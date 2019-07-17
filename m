Return-Path: <SRS0=0coH=VP=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: *
X-Spam-Status: No, score=1.6 required=3.0 tests=DATE_IN_PAST_06_12,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FORGED_YAHOO_RCVD,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 993C0C76191
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 18 Jul 2019 07:31:51 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2AD6F2173B
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 18 Jul 2019 07:31:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b="duwfJRS4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2AD6F2173B
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=yahoo.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9a09e230;
	Thu, 18 Jul 2019 07:31:49 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bb0b557c
 for <wireguard@lists.zx2c4.com>;
 Thu, 18 Jul 2019 07:31:49 +0000 (UTC)
Received: from sonic302-19.consmr.mail.ir2.yahoo.com
 (sonic302-19.consmr.mail.ir2.yahoo.com [87.248.110.82])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1d601af9
 for <wireguard@lists.zx2c4.com>;
 Thu, 18 Jul 2019 07:31:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1563435107; bh=97Q8wIQZMV67jcBsyRnM2rMnmNFkDNOSIhguDzweFmI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From:Subject;
 b=duwfJRS4Fg1Wtht/+ADD+V9W0HywMDv60726UyFkEK5c2OCGuyQ537ZofY9/B10seWnyxPtNvLi+LYebfOyTvTW5BSc4BPnPdfXhHRZW9xdn0lrJusjJ/bSmxWbGQgPBq2b+1GEncrAlA4X/FY9IhBTuIVzcqufCPiLtX+WaWJNOAxtHXP8BKp2ZgRSbQ0zzfe4+gReqMgy97PV3Pevv9enrKzs49vTabPIvrotUof3eV4/Ug5EQk0QTumDDH9Oq6HldVHa7XTJcb5HsIGXmyeoOIzDSUaOOS+/ueqbm4CdJdxFKkXjrIkgQI2ZWHH2tC20uWMHOeMUZvyAoUhb/4A==
X-YMail-OSG: O2FrB18VM1loJ80.XPTI9YO7nO6MgwQaFr6KCYVAwlXwO_Vsu85Xk0mGmBkw.Hj
 ofmPXBWdbHJufJrNMJZ1exOnPhoYcf361GCMSK6Jf3B1veKZsLYQZX7RvzqIQKGz.qWudICpU4EF
 50_MxbMqw2oV76vSr7KubAc289495eUUp6IaRsx0WlBopcHnrN8MdMtCI_FKK9hSooYlDquodYA0
 Enl2u7z46kMIJ3RACZm6F_bLqYy7x5p4pOSCgKIG7u4E8fmds4r6zE7EvQcKCrL25SyCi35HwY6O
 qRy29xt5cJn._TmXzCbBZJmliFDTnz86GQSFLDuNc.tswNV.XlA36Vip1Q9YMv3DqH9iT96AgCjG
 YVVVhBuZFPwgFS51iWYydrA0JeYgT.CyDxfgRabwQ8FUT0OMPYxlao408EMYWOl7jFhrCNW_Y3xp
 6EeMpKeb1zz9csmOeDlwkY0f618wW9Ub.NMvrwlx4ObbBQytxlfY8fXoqVfvDOVXKUoCBb8f9ay2
 .ZkXxByvU4RpPTYdowwIWTfwGPNbtMc7mMts9ZZu8mL2wcbm8ZO8UizhCZjqtriwUTXAXIn89Qfj
 0e_Fk3WwTuvVnGVLd3Rh7mIICZP6P.d9DJmgBjpsn2x_ykwvmJJjtUJk1Wlsvx6W4Z.6a16xtAA8
 TB4Jcphbt.T6oFk8vXvpWqqpz8IMHS3q5TO0W8bVmH8TZfzbu2J6yGXcmDfOL9npJEZj5knvJJ9j
 QrjXbkeX0MvG4ksyZfQi2LM9Cv5NgTQjUu.O9twSlNfbX6xvSDRFeoCaoPsqrbH.sOzHMr0E2nyq
 ddUQx0bl8_UqDG3t5OOYnaD8pbBV5yU3JewkjQwNsSCzEk_M_un7zOoD4ipHmv1rQ460iWA_czyr
 G4HxgDOcNviU1UTlzK6DMCM4kxCPvr.U4R3Jei0In93C3z6huB5wYxbIJolY3AcohgXZGc36h6sd
 InblJvQ0pNMMGUwCnfL2.v61vGtNOoxeHabTpPXlcpqaidL8kXukgdqaSiUuXPJEYJt0.sncSqGN
 B6l0iMakdXN6hQ6rHoenqTa0s5BC8bO1ftLHKf2UxDLqdq2eSfDIHkE9FI76jGUOodhmZpcjN864
 .I84.P4cWng_JYu78TOYbtfyEDoVjjWR8E_uuJx0yThlklKX_CvSdPhm2hlFLMVMe2yK5Ah0q9Mh
 eUW4o6HQVcemuSnQ9j31IYaNvI_c5NIXtWYqr5D6mWiG46g--
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic302.consmr.mail.ir2.yahoo.com with HTTP; Thu, 18 Jul 2019 07:31:47 +0000
Received: by smtp408.mail.ir2.yahoo.com (Oath Hermes SMTP Server) with ESMTPA
 ID b27878429003770ab027c78026e4a9c6; 
 Thu, 18 Jul 2019 07:31:44 +0000 (UTC)
From: Saeid Akbari <saeidscorp@yahoo.com>
To: wireguard@lists.zx2c4.com
Subject: Re: Building DPI bypass systems on top of wireguard
Date: Thu, 18 Jul 2019 00:31:38 +0430
Message-ID: <2466995.DtfeoNNQlL@scorpbook>
In-Reply-To: <CAOG=JU+YmuNkYyzW2mfm_SYxnhhi5JuSxJQ1K15_Ct8DTm9nXw@mail.gmail.com>
References: <CAOG=JU+YmuNkYyzW2mfm_SYxnhhi5JuSxJQ1K15_Ct8DTm9nXw@mail.gmail.com>
MIME-Version: 1.0
Cc: Amir Omidi <amir@aaomidi.com>
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

On Wednesday, June 19, 2019 5:11:03 AM +0430 Amir Omidi wrote:
> Hi,
> 
> I've lived in countries under oppressive DPI systems and I want to see if
> its possible to create a DPI bypass system using the wireguard protocol.
> During my time under these DPI systems, I've seen them evolve and grow and
> get stronger and better in detecting various bypass systems.
> 
> In Iran, when there's a lot of political news the government deploys a
> traffic/endpoint ratio strategy. Essentially, instead of blocking specific
> protocols, they block amount of traffic going to a specific IP (or
> sometimes IP:PORT combination if they want to be less strict). This breaks
> every single bypassing solution as they all rely on sending traffic to
> another endpoint.
> 
> The strategy I had in mind was creating a microservice VPN that can be
> deployed across thousands of endpoints with thousands of IPs and Ports. The
> servers would be in contact with each other to "restructure" a packet that
> has gone through to them, and send it off to the actual endpoint.
> 
> Essentially, the client can split a packet into many pieces, send it off to
> a thousand systems, and then get a response back from several servers and
> reconstruct the actual message itself. This would break the ratio based
> detection system. Alongside general hiding techniques such as masquarding
> as https/dns/QUIC traffic, this could be a pretty robust and unstoppable
> system. Especially with IPv6 becoming a lot more popular and maintaining an
> IP ban list much more expensive.
> 
> Thoughts?
> 
> Thanks!

Hi,

I get you man, and I know exactly what you are talking about :)) Anyway, 
here's my two cents.

In theory, yes, but in practice, this is far from being even possible. For 
starters, the amount of overhead it incurs is just massive and unbearable by 
any network; there is some kind of packet re-ordering and assembling involved, 
which makes any slight difference in servers' latencies problematic (let alone 
the packet loss). Also, the communication between the servers is just 
unnecessary and detrimental to the packet throughput.

Even if the proposed solution doesn't sacrifice throughput for fault-tolerance, 
it definitely would be darn inefficient to the network as a whole; so I don't 
think any company or community really wants to implement such an 
infrastructure.

However, the closest thing I've encountered, is VTrunkD project which is not 
maintained anymore, and it's meant to be run on a single server and a single 
client, utilizing only multiple *network interfaces*, not servers and such.


_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
