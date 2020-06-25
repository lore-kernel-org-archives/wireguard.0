Return-Path: <SRS0=lnZX=AG=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFB1EC433E1
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 25 Jun 2020 04:49:32 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 427C420773
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 25 Jun 2020 04:49:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 427C420773
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 62917a25;
	Thu, 25 Jun 2020 04:30:14 +0000 (UTC)
Received: from mailer21-21.incnets.com (mailer21-21.incnets.com [210.6.92.28])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 538ce7f6
 for <wireguard@lists.zx2c4.com>;
 Thu, 25 Jun 2020 04:29:18 +0000 (UTC)
Received: from outguard14.hkbn.net (outguard14.hkbn.net [203.80.96.171])
 by mailer21.incnets.com (Postfix) with ESMTP id C588B3C8;
 Thu, 25 Jun 2020 12:46:55 +0800 (CST)
Received: from localhost (unknown [127.0.0.1])
 by IMSVA (Postfix) with SMTP id 17FA518046;
 Thu, 25 Jun 2020 12:48:22 +0800 (HKT)
X-IMSS-HAND-OFF-DIRECTIVE: mailer2.incnets.com:25
Received: from outguard14.hkbn.net (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E276218046;
 Thu, 25 Jun 2020 12:48:17 +0800 (HKT)
Received: from smtp-out1.hkbn.net (unknown [203.186.94.55])
 by outguard14.hkbn.net (Postfix) with ESMTP;
 Thu, 25 Jun 2020 12:48:17 +0800 (HKT)
Received: from mail.wonghome.net (119247088063.ctinets.com [119.247.88.63])
 by smtp-out1.hkbn.net (Postfix) with ESMTP id 26D5B1FD;
 Thu, 25 Jun 2020 12:48:14 +0800 (CST)
Received: from [10.10.10.3] (redcat.wonghome.net [10.10.10.3])
 (using TLSv1.3 with cipher AEAD-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.wonghome.net (Postfix) with ESMTPSA id C424C1699B2;
 Thu, 25 Jun 2020 12:48:14 +0800 (HKT)
To: wireguard@lists.zx2c4.com
Cc: jason@zx2c4.com
References: <20200624060722.GA686091@zx2c4.com>
Subject: Re: Trying out WireGuard's kernel support in OpenBSD's -current
 snapshots
From: johnw <johnw.mail@gmail.com>
Autocrypt: addr=johnw.mail@gmail.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <8b294585-d716-c0ff-187c-31dd53ec91b5@gmail.com>
Date: Thu, 25 Jun 2020 12:48:14 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200624060722.GA686091@zx2c4.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSVA-9.1.0.1817-8.5.0.1020-25502.005
X-TM-AS-Result: No--2.086-9.9-31-10
X-imss-scan-details: No--2.086-9.9-31-10
X-TMASE-Version: IMSVA-9.1.0.1817-8.5.1020-25502.005
X-TMASE-Result: 10--2.085900-10.000000
X-TMASE-MatchedRID: csPTYAMX1+ED2QmRwzCHI9VCGpNc8DjMJjYlNwVSYpW9K1jOJyKSazTM
 oY8bKfiG7VWYfBYY7Ruhfz7iiBMY4iSWJfVcNvvyJmbrB1j4XwouAm3+nk3vKVbDmwy31ULEC9N
 uajObRowUZUhkJsgtdDCrtCbmVe+eofaD2zI+zzwvLP1C8DIeOnpDIEzkG1Rb8TLfwlh63+ieAi
 CmPx4NwFkMvWAuahr8SdYcU20LEFNQSFbL1bvQAcK21zBg2Klf60srZ0hCv1KygdU4vHB3VyHfX
 aFkoqUxD0m+hJtaSoHQcoFZ+VBH+oFvbWZrgmEaPnUf75tTESmSKgyxYhC+AGTWvufawSs/GD0t
 oMU1xuGokjGX+cQbGqJ8H5bjE+NwIXTz6j3Z23JaIwu3sWSjtcC+ksT6a9fy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-12:0,22:0,33:0,34:0-0
X-Mailman-Approved-At: Thu, 25 Jun 2020 06:30:13 +0200
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

Hi List,

I just migrate existing Linux wireguard server to OpenBSD wireguard server.

below is what I did.


Upgrade to recent snapshot and pkg_add wireguard-tools

--------------------------------------------
OpenBSD 6.7-current (GENERIC.MP) #297: Wed Jun 24 17:15:28 MDT 2020
deraadt@amd64.openbsd.org:/usr/src/sys/arch/amd64/compile/GENERIC.MP
--------------------------------------------

then cp -r all /etc/wirequard from linux to openbsd
create /etc/hostname.wg0

---------------- /etc/hostname.wg0 ----------
inet 192.168.44.1 255.255.255.0 NONE \
description "interface on wg0 (VPN)"
up

!/usr/local/bin/wg setconf wg0 /etc/wireguard/wg0.conf
---------------------------------------------

sh /etc/netstart wg0
config corresponding nat on pf.conf and sysctl net.inet.ip.forwarding=1

Done.

Thanks Jason & Matt.

-- 
Key fingerprint: CDB3 6C62 254B C088 1E5D DD32 182C 97DB CF2C 80AC
