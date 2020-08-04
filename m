Return-Path: <SRS0=Qc6R=BQ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02C13C433DF
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  6 Aug 2020 14:17:58 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F5F123121
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  6 Aug 2020 14:17:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=seznam.cz header.i=@seznam.cz header.b="lxBw7BgT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7F5F123121
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=seznam.cz
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5c08fe0e;
	Thu, 6 Aug 2020 13:53:04 +0000 (UTC)
Received: from mxb2.seznam.cz (mxb2.seznam.cz [2a02:598:2::89])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 0cd13c3e
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 4 Aug 2020 13:04:03 +0000 (UTC)
Received: from email.seznam.cz
 by email-smtpc15b.ng.seznam.cz (email-smtpc15b.ng.seznam.cz [10.23.14.195])
 id 29be78a04652c53b29e26096; Tue, 04 Aug 2020 15:28:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seznam.cz; s=beta;
 t=1596547702; bh=qZluuVkPRcOs7VtR4myix+jWlA/UKuGopm7FF0EVDao=;
 h=Received:From:To:Subject:Date:Message-Id:Mime-Version:X-Mailer:
 Content-Type:Content-Transfer-Encoding;
 b=lxBw7BgTtwymrxcJm11Dtc+5dSXHrKgvwoRQoY60mQqQdLAKxX3J/pY/X2yUueylI
 WQOHzAqyg17Ia4quCU67IU68GP+46+Kr1lmzyf0xK9xkPKuQhfJBVIqtCEJWNbnP0y
 M63ybzPCennqN92EJimNgfYWW/B9YKy6YJ77HLPA=
Received: from unknown ([::ffff:37.9.197.244])
 by email.seznam.cz (szn-ebox-5.0.40) with HTTP;
 Tue, 04 Aug 2020 15:28:20 +0200 (CEST)
From: <scorba69@seznam.cz>
To: <wireguard@lists.zx2c4.com>
Subject: Wireguard sending keepalives even if keepalives disabled
Date: Tue, 04 Aug 2020 15:28:20 +0200 (CEST)
Message-Id: <7iV.N1fS.68VV8Wp67zX.1VAM9p@seznam.cz>
Mime-Version: 1.0 (szn-mime-2.1.6)
X-Mailer: szn-ebox-5.0.40
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Thu, 06 Aug 2020 15:53:02 +0200
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

sorry if this is not a bug and also sorry if I am not using mailing lists =
in the right way (I was not sure where to ask)...

I have a little problem with wireguard. I have 2 devices:
1) Debian Linux server with Wireguard service
2) Android phone with Wireguard app
They are both on the same local network (no subnets, no NAT etc.)

Everything works fine, but I have noticed that keepalive packets are being=
 sent between the two devices on regular basis, even if PersistentKeepaliv=
e is not set.
They are sent like every few minutes, sometimes twice in a row. The behavi=
or does not change even if I set PersistentKeepalive on both devices to e.=
g. 3600 seconds (1 hour).
It seems, that the communication is little bit chatty. I have also noticed=
 that every few minutes a handshake also happens.

The reason I am talking about this is that this is causing unnecessary tra=
ffic and therefore increased battery consumption of the Android phone.
For example on my phone, battery usually drops by 3% over night, but with =
wireguard turned on it drops by 10%.

I know that wireguard is still in development, I would just like to see so=
me information regarding this topic.

More information (including log from android app) can be found on reddit: =
https://www.reddit.com/r/WireGuard/comments/hm4h88/wireguard_battery_drain=
_on_android_phone/

Thanks a lot for any reply
Tom
