Return-Path: <SRS0=8OhL=F4=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB376C433DB
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 24 Dec 2020 23:31:35 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 19A5D22795
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 24 Dec 2020 23:31:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 19A5D22795
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e44748b1;
	Thu, 24 Dec 2020 23:21:33 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id df476ea1
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 24 Dec 2020 23:21:32 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1b7c2a09;
 Thu, 24 Dec 2020 23:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=date:from:to
 :cc:subject:message-id:references:mime-version:content-type
 :in-reply-to; s=mail; bh=sLE35t45WiHT3Ttt5Opxvpd1SA4=; b=XrZP4AH
 gA9/Yu92lFy8dXfo05h41ZYKwrNPuDtLkXK8cgOz8VINXP3yl2zMrEdATlbtuEwv
 hfo687pigqTqQXUgHJZxa+5oIe4PMkbTW3ZKf9axf+X1epU+TEGvezFioEqh7wdU
 LEghpVJExCKgaNSLNgktjhB4idOPaa5WY8jIiqHGIdQLAyNP94G7LLvxpX+N5X2I
 ykeZZc2Q9hQGnh1NF12ccvyzybI+Jj5dH4E5pqfQtjVKshScRkdeyPPoPna3OjXQ
 LbPcFCLBV0/bN8qvbXMHB3pyw6QoQDLQuWfEz9zE8utFvcEjfWX7vmYRnlyutlmL
 crCGlhZMQ6hlxHQ==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 29af2665
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Thu, 24 Dec 2020 23:22:17 +0000 (UTC)
Date: Fri, 25 Dec 2020 00:30:57 +0100
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Nico Schottelius <nico.schottelius@ungleich.ch>
Cc: wireguard@lists.zx2c4.com
Subject: Re: How to verify a wireguard public key?
Message-ID: <X+UkseUOEY1sVDEe@zx2c4.com>
References: <87k0t75h3e.fsf@ungleich.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87k0t75h3e.fsf@ungleich.ch>
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

It's probably wisest to ignore differences between public keys and
private keys and set aside any structure they might have by virtue of
being related to elliptic curves, and instead just regard them as
32-byte strings encoded in base64. Not 31 bytes or 33 bytes, but exactly
32. This matters, because 32 does not divide evenly by .75, so there's a
padding character and the penultimate character does not include the
whole base64 alphabet. 43 base64 chars can represent up to 258bits,
which is more than 256bits. So, you can either validate this with a
base64 parser and checking that it returns exactly 32 bytes, or you can
match against this simple regex:

^[A-Za-z0-9+/]{42}[A|E|I|M|Q|U|Y|c|g|k|o|s|w|4|8|0]=$

You can convince yourself that's correct by running this for a while and
seeing that it never fails:

while true; do [[ $(head -c 32 /dev/urandom | base64) =~ ^[A-Za-z0-9+/]{42}[A|E|I|M|Q|U|Y|c|g|k|o|s|w|4|8|0]=$ ]] || echo "FAILURE"; done

The endings are valid because those are the only ones that don't end in
01, 10, or 11, so that the string doesn't exceed 256 bits. And again we
can have bash bruteforce those for us:

for i in {A..Z} {a..z} {0..9} + /; do a="AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA$i="; [[ $(echo $a|base64 -d|base64) == $a ]] && echo -n $i; done; echo
AEIMQUYcgkosw048
