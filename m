Return-Path: <SRS0=LfNZ=6Z=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40363C47255
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 11 May 2020 09:55:26 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A7A73207DD
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 11 May 2020 09:55:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MLOPMSyW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A7A73207DD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ebb473b8;
	Mon, 11 May 2020 09:42:06 +0000 (UTC)
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 525cad66
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 11 May 2020 09:42:03 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id x17so10131165wrt.5
 for <wireguard@lists.zx2c4.com>; Mon, 11 May 2020 02:55:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=y0J+7ERbHpvHHytE9yd4VmcHDO1zZ0A2OEqmncmVW2w=;
 b=MLOPMSyWR+PEptkp/IIlv1ohXM0mk9xDZA/48V4W89Trh8f88vbgTudXEy9QxTkEPQ
 TFo6iUYAjyje53HX/FI2xtvbQWij4Hb3v8NhYTwtAAO3VlzBcY8Bz3lyk4VEpLY00CXO
 covJI7Mi4rugGOq7hUtyqaJneQb32L3KL16DWmDn6SBiy7S1yIFqiHAwfk+9BqDvv0mc
 tCOEBrEQb9x1+nRsH2c3oEe6iHstd+I5/Di1LYkFG8FjZa5P7NSWA/zHcKuiSzOXptyQ
 LCOv3LuB30thMfwvl+/FIxOIBSga44NfqtWyUjsI0Z+4Xruu1/FqYZaYQGkLUn11SHeo
 kAfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=y0J+7ERbHpvHHytE9yd4VmcHDO1zZ0A2OEqmncmVW2w=;
 b=XGDeGKLBYeU9H1w9Sv4Y92jVIZ4XXEjHOOOvtc8m10wouARulHKadwAHPXHp8UfLro
 koAdENeoqdDQoEFE5k/tMPaIltMVKpM9vM3ROj6ViC1tvbcqiCs40vgHkiEENDKCqMUm
 Nq9WrtWJhn/UVUVqHPJGpjRhbTXUS9VEy7dvXwqRFADH3s7r7gLE/rgFdRQ+aZNl/pei
 9WWlXkwtS+S+Q4IkWNgrgCnMH8emVWkvjtidpmaeQq1sc4h1Epf0IWZ2kI9fNMdcp6V7
 pBRnw1oZCWUWVL0jmQGnJK3q2BFHXZKGk/NiwTDfJAMkCZ8PYYUEWGJg5fP44d2AKXH5
 RGXQ==
X-Gm-Message-State: AGi0PubS6GQVDuTw/Ar3OdEIxoEAnZlo3LkHIkR07Qjauf9Y6VX92QrZ
 KrlaORuzrS48JJdNFGvtL4goT2HT23kKrBkFu7g=
X-Google-Smtp-Source: APiQypJRuGomqmgNzCUivy2rffwsJ+2Z3+Sqtk4+QBQqyXzHCTCJ6nV4/mwedAa0x8g6OxZm5sI/phRSzzLxvXZcpFY=
X-Received: by 2002:adf:a1cb:: with SMTP id v11mr19342777wrv.39.1589190920225; 
 Mon, 11 May 2020 02:55:20 -0700 (PDT)
MIME-Version: 1.0
References: <f27176e3fc6ede8d04682a9b504df177@rfraile.eu>
 <CAHmME9ovg+BBhVkKoNDd2LD-C9ChuBW5VXgj4n4V-Cp_-g0uiw@mail.gmail.com>
In-Reply-To: <CAHmME9ovg+BBhVkKoNDd2LD-C9ChuBW5VXgj4n4V-Cp_-g0uiw@mail.gmail.com>
From: Shawn Hoffman <godisgovernment@gmail.com>
Date: Mon, 11 May 2020 02:55:07 -0700
Message-ID: <CAPqQDTAgsbLq3rdnXJHooxbMtWY5JADfTPUO_jo6MdxvTuGqrQ@mail.gmail.com>
Subject: Re: Search Domain/DNS Suffix
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
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

On windows, currently the following has to be done manually / outside
of wg flow:

PS> Set-DnsClient -InterfaceAlias name -ConnectionSpecificSuffix "name.com"

It works fine (although the lack of PostUp, etc is annoying) , but
would be nicer if it could be easily configured the same way.

On Sun, May 10, 2020 at 11:26 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> Your wish is my command:
>
> https://lists.zx2c4.com/pipermail/wireguard/2020-May/005415.html
>
> DNS=8.8.8.8,8.8.4.4,mycorp.net
