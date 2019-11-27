Return-Path: <SRS0=OnWR=ZT=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1980DC432C0
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 27 Nov 2019 12:42:35 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B104E2068E
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 27 Nov 2019 12:42:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="xZVMxMoR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B104E2068E
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9ad15992;
	Wed, 27 Nov 2019 12:42:02 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7b8217a8
 for <wireguard@lists.zx2c4.com>;
 Wed, 27 Nov 2019 12:42:00 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ddbd85ce
 for <wireguard@lists.zx2c4.com>;
 Wed, 27 Nov 2019 12:42:00 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4bf6096a
 for <wireguard@lists.zx2c4.com>;
 Wed, 27 Nov 2019 11:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=hK2RN3nMYBwZR0ews6PY9YC+tl0=; b=xZVMxM
 oRkULFaa+z/QdhTFajFK8D40aM0dhp+1soWVpXoOP1oGclFioVUCzjM3sI/Qoj5x
 PsID5ELobG5PwaIK8hLVHH8+6NVmSwgFkHmSj8xM3MhATnQNKLNXtIVjmQ5gY3+j
 AjONZt1L0NZ+E9drVROHJw0x5JkJ7T2oNdAO1wG9rNgtmmBl360koF56AUGrIXlr
 8A1y70WyHE6kd2qVmcEg36QFo4X0E1TwtULv30h6sfxYGkDPvugPXPt3puBjUjFf
 Tu3/PTGe+j9znYXPd5sUM6fbAldNMurijHNwhwdf1S51zIWVgUD9lmkzcIhFcfJO
 sYY8Kbp4ejmuGGKA==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id c0880d72
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 27 Nov 2019 11:48:08 +0000 (UTC)
Received: by mail-oi1-f176.google.com with SMTP id s71so19902907oih.11
 for <wireguard@lists.zx2c4.com>; Wed, 27 Nov 2019 04:41:59 -0800 (PST)
X-Gm-Message-State: APjAAAW4jed2bg5PcK2WSiWct+63tvF7a64ZFZf7qldgG9WPMLBhK9zS
 0ClCYmeOk616qVWRDT/UdPvNhIFP/pNJxf81Cww=
X-Google-Smtp-Source: APXvYqyM6/F6NDIWM4RQyvLmhs0eH8fcRFbwU4dL/KycCH2t2YqxqcAQTQJe3Doqw2k6y1214cis29lOEmepILcALy0=
X-Received: by 2002:aca:4b88:: with SMTP id y130mr4170945oia.52.1574858518756; 
 Wed, 27 Nov 2019 04:41:58 -0800 (PST)
MIME-Version: 1.0
References: <BC5A60FB-A4C4-4713-B82B-C13566102147@icloud.com>
In-Reply-To: <BC5A60FB-A4C4-4713-B82B-C13566102147@icloud.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 27 Nov 2019 13:41:47 +0100
X-Gmail-Original-Message-ID: <CAHmME9p7OFV=Cb6OZD2gkdY6vjXNfHgEcnaD+OfWj-CmoCWSTw@mail.gmail.com>
Message-ID: <CAHmME9p7OFV=Cb6OZD2gkdY6vjXNfHgEcnaD+OfWj-CmoCWSTw@mail.gmail.com>
Subject: Re: Possible to add to allow importing xml file with multiple tunnel
 configurations
To: =?UTF-8?B?5b6Q5ZWf6ICA?= <birdman_hsu@icloud.com>
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

Seems like you can have multiple sections of the mobile config file
per https://git.zx2c4.com/wireguard-apple/about/MOBILECONFIG.md
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
