Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77B19C43217
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 22 Apr 2022 00:21:25 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 53d1a458;
	Thu, 21 Apr 2022 23:49:51 +0000 (UTC)
Received: from mx1.heinlein-support.de (mx2.heinlein-support.de
 [91.198.250.20])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 626774a2
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 22 Mar 2022 09:35:41 +0000 (UTC)
Received: from marchiv.heinlein-support.de (marchiv.heinlein-support.de
 [91.198.250.63])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mx1.heinlein-support.de (Postfix) with ESMTPS id A99992E097B
 for <wireguard@lists.zx2c4.com>; Tue, 22 Mar 2022 10:35:38 +0100 (CET)
Received: from MailAppDispatcher (localhost.localdomain [127.0.0.1])
 by marchiv.heinlein-support.de (Postfix) with ESMTP id 9DD3948146
 for <wireguard@lists.zx2c4.com>; Tue, 22 Mar 2022 10:35:38 +0100 (CET)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by marchiv.heinlein-support.de (Postfix) with ESMTP id 7989F48145
 for <wireguard@lists.zx2c4.com>; Tue, 22 Mar 2022 10:35:38 +0100 (CET)
X-Virus-Scanned: Heinlein Anti-Spam at mail-archiv
Received: from marchiv.heinlein-support.de ([127.0.0.1])
 by localhost (marchiv.heinlein-support.de [127.0.0.1]) (amavisd-new,
 port 10024)
 with ESMTP id wjbVydcKDxFJ for <wireguard@lists.zx2c4.com>;
 Tue, 22 Mar 2022 10:35:37 +0100 (CET)
Received: from plasma5.jpberlin.de (plasma5.jpberlin.de [80.241.58.36])
 by marchiv.heinlein-support.de (Postfix) with ESMTPS
 for <wireguard@lists.zx2c4.com>; Tue, 22 Mar 2022 10:35:37 +0100 (CET)
Received: from [10.0.44.42] (unknown [10.0.44.42])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (Client did not present a certificate)
 (Authenticated sender: r.sander@heinlein-support.de)
 by plasma.jpberlin.de (Postfix) with ESMTPSA id 44B4CAC036
 for <wireguard@lists.zx2c4.com>; Tue, 22 Mar 2022 10:35:37 +0100 (CET)
Message-ID: <75feba5a-9289-0ceb-ef39-285bacdcc506@heinlein-support.de>
Date: Tue, 22 Mar 2022 10:35:36 +0100
MIME-Version: 1.0
Subject: Re: Systemd-resolved problem
Content-Language: de-DE
To: wireguard@lists.zx2c4.com
References: <CAL0AYvcHYP1GN+DZN96fQw9f+FUU8b+C9yOCrWGnAEtezCnBDA@mail.gmail.com>
From: Robert Sander <r.sander@heinlein-support.de>
Organization: Heinlein Support GmbH
Jabber-ID: r.sander@jabber.heinlein-support.de
In-Reply-To: <CAL0AYvcHYP1GN+DZN96fQw9f+FUU8b+C9yOCrWGnAEtezCnBDA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailarchiv-ID: 8412714
X-Rspamd-Score: -7.00 / 15.00 / 15.00
X-Rspamd-Queue-Id: A99992E097B
X-MBO-SPAM-Probability: 
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

Am 19.03.22 um 15:20 schrieb Barry Cisna:

>   when doing a resolvectl with the wg0 interface up there are no dns
> servers on the wg0 interface

Where should they come from?

Do you have the default route through your Wireguard tunnel?
Then systemd-resolved likely will not be able to reach the DNS resolvers 
any more. You will have to configure resolvers that are reachable 
through the Wireguard tunnel (e.g. 9.9.9.9 or similar).

Regards
-- 
Robert
