Return-Path: <SRS0=KrVi=4C=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64071C3B18F
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 14 Feb 2020 11:03:45 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B67E82168B
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 14 Feb 2020 11:03:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B67E82168B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=usta.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 785a4c5f;
	Fri, 14 Feb 2020 10:56:10 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f5d9e619
 for <wireguard@lists.zx2c4.com>;
 Thu, 13 Feb 2020 18:32:23 +0000 (UTC)
Received: from scc-mailout-kit-02.scc.kit.edu (scc-mailout-kit-02.scc.kit.edu
 [IPv6:2a00:1398:9:f712::810d:e752])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 701515c3
 for <wireguard@lists.zx2c4.com>;
 Thu, 13 Feb 2020 18:32:23 +0000 (UTC)
Received: from hekate.asta.kit.edu ([141.3.145.153] helo=hekate.usta.de)
 by scc-mailout-kit-02.scc.kit.edu with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (envelope-from <schwarze@usta.de>)
 id 1j2JJd-0005dP-R8; Thu, 13 Feb 2020 19:34:23 +0100
Received: from donnerwolke.asta.kit.edu ([141.3.145.61]
 helo=donnerwolke.usta.de) by hekate.usta.de with esmtp (Exim 4.92.2)
 (envelope-from <schwarze@usta.de>)
 id 1j2JJb-0006HM-Rq; Thu, 13 Feb 2020 19:34:19 +0100
Received: from athene.asta.kit.edu ([141.3.145.60] helo=athene.usta.de)
 by donnerwolke.usta.de with esmtp (Exim 4.84_2)
 (envelope-from <schwarze@usta.de>)
 id 1j2JJb-0001cz-M1; Thu, 13 Feb 2020 19:34:19 +0100
Received: from localhost (athene.usta.de [local])
 by athene.usta.de (OpenSMTPD) with ESMTPA id 230dc061;
 Thu, 13 Feb 2020 19:34:19 +0100 (CET)
Date: Thu, 13 Feb 2020 19:34:19 +0100
From: Ingo Schwarze <schwarze@usta.de>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: [PATCH] Fix formatting in wg-quick(8)
Message-ID: <20200213183419.GF75465@athene.usta.de>
References: <20200213042900.2ed2sbhglg5uzjq5@BlackBox>
 <20200213044921.8115-1-dev@sgregoratto.me>
 <CAHmME9r9fF28_J=D73qZtgfcS6wLtbywEVf9eu_TyZff=0LmhQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHmME9r9fF28_J=D73qZtgfcS6wLtbywEVf9eu_TyZff=0LmhQ@mail.gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Approved-At: Fri, 14 Feb 2020 11:56:09 +0100
Cc: Stephen Gregoratto <dev@sgregoratto.me>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>, discuss@mandoc.bsd.lv
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Hi Jason,

Jason A. Donenfeld wrote on Thu, Feb 13, 2020 at 05:31:41PM +0100:
> On Thu, Feb 13, 2020 at 5:50 AM Stephen Gregoratto <dev@sgregoratto.me> wrote:

>> +.TH WG-QUICK 8 "2019-02-13" ZX2C4 "WireGuard"

> It's 2020 now, but what would you think of retaining the original
> date? Or do you usually bump it on every change? I'm not sure what the
> convention is.

The .TH macro is supposed to contain the date of the last change.

If you want to explain when something was first implemented,
you can do that below ".SH HISTORY".

>> +.PP
>> +The following might be used for connecting as a client to a VPN gateway for
>> +tunneling all traffic:
>> +.nf
>> +.sp
>> +.RS 6n

> Never seen these three modifiers. They set spacing somehow?

Not sure what you mean by "modifiers".
.nf and .sp are roff(7) requests, .RS is a man(7) macro,
and 6n is a scaling width.

  https://man.openbsd.org/roff.7#nf
  https://man.openbsd.org/roff.7#sp
  https://man.openbsd.org/man.7#RS_2
  https://man.openbsd.org/roff.7#Scaling_Widths

>>  .SH SEE ALSO
>> -.BR wg (8),
>> +.BR pass (1),
>>  .BR ip (8),
>> -.BR ip-link (8),
>>  .BR ip-address (8),
>> +.BR ip-link (8),
>>  .BR ip-route (8),
>>  .BR ip-rule (8),
>> -.BR resolvconf (8).
>> -
>> +.BR iptables (8),
>> +.BR resolvconf (8),
>> +.BR wg (8)
>>  .SH AUTHOR
>>  .B wg-quick

> You've ordered these alphabetically, but the original ordering was
> chosen deliberately.

Sorting first by section, then alphabetically is done by convention.
For example, see this style guide:

  https://mandoc.bsd.lv/mdoc/style/see_also.html

The reason is that the number of references ought to be small,
so deliberate ordering adds little value, and a fixed ordering
results in a more predictable experience for the reader.

Yours,
  Ingo
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
