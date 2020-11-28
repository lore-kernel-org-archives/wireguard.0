Return-Path: <SRS0=qAD6=FD=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A479BC3E8C5
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 29 Nov 2020 21:02:11 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D3EF0207BC
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 29 Nov 2020 21:02:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=web.de header.i=@web.de header.b="UYB/19e5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D3EF0207BC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=web.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a98cf1b9;
	Sun, 29 Nov 2020 20:55:41 +0000 (UTC)
Received: from mout.web.de (mout.web.de [212.227.17.11])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id cd88fe21
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 28 Nov 2020 16:58:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1606583048;
 bh=+2mbJ5zKkq0gCDAPaOtGGZgtvawRHtKo0ZYTjy0JVh0=;
 h=X-UI-Sender-Class:From:To:Subject:Date;
 b=UYB/19e5vR9jL393G9qqZ8JrbGgDvMtsb6IQXSxFsf8TekLbJsHkmiaxgSR3UyIbm
 znjsI+PpOvWarVCdEVG3YaAYjOQ8qj4mFdgSVN0bmUm8dsI6LaTyN28Bl26HVxIyjW
 MyAOituVAyfYz3Nq+94orQIJylK8Uu9/Pp9TSRIc=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [159.253.115.28] ([159.253.115.28]) by web-mail.web.de
 (3c-app-webde-bap18.server.lan [172.19.172.18]) (via HTTP); Sat, 28 Nov
 2020 18:04:08 +0100
MIME-Version: 1.0
Message-ID: <trinity-8b39e676-4010-4d53-9bc2-9ca84bcf3a85-1606583048495@3c-app-webde-bap18>
From: Henning Ryll <henning.ryll@web.de>
To: wireguard@lists.zx2c4.com
Subject: wireguard on multi user windows ?
Content-Type: text/plain; charset=UTF-8
Date: Sat, 28 Nov 2020 18:04:08 +0100
Importance: normal
Sensitivity: Normal
X-Priority: 3
X-Provags-ID: V03:K1:EJtH/SmlFHhWghi3tRBU8HuMIKth2NKi9dx11nLEMOkZWSWrf0P7reRI3So9iXAS+GfQN
 MHiIeCcoEGVhAG7A6QLSXW40Kg/yhaE/fhf26zsfNKrOsfr7VXfuGqTbnHVkkt1ifs8EyXlhJMCT
 5xZ+eppspqGTmGiF+J8J6PYIT8ZDmThF6c+hGaLhsIj1alJwdMXrIyU5QAnvt+q4w5VHXqoqKOG1
 us4MaiY+bX+y6BV7G8VlPSe6hE07UK067dEFRCHpHvfd6PPBRXD2sJpQXdvOohQM36L3IOSF9x8j
 Tk=
X-UI-Out-Filterresults: notjunk:1;V03:K0:FHmMqIFiUYo=:53WrCnwxqAiXQHH6FgzNcf
 Vtrg7kKbma2eWVn3F2BjYSa0FCV59TA1C+SqNb/4M5LqREkx/aC6dt4nVgMxQK+cRzb2WF90p
 EEFMLBzNTCYjbTcLs3J1ZUzfFTYoT/WoDYR7vAPgJTbXHMIBGydYMFS+BcdyFM2E5ZvTFIQUa
 YUxYUcyDhW2JOzY0LNIX+zwLCDBpCwO8xswEbB4q+DKbECLopfXudVWtWALiynfCZ0VWTTR+l
 3/M/RItoTnai34k4Rp1lT4x3SY/iCdp32JOc4wDd44DqdaqF1yUA8rMRwsTKhoAMAOCdE9iuf
 3wpZl4N6x1G8zjvYkQOV+Uv9IP7GCG37C3aCc5cisEGuApL/q2PIrzg7A0rX45SsHtx+0U/7R
 8Y9BohgDwYHMSj2WkQ71FQJwg65zrVNQ/6ZCVE787FxwymiZPiNrpmNWhIrEqMqvbc0oQVV33
 zRGPylPHQlIFVsdI94n2laVLJ0XV8yep65lJGUj6KkRLxDd/0P7bmm4/7O5mjpmBUldeEXUK3
 0F4/ttTpoTHWtTd/a6dIQvWiOep7ErwR9GLuDdqnJdwT4gCmoBMPx6nEJLnPYPCbSGwuuMfUS
 uvUtEqa3COxP8=
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Sun, 29 Nov 2020 21:55:40 +0100
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

Hello,

I'm looking for a (more or less) secure solution of installing and running=
 wireguard.

In our family we have only one notebook running win10/64.
Since this is the only device with internet access it has to be reliable a=
s possible. So we are running 4 accounts.
admin, father, mother, son. Of course only the admin has admin rights. But=
 all users have operator rights because the notebook is taken to different=
 locations i.e. at school, to friends, during holiday.

I'm running OpenVPN to do my homework with this notebook too. And because =
my openvpn.p12 file is protected by a password my family can not use it be=
cause the did not know my password. Even if they have physical access to i=
t.

But with wireguard there is no such protection. And with the new wireguard=
 for windows the key files have been moved.
And as far as i undertstud everybody in the operator group can start the w=
ireguard tunnel.
But my chief will be very very unhappy if this will occur ....

How to install wireguard on a multiuser system. And only the owner of a ke=
yfile can run his tunnel?
Other users may be able to run other tunnels.
Or is wireguard still unuseable for me and I have to stay at OpenVPN?

Henning
