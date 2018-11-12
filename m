Return-Path: <SRS0=ArOK=NX=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1394BC43441
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 12 Nov 2018 03:55:16 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 68DB520871
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 12 Nov 2018 03:55:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="rDZQRXL+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 68DB520871
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7d87649e;
	Mon, 12 Nov 2018 03:50:10 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c97ec9a7
 for <wireguard@lists.zx2c4.com>;
 Mon, 12 Nov 2018 03:50:09 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fc1994c0
 for <wireguard@lists.zx2c4.com>;
 Mon, 12 Nov 2018 03:50:09 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id dfb5be4e
 for <wireguard@lists.zx2c4.com>;
 Mon, 12 Nov 2018 03:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=8NhGn+b+qfjcA01k6ag0RmVAGuA=; b=rDZQRX
 L+x1lxpIYfLueTE4mzZv0ovcdftga3ytD6uf3E7e0RkeOuU01UcuuFHGXchYZNfP
 7991fIiGYV9UpB9NdCXRqzsaEW4z/OM2e9xLGGePi1pKyitZPspyxVBHJxWJE4Y3
 WiAljDRdTGGSEgUVSZ5v8edoLqmxu3QtkCbVZXyPuMZmkZCwNX2IPWvddJvcAUsi
 X42xp3sPEe9bY+yfOq22xJclYARai7nbQafTZ0SADgs7AGg3+y8meUU5i5fOw4tj
 GRYXCbKTqr0r4qUrGQM9xdL433J62dsASFaLsccxNH8P8RhTCi1elqmA92WV1BpO
 tcoi+SF/sb5T9hHw==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 680865b8
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 12 Nov 2018 03:50:08 +0000 (UTC)
Received: by mail-oi1-f169.google.com with SMTP id a77so159082oii.5
 for <wireguard@lists.zx2c4.com>; Sun, 11 Nov 2018 19:55:11 -0800 (PST)
X-Gm-Message-State: AGRZ1gKroe8zmTuHzu5zSbxMxDrs1sQ626TnrIXbTBH9Ee28JvZblmPp
 w0H8vemEOlKl73bsWoVlhNQXZjzqSL0c6KxPO+s=
X-Google-Smtp-Source: AJdET5eFAz84CyBBllctaSzpc/5GffBy64ovOEdK8wBSktIM/g+3WRIlevzMeOTJO7AQlTBWOVYwV8zUDLA5xn0DhGc=
X-Received: by 2002:aca:3b45:: with SMTP id
 i66-v6mr10957021oia.52.1541994911121; 
 Sun, 11 Nov 2018 19:55:11 -0800 (PST)
MIME-Version: 1.0
References: <CANcuY=rLL1mX2FLHgL6z2fDcrRE9pbHT50MnOcEi8TsGGWDo+w@mail.gmail.com>
In-Reply-To: <CANcuY=rLL1mX2FLHgL6z2fDcrRE9pbHT50MnOcEi8TsGGWDo+w@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sun, 11 Nov 2018 22:55:00 -0500
X-Gmail-Original-Message-ID: <CAHmME9p8eec+gRyh8wy2E8VdFmDenO0JdVXBaQFMNqGKoQ=KZg@mail.gmail.com>
Message-ID: <CAHmME9p8eec+gRyh8wy2E8VdFmDenO0JdVXBaQFMNqGKoQ=KZg@mail.gmail.com>
Subject: Re: Debian unstable Pin-Priority too high in Installation
 documentation
To: Laszlo KERTESZ <laszlo.kertesz@gmail.com>,
 Daniel Kahn Gillmor <dkg@fifthhorseman.net>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Hi Laszlo,

Thanks for pointing this out. Presumably this is a suggestion for the
pin priority listed on the install page of the webpage? Or some place
else? I've CC'd dkg on this email to ack the change.

Jason
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
