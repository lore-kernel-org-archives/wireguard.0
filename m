Return-Path: <SRS0=LfNZ=6Z=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EA4DC54E8D
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 11 May 2020 21:25:44 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AFDA7206F5
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 11 May 2020 21:25:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="OnTd99bB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AFDA7206F5
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a606eedc;
	Mon, 11 May 2020 21:10:34 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 180eb200
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 11 May 2020 21:10:33 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c527d731
 for <wireguard@lists.zx2c4.com>;
 Mon, 11 May 2020 21:10:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=blLERHrQ7ZJ4LNoEu8WYKP2qbQE=; b=OnTd99
 bBGyfqhsPBZMiDLQVUIDcjz4ywb8PubRd1n0sk3CR37WDgIsHu0q8Z/5UIoLphxK
 0zyRFu1iS7pjCczT8G+WuT1wlXABtwccqb5FU0XLKt3CvJ8Nvq6XUMQeLRaW3IY2
 MR9V6DfMTPIEd+dw/EAflAiNs8Wx6d1j2O6lGazFofwFDpA2L8Pu/VIXwAn3Bs81
 n6HRp9xK92ogx/juLY7iL2WRHQlNWRZT7dtVGnKPV8qtlPs/zlOJorYHPDV6udrf
 uT+8IsiTp+jjczz1z5mEBhS4jOdY6hxQK1lXwtfje4k9oTx4JJnjtBnQNZ6IhTVq
 YxFMWWe8C91EPMgw==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id b9a86511
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 11 May 2020 21:10:31 +0000 (UTC)
Received: by mail-il1-f175.google.com with SMTP id 17so3060387ilj.3
 for <wireguard@lists.zx2c4.com>; Mon, 11 May 2020 14:23:53 -0700 (PDT)
X-Gm-Message-State: AGi0PuZHrfKcAe1OsuStk/pidYUOUVEjvR0yRqmVHPgyDKd7+KevvgZe
 4ut3JSHEjH3tLhcBWPLwLtmXowoG5+RS65Y7ybA=
X-Google-Smtp-Source: APiQypJxUjEbruzGN5B4raXDN6jVKY1n1Ub/HkBoSXH7isWmXt/nvv1ER2cDSpJq6B1RIYNCI2VN3ng22lI+olXXC7I=
X-Received: by 2002:a92:5c82:: with SMTP id d2mr18678276ilg.231.1589232232612; 
 Mon, 11 May 2020 14:23:52 -0700 (PDT)
MIME-Version: 1.0
References: <f27176e3fc6ede8d04682a9b504df177@rfraile.eu>
 <CAHmME9ovg+BBhVkKoNDd2LD-C9ChuBW5VXgj4n4V-Cp_-g0uiw@mail.gmail.com>
 <CAPqQDTAgsbLq3rdnXJHooxbMtWY5JADfTPUO_jo6MdxvTuGqrQ@mail.gmail.com>
In-Reply-To: <CAPqQDTAgsbLq3rdnXJHooxbMtWY5JADfTPUO_jo6MdxvTuGqrQ@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 11 May 2020 15:23:41 -0600
X-Gmail-Original-Message-ID: <CAHmME9qDF+-4Ct08oua4yGF8y1-__Was8ik7F56vmYmiE7YhVQ@mail.gmail.com>
Message-ID: <CAHmME9qDF+-4Ct08oua4yGF8y1-__Was8ik7F56vmYmiE7YhVQ@mail.gmail.com>
Subject: Re: Search Domain/DNS Suffix
To: Shawn Hoffman <godisgovernment@gmail.com>
Cc: Ricardo Fraile <rfraile@rfraile.eu>, Simon Rozman <simon@rozman.si>,
 virtualdxs@gmail.com, WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
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

On Mon, May 11, 2020 at 3:55 AM Shawn Hoffman <godisgovernment@gmail.com> wrote:
>
> On windows, currently the following has to be done manually / outside
> of wg flow:
>
> PS> Set-DnsClient -InterfaceAlias name -ConnectionSpecificSuffix "name.com"
>
> It works fine (although the lack of PostUp, etc is annoying) , but
> would be nicer if it could be easily configured the same way.

This is why I wrote in the release notes, "This new feature will be
rolling out across our various GUI clients in the next week or so."
