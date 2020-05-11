Return-Path: <SRS0=LfNZ=6Z=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB558C54E4A
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 11 May 2020 21:22:30 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DDA6520736
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 11 May 2020 21:22:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=rfraile.eu header.i=@rfraile.eu header.b="nlEYNgVf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DDA6520736
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=rfraile.eu
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f31cdc38;
	Mon, 11 May 2020 21:09:07 +0000 (UTC)
Received: from smtp-relay-02-2.dondominio.net (smtp-relay-02-2.dondominio.net
 [31.214.176.35])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id fecfc6d9
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 11 May 2020 08:43:17 +0000 (UTC)
Received: from localhost (smtp-relay-local.scip.local [127.0.0.1])
 by smtp-relay.dondominio.com (Postfix) with SMTP id 4FBCE4082E
 for <wireguard@lists.zx2c4.com>; Mon, 11 May 2020 10:56:33 +0200 (CEST)
Received: from mail-node.dondominio.com 
 by smtp-relay.dondominio.com (Postfix) with ESMTP id AF48E407CA;
 Mon, 11 May 2020 10:56:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rfraile.eu; s=dddk;
 t=1589187391; bh=4VCaM3hIhu0TEgxDBP+LBRQnw80HSYZwfLHgZ/1Pc5w=;
 h=Date:From:To:Subject:Message-ID:Content-Type;
 b=nlEYNgVf0GT/FfQx3bpURlSvqBVBqq7AdKW+Veeqhie41MVI4LU38Yej41cFwsOSX
 J5jDlWW0mo9OhUTTACMaeTI2QHWLo3NsIkug51jBynFNtOpMtNf1pPv3g7mp2F0NBR
 v7CvjPzh/keRTZe7iCiLui9IC+GqwWODPy9As7VE=
Received: from webmail.rfraile.eu (webmail-backend-02.scip.local
 [172.21.33.12]) (Authenticated sender: rfraile@rfraile.eu)
 by mail-node.dondominio.com (Postfix) with ESMTPA id 8926E40529;
 Mon, 11 May 2020 10:56:31 +0200 (CEST)
Received: from 2.154.17.21.dyn.user.ono.com ([2.154.17.21])
 via webmail-ha-01.scip.local ([172.21.33.131]) by webmail.rfraile.eu
 with HTTP (HTTP/1.1 POST); Mon, 11 May 2020 10:56:31 +0200
MIME-Version: 1.0
Date: Mon, 11 May 2020 10:56:31 +0200
From: Ricardo Fraile <rfraile@rfraile.eu>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Simon Rozman <simon@rozman.si>, virtualdxs@gmail.com, WireGuard mailing
 list <wireguard@lists.zx2c4.com>
Subject: Re: Search Domain/DNS Suffix
In-Reply-To: <CAHmME9ovg+BBhVkKoNDd2LD-C9ChuBW5VXgj4n4V-Cp_-g0uiw@mail.gmail.com>
References: <f27176e3fc6ede8d04682a9b504df177@rfraile.eu>
 <CAHmME9ovg+BBhVkKoNDd2LD-C9ChuBW5VXgj4n4V-Cp_-g0uiw@mail.gmail.com>
User-Agent: DD Webmail
Message-ID: <2db3cc14e0352128d499efc67fe57e29@rfraile.eu>
X-Sender: rfraile@rfraile.eu
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
 (mail-node.dondominio.com [0.0.0.0]); Mon, 11 May 2020 10:56:31 +0200 (CEST)
X-Mailman-Approved-At: Mon, 11 May 2020 23:09:05 +0200
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

Perfect, that solves the domain setting workaround. Thanks Jason!


El 2020-05-11 08:25, Jason A. Donenfeld escribió:
> Your wish is my command:
> 
> https://lists.zx2c4.com/pipermail/wireguard/2020-May/005415.html
> 
> DNS=8.8.8.8,8.8.4.4,mycorp.net
