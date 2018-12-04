Return-Path: <SRS0=9kqO=ON=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 946EEC04EB8
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  4 Dec 2018 08:11:46 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 48517208A3
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  4 Dec 2018 08:11:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 48517208A3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=wolff.to
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cb0e9dc5;
	Tue, 4 Dec 2018 08:03:52 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 513eea01
 for <wireguard@lists.zx2c4.com>; Tue, 4 Dec 2018 08:03:50 +0000 (UTC)
Received: from wolff.to (wolff.to [98.103.208.27])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with SMTP id db3bb3c7
 for <wireguard@lists.zx2c4.com>; Tue, 4 Dec 2018 08:03:50 +0000 (UTC)
Received: (qmail 9137 invoked by uid 500); 4 Dec 2018 08:03:47 -0000
Date: Tue, 4 Dec 2018 02:03:47 -0600
From: Bruno Wolff III <bruno@wolff.to>
To: Aleksa Sarai <cyphar@cyphar.com>
Subject: Re: The Linux Plumbers Conference videos are up
Message-ID: <20181204080347.GA9036@wolff.to>
References: <20181203214637.GA17169@wolff.to>
 <CAHmME9ru7_T85oQjaot4e9WzZmo8M361O0hL2XR0_qPEQ92s5w@mail.gmail.com>
 <20181204071535.GA8629@wolff.to>
 <20181204075549.7rkf2c5ibcezsudf@yavin>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20181204075549.7rkf2c5ibcezsudf@yavin>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

On Tue, Dec 04, 2018 at 18:55:49 +1100,
  Aleksa Sarai <cyphar@cyphar.com> wrote:
>On 2018-12-04, Bruno Wolff III <bruno@wolff.to> wrote:
>> > Thanks Bruno. I've updated the webpage with these:
>> > https://www.wireguard.com/presentations/
>>
>> I've never been able to find a link to the presentations starting from the
>> main wireguard page. There is probably a link to it someplace as searches
>> find the presentations, but it would be nice if there was an easy to find
>> link from the main page to make it easier to get to (without a separate
>> bookmark).
>
>Interworkings > Presentations is a link to this page.

Thanks. That explains why I can't get there, even though there is a path. 
That drop down appears to only work with javascript enabled, which I don't 
normally have enabled.
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
