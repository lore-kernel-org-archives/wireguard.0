Return-Path: <SRS0=FSGf=3N=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E030C2D0DB
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 24 Jan 2020 16:02:07 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 91973206F0
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 24 Jan 2020 16:02:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 91973206F0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=viisauksena.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0a351240;
	Fri, 24 Jan 2020 16:01:53 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id dfd05048
 for <wireguard@lists.zx2c4.com>;
 Fri, 24 Jan 2020 16:01:51 +0000 (UTC)
Received: from viisauksena.de (rauberhaus.de [178.254.39.111])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5f636d7b
 for <wireguard@lists.zx2c4.com>;
 Fri, 24 Jan 2020 16:01:50 +0000 (UTC)
Received: from [192.168.178.54] (pD95F617C.dip0.t-ipconnect.de [217.95.97.124])
 by rauberhaus.de (Postfix) with ESMTPSA id C76C7206C6
 for <wireguard@lists.zx2c4.com>; Fri, 24 Jan 2020 17:01:49 +0100 (CET)
Authentication-Results: v32412.1blu.de;
 spf=pass (sender IP is 217.95.97.124) smtp.mailfrom=jens@viisauksena.de
 smtp.helo=[192.168.178.54]
Received-SPF: pass (v32412.1blu.de: connection is authenticated)
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
From: jens <jens@viisauksena.de>
Subject: wireguard-hosts file
Openpgp: id=AB0F97125ABF0FAEDEFBDB8B507EB93F6F6DEE01
Autocrypt: addr=jens@viisauksena.de; prefer-encrypt=mutual; keydata=
 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
Message-ID: <674aac2b-1b4c-022c-0e4d-596529dce78f@viisauksena.de>
Date: Fri, 24 Jan 2020 17:01:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="------------5840F8F28C14A75AD5D4EA20"
Content-Language: en-US
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
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

This is a multi-part message in MIME format.
--------------5840F8F28C14A75AD5D4EA20
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

i really would love to have a feature like wireguard-hosts file.
whereas wg command would print given "name" instead of key - so the
output would be more meaningfull
We have some wireguard running in server like infrastructure, where one
server serves dozens of "clients"

so instead of
peer: l9FxaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaU=
we would have something alike
peer: superhero downtown

some of you may be familar with batman-adv layer2 routing protocol,
there they also have a batctl which is working pretty similar to wg tool.
there you can add a bat-hosts file which is doing the job, which totaly
works likes any hosts file
a normal hosts file maps ip to name,
a bat-hosts file maps mac addresses to name,
a wg-hosts file would map keys to name.

i found the sources for bat-hosts ( .c .h .sample ) here
https://downloads.open-mesh.org/batman/releases/batman-adv-2019.5/batctl-2019.5.tar.gz

is this something maybe usefull to other also?
is there a chance to have this implemented by default?

thx for answers.
fuzzle

-- 
make the world nicer, please use PGP encryption

--------------5840F8F28C14A75AD5D4EA20
Content-Type: application/pgp-keys;
 name="0x507EB93F6F6DEE01.asc"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0x507EB93F6F6DEE01.asc"

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
=tOCZ
-----END PGP PUBLIC KEY BLOCK-----

--------------5840F8F28C14A75AD5D4EA20
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--------------5840F8F28C14A75AD5D4EA20--
