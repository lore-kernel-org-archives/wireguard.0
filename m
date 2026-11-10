Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53A45606A31C
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 10 Nov 2026 18:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20261015.g header.b=WJrpc4G0
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 9be4c7ea;
	Tue, 10 Nov 2026 18:03:45 +0000 (UTC)
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 3a0279db
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 10 Nov 2026 18:03:43 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-c5060a48ba9so69136566b.2
 for <wireguard@lists.zx2c4.com>; Tue, 10 Nov 2026 10:03:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794333823; cv=none;
 d=google.com; s=arc-20260327;
 b=gCV7X+vzaBy92qIsM5DmqKJoHf60IvhliAP58KvLL4pME+K9Yc/1J0yV5Vd4uzakEx
 WF1GOc6Z9h7TYHSFdrFlnPypOf5G6X6Lxe2SjINb21REi5SxDYEVJQwN0foeQI/pcWTZ
 B+L/Wacql8kImw3aWIWuZ+QYAjnGMIDD9UVoZ77cfazWENtXohd6CeK4xWlwvdcFT9BV
 5ZxGYMnAurpyDWNI2WeVapLT9VW54nT5ti3LBdRjkB1EVJLGNqpVspXtKLXnUwgZQw0b
 jAg/04V1Yj4KERU8tm24rArxNeKgX63EiZ+3sRMF2X4pMNXekcuQlDwipUExQP0i/fMD
 owNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=lzQJ9a5l1BTcj++f5PsFJW71LnXsNyCRLPczNlEpe/8=;
 fh=idyCSe7dilMlteEwZZgn8eaIj+kzevlg6ZoJ2i+92+0=;
 b=A7RRThONrfST0D411d0A0mCeqsz/2Go9odNSztcoHaqCAMFb/L0/fLr9fx8fTFxUB/
 6fSYzg1Ad6BMLmXL6s7ZavYL8gx4WjrG2bbmsCUIKuIAfYCtR4zWu/1GrRJw6t+roFC9
 /yRN/5RvAH6Q3UHZijPcooSeM798mZyejwMYklt/Qqf94hozjCR4lqlWMTboZYyy8i1f
 /ZzhUIoTQ52aJ7gzukn9GNkx7P6g1laA0W3yfI0Hur5ICxKN3knT0dHahrXM5ohoWUyy
 yhb8ehBLJo43IiJcCxUlUpuBI9A2cNhL9uB94SCjiq1Mb6k/RixlFxif1JaVF/bHpcIP
 xqFg==; darn=lists.zx2c4.com
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=zx2c4.com; s=20261015.g; t=1794333823; x=1794938623; darn=lists.zx2c4.com;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=lzQJ9a5l1BTcj++f5PsFJW71LnXsNyCRLPczNlEpe/8=;
 b=WJrpc4G08AM/OaxOAX7W7wTMY8q6jn07fZrmuGmIxAkeMAnJlF0vQHvcBo3pK5s1C/
 1PAhkTiOk+P/FQ7xZTUOtaDsH8AhKgf4GbFJZQU45LYgADvPI5c1yAJlxHzktmJ2hZ7T
 C8U3JzKQR+mAONbKW2tSMfY+SWDZPaf2o3QyFTAbHwgOINmMpFibnMnNz78cZa522z8z
 rhjtkPcSvMO+t17d9qJDKlbRB0okJTslbItGptCpKlTnG0rJgDUQRjw+kAmzYnW9/k9c
 pUyN7YDOy92act9809Z0tODX58EEmtFzcL6xqPU3aWeBPAIMXSjgrHpmKDMtw5tsDcI7
 3/ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794333823; x=1794938623;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=lzQJ9a5l1BTcj++f5PsFJW71LnXsNyCRLPczNlEpe/8=;
 b=fR21aCpIR0L1aeKUHbOqpeIl/1654K82dee4wvXERO4g4KpxQ2m1uSWkbLg+H2VKGo
 g5TZwjlnblpHOoULsMz4MQ2YxciukBODhDXS50ASsBD6sINh1ynL2Aqw0cLHYuRyM5ZP
 sHQ12XdEEJwlIawSGjK7/zA3Un6tBj7xPfXPxK5VQNS55TBSNGrsXTFsfuOfOz1MIyKy
 IhgRqB+Bwjme1H3tZcrJuSHKstWcm2UkNRP3Lek1bZX/vAvBG6rIZlvfPj1EXa9Pyd9v
 1eUxTagVXxDT/OIZ9AALMapsM7fnHIWPOiEjBwLR0G081iDE7543bMthIXLYaaCkp/53
 9bkA==
