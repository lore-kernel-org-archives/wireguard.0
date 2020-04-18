Return-Path: <SRS0=xPCC=6C=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88639C38A29
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 18 Apr 2020 16:59:27 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BFE0521D93
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 18 Apr 2020 16:59:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=msfjarvis.dev header.i=@msfjarvis.dev header.b="LaTJS/FM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BFE0521D93
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=msfjarvis.dev
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 26901c3f;
	Sat, 18 Apr 2020 16:48:37 +0000 (UTC)
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id c514e555
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 18 Apr 2020 16:48:34 +0000 (UTC)
MIME-Version: 1.0
DKIM-Signature: a=rsa-sha256;
 b=LaTJS/FMhAgFm2cEFEey31hMT7KBb4vzMAmFzFGy1RQC1Wn6AziLr4V8LYm9L9fE2Ayf+pF8RV3IHFcj34effj0Ohg/WP1T2ouOV+h5B7FFcRkfwn7BNZFQUb4N1ytNqgKcTdFGg8a1wmMLlcwM85bvQWGWIlQEaxHc7DuBek1JPTNitOzA2bbdbDOUbkomP+YvufnWlxnAdtP3k4ZlEW+bLBglVh0CA33NZhKBNH155+6fLZU+zmnc5j2kGgeI/iko/kawszqRYoVoxuHpjj4TSivkLrdY0JNwNFwW7O5zJjHXxOEfShxZptssYAhbIjfCMjrwhg/QMyNEDX1ioKg==;
 s=purelymail1; d=msfjarvis.dev; v=1;
 bh=F1cLlaPrsNYp4uVHsv/ih6PqqPxWrlrzxiY8eRbuEek=; h=from:to:received; 
Authentication-Results: purelymail.com; auth=pass
X-UserIsAuth: true
Received: from 147.75.32.83 (EHLO mail.msfjarvis.dev) ([147.75.32.83])
 by ip-172-30-0-208.ec2.internal (JAMES SMTP Server ) with ESMTPA ID 313392909; 
 Sat, 18 Apr 2020 16:58:39 +0000 (UTC)
Date: Sat, 18 Apr 2020 16:58:38 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: RainLoop/1.14.0
From: "Harsh Shandilya" <me@msfjarvis.dev>
Message-ID: <8bca79f715ae5c649b5b717feef8e704@msfjarvis.dev>
Subject: Re: Question about Crowdin operation
To: "Eiji Tanioka" <tanioka404@gmail.com>, wireguard@lists.zx2c4.com
In-Reply-To: <CAA2ss9E8hAQqwKwA6aytcXCZPr905NX53LRdfY6-WG24m66AAA@mail.gmail.com>
References: <CAA2ss9E8hAQqwKwA6aytcXCZPr905NX53LRdfY6-WG24m66AAA@mail.gmail.com>
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
Reply-To: me@msfjarvis.dev
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

April 18, 2020 9:25 PM, "Eiji Tanioka" <tanioka404@gmail.com> wrote:=0A=
=0A> Hi,=0A> =0A> I'm translating WireGuard apps into Japanese.=0A> I hav=
e a question about operation in Crowdin.=0A> =0A> When translate, we tran=
slators need to clarify about original string's=0A> context or meaning. I=
n that situation, which option is preferred?=0A> =0A> - send ML about que=
stion.=0A> - in Crowdin, use comment.=0A> - in Crowdin, use comment and f=
lag "Issue".=0A> - in Crowdin, use Discussion.=0A> =0A> # I had used seco=
nd option, but never mention to anyone.=0A> # Should I had to mention to =
?=0A=0AThe second option is perfectly fine, though you'll have better luc=
k if you=0Amention me or Jason since that will ensure Crowdin does not sw=
allow up the=0Anotifications.=0A=0A> Kind regards,=0A> Eiji Tanioka
