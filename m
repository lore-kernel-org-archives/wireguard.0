Return-Path: <SRS0=sOGU=ER=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FAKE_REPLY_A1,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 533AAC388F9
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 11 Nov 2020 11:31:13 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 541B92074B
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 11 Nov 2020 11:31:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=web.de header.i=@web.de header.b="ngBCW8oN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 541B92074B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=web.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 931badbe;
	Wed, 11 Nov 2020 11:27:21 +0000 (UTC)
Received: from mout.web.de (mout.web.de [212.227.15.3])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 581eb453
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 11 Nov 2020 11:27:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1605094265;
 bh=A4dq2PAJiYVBuJ4vzaw2Hx0aKEDBD1aKkD2JnBCK/4g=;
 h=X-UI-Sender-Class:To:From:Subject:Date;
 b=ngBCW8oNmPqNAScVP9+HzQ0vJXKRLCh9gmIa+230RVjyv/3OytfPLtzo0rp/mE2Gz
 c/MADLk2QZmdluUVdqeJM4zgUSo0iwdj5Ny5+MBSEOUQX4pPiDO/1wbom3uMoT75CR
 LvB0C6+uFP+4s5lqoh5AZGxEMEoACsdRUdoTrXsw=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.10.34] ([77.21.105.134]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MG9DE-1kXMHN2EbU-00GcuM for
 <wireguard@lists.zx2c4.com>; Wed, 11 Nov 2020 12:31:05 +0100
To: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
From: Stefan Puch <s.puch@web.de>
Subject: Re: Add local DNS forwarder to Windows client
Autocrypt: addr=s.puch@web.de; prefer-encrypt=mutual; keydata=
 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
Message-ID: <09450cbd-ae78-bf1a-a9ba-364f20731b7d@web.de>
Date: Wed, 11 Nov 2020 12:31:04 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:nHJ6Jc/sWY4LziAVssa0quaJwKPtodoZAKIm72pcLhM5iBwy55G
 j86liVQze3M2uxyokU40OW4vNb8O9cHB2N7SpTC70gALkg7si99S4xpG57a3DYWMlieOGRu
 IdgPea6q8HQJQY0WCwz4gXZelAh/GQQ/vcHnF2Q8ajzt6pNQrBjAh8t14RKOA+hk70ynm0y
 IAvgGQBMLSDARlubD3OlA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:t6e70lO8MUs=:l2R/GBcawOf+0nuQYMn9oX
 ZzcnXiKbIN6L8NxromF6pQn+3TJGLvuiuPR22Z/kKh2B0pKQTLCEC2gemLvc7BZyx2NmfeuT0
 ajXIm8ivgH9btWiSnFsFMVBi6m8WitqAfAfk7S8KIPqNZ5+VZJ7oppwb6Tx5pSc1h35/OQk/a
 Za6IywdH6DjDlgjn8pfUN4t/D1XFPjEBL7oAx9+gEQ8QX6d+U5CHef8nBwhhl1jyGK+1dC2ln
 7EWlPENBRbNGLhp0NhihwNP88Tn1I9CQ6g/QnHnHfSoPb8u/fWEx4apmcGcIxgGwmr3hbAjxH
 ErBlrIKNmXjGlybsmxC1OXBdT48wvvAv/87NP/808M429cmrFhJd/ToSP1goXQsicwRDOd3RK
 OlVExYjmUMebOOjTulJhBHSpO0dk7iX7Vh9+UBp3NFMLTmE48Qe21R3OIqguBNxR1Vo4Db3XM
 Fkv8G7DDqzhAdakrII58bE3izHrHPICC3mzB5orbs8XzOxoV9MuT1NdusdyDaIBnsfk7AyF9v
 nYs1cuTscKUAZ3IqRqMakBiYgODWMYxyaAoMLs3+nOgoObAdnWOfL57K+BsgaOF5zC2cE8ScW
 Rim2OIDEJ5xNldhsUWuIPcWBgyUqwdMvkkaSLUQ4VfnlbIj1LvKSZjURXsPIvK2gyzUF1gUz8
 LtCf4WNOAdOT32zSIr7G/y7w3y5OyrYLIb8f2SL8/wUQHpoenVNeut52SyBDD5y9MrEEnahvp
 Xiir0nUBZ9Ojtfea2wm2LtPNy5jg65F6WpI4yzZLoO779RD2gRV9pGi795DpbrNhEAb5DP/bd
 AVfuknPHm1+wl+pWiB23FfzxNiZOQqUdx3BRvvcmSk33tTKycexUjRGOQdADB/7mIfrHlUONN
 +mLz8P1mk2aeO5ooEyuw==
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

Hi Yves,

i can reassure you, the problem is not exotic. I had exact the same questi=
on in
mind when thinking whether I should move from OpenVPN to Wireguard (I'd li=
ke to).

For all people working in home office therse days where they're using some=
 kind
of SOHO router (e.g. Speedport, Fritz!Box, what ever) I like to "push" the=
m the
companies DNS server for the time they are connected without forcing them =
to
install additional software / python sript, modifying hosts file with stat=
ic
IPs. Although OpenVPN has many disadvantages, the way it is possible to ju=
st
push a search list or name server is very comfortable.

My experiences with tutorial are exactly the same as yours and I (as a non
expert) would like to ask whats the intended solution on windows systems t=
o
include a companies remote DNS server for the (limited) time period connec=
ted to
a VPN by leaving the local DNS (mostly handled by the SOHO routers) untouc=
hed?

Maybe I missed something, but adding the "DNS" directive to the client
configuration has exactly the behavior Yves elaborated on and so far I did=
n't
find an alternative solution.

Kind regards
Stefan

> Hello,
>
> I've already used WireGuard to connect to private networks and it's
> quite easy once you figure out how to set it up. (Most tutorials are
> outdated and haven't been updated, new ones haven't been written.) One
> thing that's really missing however is DNS support. All I can do now
> is connect to IP addresses. Names are not resolvable on the other
> side. If I add the "DNS" directive to my client configuration, it
> replaces the local DNS resolver and *all* lookups go to that server
> instead. This isn't working either because I'm on two local networks
> and each has its own local DNS server that can only resolve its own
> local names (and forward the rest to the internet).
>
> Specifying both networks' DNS servers also fails because when
> resolving a name, one of them is chosen at random (and the other one
> isn't regarded) and then you won't be able to resolve some of the
> names some of the time. This is also very frustrating. And it wouldn't
> scale to multiple active tunnels.
>
> The solution I've read about is to set up a local DNS forwarder that
> can be configured so that it uses multiple servers and queries each of
> them and returns only a positive response. This way it could query
> both local LAN DNS servers and for local names, only one of them would
> resolve the name. This is a bit complicated to do if you're not
> permanently connected to a VPN, or if you move from one local DHCP
> network to another (like with a laptop). And it requires additional
> software, setup and configuration, and probably intensive maintenance
> and care. All of this makes WireGuard a pretty ugly alternative to
> OpenVPN where all of this already works. Despite all the disadvantages
> of OpenVPN.
>
> I'm asking if it's possible to integrate such a local DNS forwarder
> into the Windows client application. I imagine it would start up
> automatically once the first tunnel is activated. And it would replace
> the local system's DNS server setting for as long as it's active (like
> the tunnel-configured DNS server already does). And it would query the
> original locally configured DNS server and all configured DNS servers
> for the active tunnels. It would then be able to resolve local names
> and tunnel-remote names without any additional work on the user end.
> The user wouldn't have to perform many complex tasks upon activating
> or deactivating a tunnel. This would make WireGuard be as simple and
> productive as I believe it was intended to be (but isn't yet).
>
> This probably stops working as soon as other VPN software is used in
> parallel, but the current "DNS" setting has the same limitation, it's
> better than nothing and most of the time, you only run a single VPN
> software.
>
> Please let me know what you think of it.
>
> -Yves

