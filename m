Return-Path: <SRS0=mwgs=BA=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71C00C433E2
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 21 Jul 2020 14:01:16 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1685F2064B
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 21 Jul 2020 14:01:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=knockaert.nl header.i=@knockaert.nl header.b="bPN8uPpx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1685F2064B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=knockaert.nl
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 480e5438;
	Tue, 21 Jul 2020 13:36:51 +0000 (UTC)
Received: from mail.knockaert.nl (mail.knockaert.nl [83.160.83.228])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 90d86c4d
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 21 Jul 2020 12:25:40 +0000 (UTC)
Received: from [169.254.83.41] (unknown
 [IPv6:2001:980:6492:1:b412:33a8:fe5a:62fd])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client did not present a certificate)
 (Authenticated sender: jknockaert@knockaert.nl)
 by mail.knockaert.nl (Postfix) with ESMTPSA id 0CC575A02E0;
 Tue, 21 Jul 2020 14:48:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=knockaert.nl;
 s=mail; t=1595335691;
 bh=hMbLbMa7/HWN5QaQb4vnbuLwpZn3zQesn7UxUmdgOuo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=bPN8uPpxo2SxyM0V3tqfPOAIRoyqhW8dM/t3Evhv42WQUI6dHItUQiqwHtxj9mj45
 YW+S44V08anlS9P+mXpOvp4ZnONRX1n0G8vheTYbguPsIFRDccA84wVw/n0DgARPhL
 0YQU3b3Vby0bsglMrjTl20agalNfbSelEdw/0zLM=
From: "Jasper Knockaert" <jasper@knockaert.nl>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: "Roman Mamedov" <rm@romanrm.net>,
 "Joachim Lindenberg" <wireguard@lindenberg.one>,
 "WireGuard mailing list" <wireguard@lists.zx2c4.com>
Subject: Re: Wireguard on Ubuntu 18.04.4 (LTS)?
Date: Tue, 21 Jul 2020 14:48:10 +0200
X-Mailer: MailMate (1.13.1r5671)
Message-ID: <72DF9AA9-C001-45B6-A214-578DE7466484@knockaert.nl>
In-Reply-To: <CAHmME9pgC=NKY4-m659PwAO=xov1MfRjvy5-MAdWSJ6A+32TXw@mail.gmail.com>
References: <065501d65ea2$3e652fe0$bb2f8fa0$@lindenberg.one>
 <CAHmME9qr_ZPyhK1V5ENDdNtfk0cn0pb=Ne2T_FEYwaFHtuwWCw@mail.gmail.com>
 <067601d65ea7$1b71a3b0$5254eb10$@lindenberg.one>
 <20200720201456.6dfc12df@natsu>
 <CAHmME9pgC=NKY4-m659PwAO=xov1MfRjvy5-MAdWSJ6A+32TXw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Virus-Scanned: clamav-milter 0.102.3 at green
X-Virus-Status: Clean
X-Mailman-Approved-At: Tue, 21 Jul 2020 15:36:50 +0200
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

On 21 Jul 2020, at 14:42, Jason A. Donenfeld wrote:

> On Mon, Jul 20, 2020 at 5:15 PM Roman Mamedov <rm@romanrm.net> wrote:
>>
>> On Mon, 20 Jul 2020 17:04:46 +0200
>> <wireguard@lindenberg.one> wrote:
>>
>>> Yes, it is up to date.
>>> Joachim
>>>
>>> -----Urspr=C3=BCngliche Nachricht-----
>>> Von: Jason A. Donenfeld <Jason@zx2c4.com>
>>> Gesendet: Monday, 20 July 2020 16:49
>>> An: Joachim Lindenberg <wireguard@lindenberg.one>
>>> Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
>>> Betreff: Re: Wireguard on Ubuntu 18.04.4 (LTS)?
>>>
>>> Is your system fully up to date? `apt update && apt upgrade`?
>>
>> Seems like it's available only starting from Ubuntu 19.10:
>> https://packages.ubuntu.com/search?keywords=3Dwireguard&searchon=3Dnam=
es&suite=3Dall&section=3Dall
>
> All set now:
> https://packages.ubuntu.com/bionic-updates/wireguard

Is there any advice as to how to migrate from the WireGuard PPA to the =

official Ubuntu repo? Will the WireGuard PPA be maintained now that the =

"official" ubuntu packages have been released?

Best


Jasper
