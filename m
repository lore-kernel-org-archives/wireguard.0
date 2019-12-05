Return-Path: <SRS0=1Eb4=Z6=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00A1EC2BBE2
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  8 Dec 2019 10:41:27 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9849E206D6
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  8 Dec 2019 10:41:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=cs.umd.edu header.i=@cs.umd.edu header.b="AP1/AN93"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9849E206D6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=cs.umd.edu
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3e3f54aa;
	Sun, 8 Dec 2019 10:41:09 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 829bdf7e
 for <wireguard@lists.zx2c4.com>; Thu, 5 Dec 2019 12:56:05 +0000 (UTC)
Received: from mrouter00.cs.umd.edu (mrouter00.cs.umd.edu [128.8.128.203])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 75574b54
 for <wireguard@lists.zx2c4.com>; Thu, 5 Dec 2019 12:56:05 +0000 (UTC)
Received: from barracuda.cs.umd.edu (barracuda01.cs.umd.edu [128.8.128.202])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mrouter00.cs.umd.edu (Postfix) with ESMTPS id C086482480CF
 for <wireguard@lists.zx2c4.com>; Thu,  5 Dec 2019 07:56:02 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=cs.umd.edu;
 s=mrouter00; t=1575550564;
 bh=4ABo2l5/UPhmfeQQEm7S2VEdds1UctkmPZQ9YlUduQI=;
 h=Subject:From:To:References:Date:In-Reply-To;
 b=AP1/AN93H9ZyZwZIfraRPfh75zltnZ4WUCDKNhziRok+OSSWlBoaDfb7Gekfh0XKz
 0Dfbgy6LInnbpZzxaFKVlj9MBGWHQwSKM9Bh9VG2EcS08HT5IJ/qshhYH6N9rw03dQ
 aB/XyYw885uWpAE4dSZTlrTzE+RxmTipRZNvyygg=
Authentication-Results: mrouter00.cs.umd.edu;
 arc=none smtp.remote-ip=128.8.128.202
ARC-Seal: i=1; a=rsa-sha256; d=cs.umd.edu; s=csmx; t=1575550564; cv=none;
 b=jSMydt6KCLJx2GNSJgwjRcoeSS/MNEIHWfH7swdsNlclMoYlTSOXbE+Tb0kj3+52U279yhovAo9P8Rt+1VhRFhsxzUkopuSvwmHT2UAQ0GEgZfDwgFJ/CBEoV716TJbbNwCx+cQe9VVc3sMcqkTIf0wdlLUZzK3tKvVDHoTnhIQ=
ARC-Message-Signature: i=1; a=rsa-sha256; d=cs.umd.edu; s=csmx; t=1575550564; 
 c=relaxed/simple;
 bh=4ABo2l5/UPhmfeQQEm7S2VEdds1UctkmPZQ9YlUduQI=; 
 h=X-ASG-Debug-ID:Received:X-Barracuda-Envelope-From:
 X-Barracuda-Effective-Source-IP:X-Barracuda-Apparent-Source-IP:
 Received:Subject:From:X-ASG-Orig-Subj:To:References:Message-ID:
 Date:User-Agent:MIME-Version:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:Content-Language:X-Barracuda-Connect:
 X-Barracuda-Start-Time:X-Barracuda-URL:X-Virus-Scanned:
 X-Barracuda-Scan-Msg-Size:X-Barracuda-BRTS-Status:
 X-Barracuda-Bayes:X-Barracuda-Spam-Score:X-Barracuda-Spam-Status:
 X-Barracuda-Spam-Report;
 b=MJEZPWZtXkOo7kSxclT+xjYbul4+syO7tl8VKIyz/ASgNNtRF2dyYGCf0z0YJQW2AgMfj8cmLdBx4upUB7qlOLv1ycvnniurIskw/AJczdDkKT4ghs8fkxXLWf7mfMaC0XJuT9JSK8VduORnSW9UFA1vGxglykFIJHNRldSPHjQ=
