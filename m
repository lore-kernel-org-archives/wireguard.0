Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 618B2C433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 22 Apr 2022 00:21:26 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 0743c929;
	Thu, 21 Apr 2022 23:49:52 +0000 (UTC)
Received: from mail.wut.de (mail.wut.de [87.193.174.109])
 by lists.zx2c4.com (OpenSMTPD) with ESMTP id 99b7abbc
 for <wireguard@lists.zx2c4.com>; Thu, 7 Apr 2022 08:07:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.wut.de (Postfix) with ESMTP id 7937E4C0002
 for <wireguard@lists.zx2c4.com>; Thu,  7 Apr 2022 10:07:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wut.de; h=
 content-transfer-encoding:content-type:subject:from
 :content-language:user-agent:mime-version:date:message-id
 :received:received; s=wutundwinzig; t=1649318848; x=1651133248;
 bh=Uomzlk9NpgR6mulzDGRFdsuVLP1HJ2uyPlrMVDtTWuU=; b=w6/TDXjXUHiU
 aSEq80j7PvUS7HtjaR6j+2w4PQqqCSgmME3a/6ILJpBocwXc4/F+4gpdireC/jFw
 GWWYvlJSFNd/tr8JZqk7Oh2dvw+0uB+4g34NzTVTWzdTSi6kL1L2aXFF9JguHplj
 SLVCRI4wFI3gCzM2wxwaCXIx3Kex5u2GCAREdiZXnBmDVQzI4NB6lklWZxQ1HMWV
 xDP/9fvYL0rnyrqWTGzA02kTTI+f0jcNbmkzRr4ucfeHwmlmI+gRJEidg4co4YPj
 CmKOry/voTw0pa6EiWTxKVl2CBaGJotGBkJDDnjWDx8rbo+vNMIHoNRlWdrWEl7L
 56PFcq10kA==
X-Amavis-Modified: Mail body modified (using disclaimer) - ms3.wtintern.de
Received: from mail.wut.de ([127.0.0.1])
 by localhost (ms3.wtintern.de [127.0.0.1]) (amavisd-new, port 10026)
 with LMTP id 7SA8gpn6CZ8b; Thu,  7 Apr 2022 10:07:28 +0200 (CEST)
Received: from [10.242.2.5] (unknown [10.242.2.5])
 by mail.wut.de (Postfix) with ESMTPA id 296CB4C0001
 for <wireguard@lists.zx2c4.com>; Thu,  7 Apr 2022 10:07:28 +0200 (CEST)
Message-ID: <03fa1a4e-1693-0016-73eb-49bf9bdc7615@wut.de>
Date: Thu, 7 Apr 2022 10:07:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: de-DE
To: wireguard@lists.zx2c4.com
From: Simon Lindhorst <s.lindhorst@wut.de>
Subject: odd behaviour for PSK with wg syncconf
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Thu, 21 Apr 2022 23:49:50 +0000
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

I tried a little bit around with PresharedKeys an found an odd behaviour 
when I use /wg syncconf/ instead of /wg setconf./

My config:

    /[Interface]//
    //PrivateKey = yGKbadTuMvT6JWven0yh8tJMFMCnpYoDizueu4K9QF0=//
    //Listenport = 4444//
    //
    //[Peer]//
    //PublicKey = Ts7VwZt8Q2QB5fTydQEfTgqfz1u4WIL6YMQKlMKZ6E8=//
    //AllowedIPs = 10.10.10.2,192.168.10.0/24,192.168.0.0/24//
    //PresharedKey=oipUDdsUPj1lYZMSN2jdx66OSvARhRpso2GD1frE3xo=/

/wg setconf /leads to:

    //root # wg showconf wg0
    [Interface]
    ListenPort = 4444
    PrivateKey = yGKbadTuMvT6JWven0yh8tJMFMCnpYoDizueu4K9QF0=

    [Peer]
    PublicKey = Ts7VwZt8Q2QB5fTydQEfTgqfz1u4WIL6YMQKlMKZ6E8=
    PresharedKey = oipUDdsUPj1lYZMSN2jdx66OSvARhRpso2GD1frE3xo=
    AllowedIPs = 10.10.10.2/32, 192.168.10.0/24, 192.168.0.0/24
    Endpoint = 10.40.28.51:37842/

When I comment out the PresharedKey and do

    //root # wg syncconf wg0 "/etc/vpn/wg0.conf"/

I get

    //root # wg showconf wg0//
    //[Interface]//
    //ListenPort = 4444//
    //PrivateKey = yGKbadTuMvT6JWven0yh8tJMFMCnpYoDizueu4K9QF0=//
    //
    //[Peer]//
    //PublicKey = Ts7VwZt8Q2QB5fTydQEfTgqfz1u4WIL6YMQKlMKZ6E8=//
    //PresharedKey = oipUDdsUPj1lYZMSN2jdx66OSvARhRpso2GD1frE3xo=//
    //AllowedIPs = 10.10.10.2/32, 192.168.10.0/24, 192.168.0.0/24//
    //Endpoint = 10.40.28.51:37842/

The PSK entry is always there. But when I change the PSK in the config 
file the PSK entry is correctly changed in /wg showconf/ output after 
call /wg syncconf/.

Is there a reason for this behaviour?


Kind regards

S.

-- Unsere Aussagen koennen Irrtuemer und Missverstaendnisse enthalten.
Bitte pruefen Sie die Aussagen fuer Ihren Fall, bevor Sie Entscheidungen 
auf Grundlage dieser Aussagen treffen.
Wiesemann & Theis GmbH, Porschestr. 12, D-42279 Wuppertal
Geschaeftsfuehrer: Dipl.-Ing. Ruediger Theis
Registergericht: Amtsgericht Wuppertal, HRB 6377 
Infos zum Datenschutz: https://www.wut.de/datenschutz
Tel. +49-202/2680-0, Fax +49-202/2680-265, https://www.wut.de
