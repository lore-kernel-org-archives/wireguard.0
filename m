Return-Path: <SRS0=ZwbF=JD=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CCD5C433ED
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  6 Apr 2021 21:46:52 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 32501613D0
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  6 Apr 2021 21:46:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 32501613D0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8699c639;
	Tue, 6 Apr 2021 21:46:49 +0000 (UTC)
Received: from mout.gmx.com (mout.gmx.com [74.208.4.200])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id c00d416d
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sat, 3 Apr 2021 04:27:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mail.com;
 s=dbd5af2cbaf7; t=1617424060;
 bh=LL8lrtqf2mKGawo+A62blf5KNLBfH2I/F+80aiVLq4c=;
 h=X-UI-Sender-Class:From:To:Subject:Date;
 b=5bsP7COF1SK/ZE22VaEFH9sW6GKXE2goKKyURW+QMIhRC8x+HfqmBQAG08EKUTjyp
 VZE7yQTbHqkrDI0d1bgHtR2AZxRfKZxeRl6FbIFyMeQ8xYZBfNWCS0M4X6TMQ85B/L
 OKfG+ROEECOqvwZB5csxLPHfhbf04wnbjU+KcAdg=
X-UI-Sender-Class: 214d933f-fd2f-45c7-a636-f5d79ae31a79
Received: from [158.51.113.115] ([158.51.113.115]) by web-mail.mail.com
 (3c-app-mailcom-lxa15.server.lan [10.76.45.16]) (via HTTP); Sat, 3 Apr 2021
 06:27:40 +0200
MIME-Version: 1.0
Message-ID: <trinity-3510980c-c0ee-4d02-bcf5-8b7d2a708cda-1617424060455@3c-app-mailcom-lxa15>
From: Giovanni Francesco <thelinuxguy@mail.com>
To: wireguard@lists.zx2c4.com
Subject: NAT to NAT peers - 'EndPoint' IP data sharing among peers of the
 same key?
Content-Type: text/plain; charset=UTF-8
Date: Sat, 3 Apr 2021 06:27:40 +0200
Importance: normal
Sensitivity: Normal
X-Priority: 3
X-Provags-ID: V03:K1:eZww06VwCWs5Abz8bQ3Km06YWjOW3JwzsTwKJ8Yz0YzMwvpgHLyGUEAgVbMkFfA+IF9rY
 93oOxECAtn663fmChQ1/GJa2jQqs13jh48pMH6yob7q2P4zpEmc6oS50nPb2Xd7GZgWbgGjiKJnN
 2vTgENnabTuIwfKYpXJE3pAAZL20Vg7iUPa+ARCyUQQl7IH3fh6FEXV+hMSEl/zgmhZo4N//jCCM
 qkiC750cecgR2EoweDJEbvHZkuW2U8sKMrIytDe2mhLXjU/Pmi0xT5qh+Ih70OC20iN9TBCLnYCe
 eA=
X-UI-Out-Filterresults: notjunk:1;V03:K0:BeEgpkBP3dw=:1BNi93mjnJ1+FZAa/gt/aV
 cBptf235kYHCTR/2KireXACq6pYvxl9TlY0Lf2E8LMf87UnmvRIAjjYQAnn5CMz+vAU0LOQRI
 zqNX62tYnE6Am4c/djHxzZBsTHYP/59GtnSMiWoH7jkH3WPp2nYrbEPr52GhbVTyNIFFzsOx/
 DWPnVG3rhBQjJ4QY7H6KnDbC7EcqJSvDYSRXNxAylFezayFBi5G5dZ9jR23Tt5pd8BzYxMvV4
 H8H+4LUwWGinUgj7e4BHnA7+pA2YI25HKQ/mM8otBqs9rITyQYyeJ8s+uyHzsIhZ3SlCnDf2Z
 VdqF76gPVD0kdE40fjmVdKJ9wx7F4kVsvVnCUY14ZFVv6gd5VmXT7Rzbnz6gVChBcWTYkxhD9
 87YM4W1pimuPpqZ181gmk8b+c/eFSBdlDAK2M1NKxtIWlPHbgSKKgMD/LCRDpTmwErR2J3oYB
 jSx9JPYEWyuLoKwSXF6uOyCgoO6xvjHTbLAXXaMRS1F1SqTElZ3ZmfrjwCieCvcmDWVi3oole
 VNBSuC7kX2kxOZjjGzJ7OhLZGmI2AOMluecVGB4oisVWjqjsi4WHlkL77xH2W6eMvnv7ALsfh
 xRAxEj+1/B2ZwL9qzXw/D3sa2H2zq8xnNqc7TIB4srzzrgB2lYgw60bg4J/5aODqdivpNhtNT
 1GBmldibsRpJI6TpvrT+SeAME99oHB1DpLFcSXyUbJsbYYo9o6U/GOm7kKMAgcyq9rN7Lm9rQ
 AO0sfGQLR+5+u1MnAa8m1XyMLPqqbJIyNqChHD7IVkoG6RaqDbsRyKrs2WU+u+mhhEu1E8M8s
 l2mZVNtaMGfMRLdACAGder4eOEJCFo2HNArvnrEyvIr7n4rO82woml+3VD0zg+ZVMXsTrxeJa
 OpMfvSM9vdSm+foZTqI8pqqHXLu3OiLagXFnfiRgpSTBirPK3pqGyDSRH4hWsh
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Tue, 06 Apr 2021 21:46:47 +0000
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

Hi, I am looking to understand if "EndPoint" IP data may be shared among p=
eers within the tunnel?

The question may sound confusing, let me explain my setup.

I have a static IPv4 wireguard server (let's call it "A" peer) which has t=
wo downstream WG clients peers "B" and "C" on remote networks with dynamic=
 WAN IPs (roaming).
In my current configuration all my clients "B" and "C" have a single peer =
"A" - therefore all traffic must always go to "A" - "A" is in a datacenter=
 in another country.

"B" and "C" have dynamic every changing IP "EndPoint" information, in my c=
urrent setup this is not a problem because "A" is a static host.

If "B" and "C" are connected to "A" - is it possible for me to make B and =
C peers of eachother without "EndPoint" ?
In other words, if B public key is a peer of C and vise versa would its co=
nnection to "A" share the IP addresses ("EndPoint" or where to go) downstr=
eam to "B" and "C" so they can establish direct connectivity or would traf=
fic always need to continue to traverse via "A"?

Thanks!
