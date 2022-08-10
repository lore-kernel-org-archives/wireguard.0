Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9C57C32774
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 23 Aug 2022 13:35:57 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 900bf8b5;
	Tue, 23 Aug 2022 13:35:57 +0000 (UTC)
Received: from mail02.noris.net (mail02.noris.net [62.128.1.232])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id dd626ab1
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 10 Aug 2022 13:14:01 +0000 (UTC)
Received: from [213.95.36.38] (helo=grp03vp.funkwerk.noris.de)
 by mail02.noris.net with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim) (envelope-from <Joerg.Schaffner@funkwerk.com>)
 id 1oLlX7-00017b-Fw
 for wireguard@lists.zx2c4.com; Wed, 10 Aug 2022 15:14:01 +0200
Received: from grp03vp.funkwerk.noris.de (2001:780:202:1::5) by
 grp03vp.funkwerk.noris.de (2001:780:202:1::5) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.9; Wed, 10 Aug 2022 15:14:01 +0200
Received: from grp03vp.funkwerk.noris.de ([fe80::88c2:16f2:baa2:d389]) by
 grp03vp.funkwerk.noris.de ([fe80::88c2:16f2:baa2:d389%2]) with mapi id
 15.01.2507.009; Wed, 10 Aug 2022 15:14:01 +0200
From: "Schaffner, Joerg" <Joerg.Schaffner@funkwerk.com>
To: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
Subject: Android App: dynamic configuration
Thread-Topic: Android App: dynamic configuration
Thread-Index: AdiVOKXoQe4Wfz/5TuC2tx243QVVcgXgi/yA
Date: Wed, 10 Aug 2022 13:14:01 +0000
Message-ID: <8714e55cc33740aab8d1ff53570dff03@funkwerk.com>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.160.0.9]
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Noris-IP: 213.95.36.38
X-Mailman-Approved-At: Tue, 23 Aug 2022 13:35:50 +0000
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

Hi guys,

Is there a way planned to pass a dynamically created configuration set to t=
he wireguard android app? I have this use case as following:

Some devices receive information about a new, dynamically established VPN a=
nd want to connect to it. The information about the IP address, public key =
and so on is received from another Android app. This app creates the approp=
riate configuration set and causes the VPN to start based on this set.

I have seen that triggering the VPN connection is possible. But taking over=
 the configuration set is not possible, isn't it?

best regards

J=F6rg Schaffner
