Return-Path: <SRS0=CDXv=5U=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86EA2C2BA1B
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  4 Apr 2020 22:42:25 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4038E206CC
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  4 Apr 2020 22:42:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nexmanti.net header.i=@nexmanti.net header.b="dWmrnLLk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4038E206CC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nexmanti.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a92fa229;
	Sat, 4 Apr 2020 22:33:33 +0000 (UTC)
Received: from mail-40131.protonmail.ch (mail-40131.protonmail.ch
 [185.70.40.131])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 472dac69
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 31 Mar 2020 08:29:00 +0000 (UTC)
Date: Tue, 31 Mar 2020 08:36:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nexmanti.net;
 s=protonmail; t=1585643818;
 bh=mG+88kgY8ZDpKjGyWS25cexiVu6SBFMCIPXLUyhsxck=;
 h=Date:To:From:Reply-To:Subject:From;
 b=dWmrnLLkHdDnzK8ycHgWY33zKRIoQewsxWiRi5YuHqEL5DsWVvynX35jComhKeebi
 CKJvstYstrptlOAD5YK/6tLTkwQ9jXyWsxFi9ah5d6aX/OzIarV4BQ26ortVfhp9YO
 na+lq7EMhGp4sz5kwyKAISSmsDA6/pecdtRvqLcQ=
To: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
From: xtus <xtus@nexmanti.net>
Subject: wg set fail to update endpoint if traffic is flowing
Message-ID: <i2UwKoKpd7CcDmlKuf5GHwFTjVhsyWaKbbI_QaLQ5yjGbpBkH7klwefEhR8B7TICn7B4uguk3sK23sExHYpQFUX9txdU-RDQR7w0bCuNj4E=@nexmanti.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Sun, 05 Apr 2020 00:33:28 +0200
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
Reply-To: xtus <xtus@nexmanti.net>
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Hi,

I was trying to update dynamically the endpoint for an interface, using `re=
resolve-dns.sh` or something like the following:

# wg set <interface> peer "<publickey>" endpoint "<FQDN>:<port>"

But the endpoint did not change, even if the `wg set` returns successfully,=
 with retcode `0`.

Changing something like `persistent-keepalive` does work.

I debugged a bit, and I saw that if traffic is flowing throw the wireguard =
interface, then the endpoint change via `wg set` does not take effect.

The set endpoint works only if no traffic is flowing.

Is this expected behavior?

Thanks,
xtus