ARC-Authentication-Results: i=1; mrouter00.cs.umd.edu;
 dkim=none (no signatures found);
 x-return-mx=pass (MX Record found) header.domain=cs.umd.edu
 policy.org_domain=umd.edu policy.is_org=no;
 x-return-mx=pass (MX Record found) smtp.domain=cs.umd.edu
 policy.org_domain=umd.edu policy.is_org=no; x-trusted-ip=pass
Authentication-Results: mrouter00.cs.umd.edu; dkim=none (no signatures found);
 x-return-mx=pass header.domain=cs.umd.edu policy.org_domain=umd.edu
 policy.is_org=no (MX Record found); 
 x-return-mx=pass smtp.domain=cs.umd.edu policy.org_domain=umd.edu
 policy.is_org=no (MX Record found); x-trusted-ip=pass
X-ASG-Debug-ID: 1575550562-08f01f355e30d240001-KOqj8r
Received: from bacon.cs.umd.edu (bacon.cs.umd.edu [128.8.127.22]) by
 barracuda.cs.umd.edu with ESMTP id N4NEOpvMeyq083gA for
 <wireguard@lists.zx2c4.com>; Thu, 05 Dec 2019 07:56:02 -0500 (EST)
X-Barracuda-Envelope-From: seriv@cs.umd.edu
X-Barracuda-Effective-Source-IP: bacon.cs.umd.edu[128.8.127.22]
X-Barracuda-Apparent-Source-IP: 128.8.127.22
Received: from [10.137.0.16] (unknown [10.73.252.133])
 (Authenticated sender: seriv)
 by bacon.cs.umd.edu (Postfix) with ESMTPSA id 60932833291C
 for <wireguard@lists.zx2c4.com>; Thu,  5 Dec 2019 07:55:59 -0500 (EST)
Subject: RHEL-8.1 backported a couple features breaking wireguard compilation.
From: Sergey Ivanov <seriv@cs.umd.edu>
X-ASG-Orig-Subj: RHEL-8.1 backported a couple features breaking wireguard
 compilation.
To: wireguard@lists.zx2c4.com
References: <6c0d375eec6dddfcff8040df3a34e69a@cs.umd.edu>
Message-ID: <dcf2a064-9800-8fcc-bd0c-3a604f8bd9bd@cs.umd.edu>
Date: Thu, 5 Dec 2019 07:55:57 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <6c0d375eec6dddfcff8040df3a34e69a@cs.umd.edu>
Content-Language: en-US
X-Barracuda-Connect: bacon.cs.umd.edu[128.8.127.22]
X-Barracuda-Start-Time: 1575550562
X-Barracuda-URL: https://barracuda01.cs.umd.edu:443/cgi-mod/mark.cgi
X-Virus-Scanned: by bsmtpd at cs.umd.edu
X-Barracuda-Scan-Msg-Size: 1224
X-Barracuda-BRTS-Status: 1
X-Barracuda-Bayes: INNOCENT GLOBAL 0.0000 1.0000 -2.0210
X-Barracuda-Spam-Score: -2.02
X-Barracuda-Spam-Status: No,
 SCORE=-2.02 using per-user scores of TAG_LEVEL=1000.0
 QUARANTINE_LEVEL=1000.0 KILL_LEVEL=1000.0 tests=
X-Barracuda-Spam-Report: Code version 3.2, rules version 3.2.3.78470
 Rule breakdown below
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
X-Mailman-Approved-At: Sun, 08 Dec 2019 11:41:06 +0100
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

