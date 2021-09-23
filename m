Return-Path: <SRS0=9kqO=ON=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 911C8C433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 23 Sep 2021 14:43:26 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A2EA1610C9
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 23 Sep 2021 14:43:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A2EA1610C9
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=anatoli.ws
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ad9ef167;
	Thu, 23 Sep 2021 14:43:23 +0000 (UTC)
Received: from out-mx.anatoli.ws (out-mx.anatoli.ws [177.54.157.124])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c93a89a7
 for <wireguard@lists.zx2c4.com>;
 Thu, 23 Sep 2021 14:43:20 +0000 (UTC)
Received: from [192.168.0.1] (unknown [192.168.0.1])
 by out-mx.oprbox.com (Postfix) with ESMTPSA id 1F0641E00BCA;
 Thu, 23 Sep 2021 14:41:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=anatoli.ws;
 s=vnptcm0lqn; t=1632408120;
 bh=RgHi4aOiJo9hXkGLk6zU1Ojn476SFinsmFRD/DqhyIg=;
 h=From:Subject:Date:References:Cc:In-Reply-To:To;
 b=Terh46j4m/YsR35dzwFC5X1DINBs+wc/uZHJugdCTAG4aVPNONgl1oCljIlcw0/2c
 QrkJIpCUGBcZ97K9peT5D8WmKuRrGE469Zqh3Z2QPk40ZWE/yHXW865Wty4I4oonKi
 qzUqvWMd7Kcmo3g6W+T93y/hEI2aEbHf9EDwoPYanbbeaf58gJdjUgJt7wgDk3iv7q
 DJiHxWRBhUFMfvIvQSCEJsqS9ZwM6pjXLJt1xbJOCP5keU8akG/HeEyAiOrZrdh6XE
 0T1svf/Zaec3OPEAbSGZ2RcGyCn+ahtHsQODOYzJfohxxsr2HkBYTB2dtNA4ULdISs
 6ruZYOYN0iZpg==
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Anatoli <me@anatoli.ws>
Mime-Version: 1.0
Subject: Re: WireGuard Configurations Gone After iOS 15 Upgrade
Date: Thu, 23 Sep 2021 11:41:58 -0300
Message-Id: <F238DB7D-1876-4821-ABC2-4FCF029FBB2B@anatoli.ws>
References: <CAHmME9oKfJJfnrKeXcaHeb-oa+JZ+OgnxLVny==uSgwa5c5sKA@mail.gmail.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
In-Reply-To: <CAHmME9oKfJJfnrKeXcaHeb-oa+JZ+OgnxLVny==uSgwa5c5sKA@mail.gmail.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
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

Great! Thanks for a quick solution!

Please let us know in this thread when the update is in the AppStore.

> On 23 Sep 2021, at 01:14, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>=20
> =EF=BB=BFHi,
>=20
> Fixed! https://git.zx2c4.com/wireguard-apple/commit/?id=3D03a59ff38e96fb3b=
b5dde2f15fe42198d1dfb995
>=20
> Thank you to everyone in this thread who helped get to the bottom of this.=

>=20
> Jason
