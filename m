Return-Path: <SRS0=Vb0R=EP=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	MISSING_HEADERS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36AC3C2D0A3
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  9 Nov 2020 23:22:52 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 520A9206ED
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  9 Nov 2020 23:22:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="vUqkUcKB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 520A9206ED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4970eefe;
	Mon, 9 Nov 2020 22:41:03 +0000 (UTC)
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 554b2b53
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 4 Nov 2020 16:50:44 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id t11so23060627edj.13
 for <wireguard@lists.zx2c4.com>; Wed, 04 Nov 2020 08:53:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:cc;
 bh=yeeAa0FjS5z94Yg2NTYuBD1TCTbpYXe9jNUn8FfjqMg=;
 b=vUqkUcKBSIy3o95iwWN1lRNFSIavChsZz80mDR6YSJURi9PPXySPFqYSDV4BNF9Nqz
 ldtnb45ycMElH1qKZVWZ6sx2X3tMxgHqlecukPrEf8IsDcczwsIbUNt82BY8smQrLorP
 2MbybOOUH7UxghEnl9MELFbNPopiCTQxq6iuoXjf5HFApDHkOOGZleFCfQoge7WwbsAe
 rNhx48P915ft8zhtJR0xPl+sqI6z2p4kLh/gmVEHcxxca41b6Zj7q4YTAl/dmDI6xKzB
 8yOe6eTXXqZUQQ9f5PvkiAr4LlWS+TdbnJ1VhU1ZZtYWjv94BdUk1cK26Aa6R8/kNsXQ
 3SNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:cc;
 bh=yeeAa0FjS5z94Yg2NTYuBD1TCTbpYXe9jNUn8FfjqMg=;
 b=J0RRJZi33MdZM/j6bqSooqYmTPHjCM+N7tIHxpSUzrscT/3PWC1AY/CoAj++eA1EW3
 Lll40/pbPraA4onbAtJTY2hc1NqqeEKqlcwq3YKwP5emrPG4ZZdAVQOJ0nscjJ+9hb+s
 aWSxzfer5SqNvfoWDCN75P6oUzn+eWN2tFnO6FqwTShatVzQOrDtZJLjUcM56AMm2WcA
 MuIjRfgzskbKylcXZyIzOxqXNN8933/63GQbRzB1+odVJV2lqxnyJbkSQqXZWZbCMwQy
 OtF+Alg+L6A5MiVEdYAW7P308WCYQ2rip9SczRo37CZCr+/S5x5S7S+/a3HN4a+d8HBM
 oDFw==
X-Gm-Message-State: AOAM5317JRHMmw6ssZBmgwmHbqkVbkLz8d8kgACgeFK3uoOB8s0NAyIn
 96vVvyV4YBUtozJrFjRD5cVw6o1Oweuv17fBWbTcMnOoKnYGYVUj
X-Google-Smtp-Source: ABdhPJwY17UMhVUr2zBXxoCm1DpN+Rdv7Uqbf4ok3VHVTkczc6/goxnkd85U53VnJT0GOtPYPNrRpwiC759JsldFwsE=
X-Received: by 2002:aa7:d858:: with SMTP id f24mr26701295eds.12.1604508817257; 
 Wed, 04 Nov 2020 08:53:37 -0800 (PST)
MIME-Version: 1.0
References: <1604430353.311423080@webmail.emailsrvr.com>
In-Reply-To: <1604430353.311423080@webmail.emailsrvr.com>
From: Dashamir Hoxha <dashohoxha@gmail.com>
Date: Wed, 4 Nov 2020 17:53:25 +0100
Message-ID: <CAMucfLxWUdzx5LfiYRhE+yypY8zC6ch868RO_NV231GCMvZo6Q@mail.gmail.com>
Subject: Re: Using Wireguard for Geo redundancy
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Mon, 09 Nov 2020 23:41:02 +0100
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

On Tue, Nov 3, 2020 at 8:07 PM dxiri@xirihosting.com
<dxiri@xirihosting.com> wrote:
>
> Hi!
>
> I am looking for information on how to leverage Wireguard in a geo-redundancy scenario.
>
> We have a couple management boxes colocated next to each other that provide HA via a VIP that "jumps" between each of those management boxes depending on availability.

How is HA implemented in this case? If it is based on ARP, then I am
afraid that WireGuard cannot do the same thing.

>
> Now lets say we want to place management box on datacenter 1 (DC1) and management box 2 on datacenter2 (DC2).
>
> Assuming the VIP cannot move between DCs, how could you leverage Wireguard to provide the same level of redundancy but with geographically dispersed hosts?
>
> Any information on this topic or documentation that points me in the right direction would be really appreciated!

Here are some of the cases where WG can be useful:
https://gitlab.com/docker-scripts/wireguard/-/blob/master/docs/wg-usecases.md

None of them solves your problem, but maybe this can help you to
understand better how WG works.

>
> Thanks!
> Diego
>