X-Gm-Message-State: APuU4Z/Eq2/PLe0Vjvri0rz0vJ2ewL8ylWJSh+g7wIhcPTyMJ5lvhjPh
 p2xBoAIuX+yvkQQrhy0iQ7KXP1GhhZ1vRznECUwfGlxZ219nskSQCsdx4uOUI7O/wifBOIjAO8V
 eb35Uj5YCZnnF2/qJhCr2+GMQR9PCbGeD5ee6OAgecevOHQ==
X-Gm-Gg: AYBFou3kCOrU4QKNc248mbAzsvHA4w8g2AU+BYS5B+galwo6dYSx33F9BNecTrYyvJf
 RiyVKTzCZ0Y5OLbXDa04I224gLbHV2OpSIDaAW3pLm7LsLZf/Vzy4xgDN4lM+1sM9DeOEmjIGJK
 svSE/hQseaHqCJr5gPu6HRUhDh9N+0fyxGbNUz2gQajCvx2xAGG2k98odCOYRdWu8zLyB8ixG33
 ELQft7oU7UIOZauNZcjG3RxORXdKGvmjCax/I4jhzXPa228N9j2WqVrp6ah02fHTTuHu4hMldZM
 BQWEtv/nrGf+sgsbkdgKT7tNPQm7nWFvQ3/YF19PpLj73y48rn0mqmddQ8XIO56sNVS2jgXDaEL
 SrRGSf0Fx77VsFrZ+PWuPBuuQKTm8njQvHeMEjPmwTarAoj1/uX9y919dH0l3Pwm6oxlYHHZPqq
 URvtKijFqM51aPGc8kUcEO2HZ948qBJaDctny2v0/5hiVvLUzETA2cuQYiyYEwxqmwRm3SU52wh
 /uJT3Rf4am3hOyOXZRCZ90Clw==
X-Received: by 2002:a17:907:c0a:b0:c42:3a77:80e5 with SMTP id
 a640c23a62f3a-c5049583e86mr302817566b.29.1794333822814; Tue, 10 Nov 2026
 10:03:42 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <116cec552f58748d434d4825c6c74f39266b265f.camel@infradead.org>
 <avNCdbpjxM752XSw@zx2c4.com>
 <89b5e08e2a48c33be4cf2d495266d04a2dcf406e.camel@infradead.org>
 <CAHmME9pWbftSmnJgLawNmWxNHMEqC5evxWPW8TruYkBD18Q8nQ@mail.gmail.com>
In-Reply-To: <CAHmME9pWbftSmnJgLawNmWxNHMEqC5evxWPW8TruYkBD18Q8nQ@mail.gmail.com>
From: "Jason A. Donenfeld" <jason@zx2c4.com>
Date: Tue, 10 Nov 2026 19:03:31 +0100
X-Gm-Features: AclHuK_PdK0XHi04omXe90eJidcgcAUUNUP4KnWXn-FWg3xkjBKoqqaRiccjqWc
Message-ID: <CAHmME9ow3N6soH+WwW+MZsDG9VeKW5WK4dYA6k29Cxi7UQtkYg@mail.gmail.com>
Subject: Re: [PATCH] wireguard: socket: fix sticky source address on p2p
To: David Woodhouse <dwmw2@infradead.org>
Cc: wireguard@lists.zx2c4.com, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S.Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Antonio Quartulli <antonio@openvpn.net>, Ralf Lici <ralf@mandelbit.com>, 
 Sabrina Dubroca <sd@queasysnail.net>, openvpn-devel@lists.sourceforge.net
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.30rc1
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

https://git.zx2c4.com/wireguard-linux/commit/?id=6d02c757940afc798e0eb294108262c3e55b1c5d