SGksCgpvbiBrZXJuZWwgNC4xOC4wLTE0Ny5lbDgueDg2XzY0IEkgYW0gbm90IGFibGUgdG8gY29t
cGlsZSAKaHR0cHM6Ly9naXQuengyYzQuY29tL1dpcmVHdWFyZCBzb3VyY2VzLCB0cmllZCB0YWdz
IDAuMC4yMDE5MTEyNyBhbmTCoCAKMC4wLjIwMTkxMjA1IGFuZCBtYXN0ZXIgYXQgNWViODdmYjY0
OS4KClRvIGNvbXBpbGUgaXQgSSBkaWQgdGhlIGZvbGxvd2luZyB3b3JrYXJvdW5kOgoKPT09CgoK
JCBnaXQgZGlmZgpkaWZmIC0tZ2l0IGEvc3JjL2NvbXBhdC9jb21wYXQuaCBiL3NyYy9jb21wYXQv
Y29tcGF0LmgKaW5kZXggYWIyMmZhNC4uNmUwMzRiNSAxMDA2NDQKLS0tIGEvc3JjL2NvbXBhdC9j
b21wYXQuaAorKysgYi9zcmMvY29tcGF0L2NvbXBhdC5oCkBAIC0zMjYsNyArMzI2LDcgQEAgc3Rh
dGljIGlubGluZSBpbnQgd2FpdF9mb3JfcmFuZG9tX2J5dGVzKHZvaWQpCiDCoH0KIMKgI2VuZGlm
CgotI2lmIExJTlVYX1ZFUlNJT05fQ09ERSA8IEtFUk5FTF9WRVJTSU9OKDQsIDE5LCAwKSAmJiBM
SU5VWF9WRVJTSU9OX0NPREUgCiA+PSBLRVJORUxfVkVSU0lPTig0LCAyLCAwKQorI2lmIExJTlVY
X1ZFUlNJT05fQ09ERSA8IEtFUk5FTF9WRVJTSU9OKDQsIDE5LCAwKSAmJiBkZWZpbmVkKElTUkhF
TDgpIAomJiBSSEVMX01JTk9SIDwgMSAmJiBMSU5VWF9WRVJTSU9OX0NPREUgPj0gS0VSTkVMX1ZF
UlNJT04oNCwgMiwgMCkKIMKgI2luY2x1ZGUgPGxpbnV4L3JhbmRvbS5oPgogwqAjaW5jbHVkZSA8
bGludXgvc2xhYi5oPgogwqBzdHJ1Y3Qgcm5nX2lzX2luaXRpYWxpemVkX2NhbGxiYWNrIHsKQEAg
LTgzMSw3ICs4MzEsNyBAQCBzdGF0aWMgaW5saW5lIHZvaWQgc2tiX21hcmtfbm90X29uX2xpc3Qo
c3RydWN0IApza19idWZmICpza2IpCiDCoH0KIMKgI2VuZGlmCgotI2lmIExJTlVYX1ZFUlNJT05f
Q09ERSA8IEtFUk5FTF9WRVJTSU9OKDQsIDIwLCAwKQorI2lmIExJTlVYX1ZFUlNJT05fQ09ERSA8
IEtFUk5FTF9WRVJTSU9OKDQsIDIwLCAwKSAmJiAoIWRlZmluZWQoSVNSSEVMOCkgCnx8IFJIRUxf
TUlOT1IgPCAxKQogwqAjZGVmaW5lIE5MQV9FWEFDVF9MRU4gTkxBX1VOU1BFQwogwqAjZW5kaWYK
IMKgI2lmIExJTlVYX1ZFUlNJT05fQ09ERSA8IEtFUk5FTF9WRVJTSU9OKDUsIDIsIDApCj09PQoK
LS0gCgogwqAgUmVnYXJkcywKCiDCoCBTZXJnZXkgSXZhbm92CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpXaXJlR3VhcmQgbWFpbGluZyBsaXN0CldpcmVH
dWFyZEBsaXN0cy56eDJjNC5jb20KaHR0cHM6Ly9saXN0cy56eDJjNC5jb20vbWFpbG1hbi9saXN0
aW5mby93aXJlZ3VhcmQK
