Return-Path: <SRS0=P94j=IT=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A86BC433DB
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 21 Mar 2021 05:21:42 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D10D561926
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 21 Mar 2021 05:21:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D10D561926
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=opnsense.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6379817a;
	Sun, 21 Mar 2021 05:19:38 +0000 (UTC)
Received: from mail.opnsense.org (mail.opnsense.org [81.171.24.236])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 93d456d0
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 20 Mar 2021 18:59:17 +0000 (UTC)
Received: from localhost (mail.opnsense.org [127.0.0.1])
 by mail.opnsense.org (Postfix) with ESMTP id 4BFF21503F3;
 Sat, 20 Mar 2021 19:59:17 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.opnsense.org
Received: from mail.opnsense.org ([127.0.0.1])
 by localhost (mail.opnsense.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id meY5WZsBK0Dm; Sat, 20 Mar 2021 19:59:17 +0100 (CET)
Content-Type: text/plain;
	charset=us-ascii
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=opnsense.org; s=dkim;
 t=1616266757; bh=eD8/hxKswE7B73z3BWMzU9F5Gqze98Az+7WqJAvfkLA=;
 h=Subject:From:In-Reply-To:Date:Cc:References:To:From;
 b=p1ZbHqC+DMurRJ73UoOO1GTjXp7HrMC4vaZpza7TkwohE/BwpSrdQ+rEn7B6IQIzo
 b90wxnixNTVjJ4tY09+RCBqyyNqf/hTc6oCpibq/iiCncLUqtIcqd8WNAsT4/wTvGx
 Exrv1U+o8Glwem0vvDZgMtvSOXkyPZjx+S8sktwg=
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.4\))
Subject: Re: [PATCH] freebsd: Implement selection of FIB (routing table) for
 tunneled packets
From: Franco Fichtner <franco@opnsense.org>
In-Reply-To: <ee43587f-8e17-add1-6b28-174639d126f8@harz.behrens.de>
Date: Sat, 20 Mar 2021 19:59:16 +0100
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Transfer-Encoding: 7bit
Message-Id: <B71D1758-3EDE-4844-99FC-7D6BD125D0ED@opnsense.org>
References: <6aa0fd33-4c0d-557f-f7f5-5f5406b3a273@harz.behrens.de>
 <CAHmME9q6dO1X+Gt3hY4kQxsQ4DqeaJGxoT8qkaAe-0s_WCrVrA@mail.gmail.com>
 <ee43587f-8e17-add1-6b28-174639d126f8@harz.behrens.de>
To: Frank Behrens <frank@harz.behrens.de>
X-Mailman-Approved-At: Sun, 21 Mar 2021 05:19:36 +0000
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

Hi Frank,

> On 20. Mar 2021, at 6:05 PM, Frank Behrens <frank@harz.behrens.de> wrote:
> 
> 3. The setting of special marks, useable in packet filter/firewall
> processing. I guess, that is the meaning for "wg.. fwmark". I'm not
> sure, how best to implement that for FreeBSD. For ipfw(4) there is some
> functionality using socket cookies, as already implemented. For pf(4)
> packet filter the documentation mentions mbuf_tags(9). Apparently
> we need some input from a FreeBSD packet filter developer.

In pf(4) the tags are stored using mtag and that's reachable through
the kernel only for direct tagging (normally it matches through ruleset
and applies tags to packets in fly-by), although it is difficult to look
up the tag name to tag integer from static functions inside pf_ioctl.c
and keeping the index in sync with the tags that could change when the
ruleset changes, see pf_tag_packet() in pf.c for low level tagging using
the tag integer translated from the tag name during the last ruleset apply.


Cheers,
Franco
