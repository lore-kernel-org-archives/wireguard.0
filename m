Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F40B4CA5FF0
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  5 Oct 2026 11:15:44 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id f95088fa;
	Mon, 5 Oct 2026 07:00:13 +0000 (UTC)
Received: from mail.posixcafe.org (mail.posixcafe.org [45.76.19.58])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id a77152db
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 10 Jul 2026 16:07:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posixcafe.org;
 s=20200506; t=1783699622;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:autocrypt:autocrypt;
 bh=IintiRVetl9RMlTWozo7EufveJqBCdn1bgHcEN3sCfA=;
 b=rmjT+xAUHe6y7kgqXlVW0Ck0v4tU/rc+w/Z+rBtraplT5h6Vb2GyN433Ksd2bB7Uj21IXg
 5woBKNpBiuWXNPgB5P+CNG/BsTXe254EHzDQmekBC+a28aJnwG7L9nsJP9OWrpQWzJW6Es
 5UERszf6HZ2yZB+spEueC4EXpi9cAzk=
Received: from [192.168.168.98] (173-26-212-115.client.mchsi.com
 [173.26.212.115])
 by mail.posixcafe.org (OpenSMTPD) with ESMTPSA id e9d6f237
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 10 Jul 2026 11:07:02 -0500 (CDT)
Message-ID: <8110f311-a05a-4b90-bfd2-b7364d0350b3@posixcafe.org>
Date: Fri, 10 Jul 2026 11:07:07 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: wireguard@lists.zx2c4.com
From: Jacob Moody <moody@posixcafe.org>
Subject: New implementation for 9front operating system
Autocrypt: addr=moody@posixcafe.org; keydata=
 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
 kA7wyn9tHMM41bDH8w==
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Mon, 05 Oct 2026 06:59:44 +0000
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

All,

I've been working on an implementation of wireguard for 9front.
I am starting to get to the point where I feel like the implementation is getting
pretty close, and its in a good spot to review before I do some tighter integration into 9front.

I know in the past I've seen some desire from the wg community to ensure that code using the wireguard
name at least be somewhat decent. So I wanted to share it here and get feedback if people felt inclined.

Grab the code from your choice of git hosts:
	git://shithub.us/moody/wg
	https://github.com/majiru/wg

I am happy to answer any questions regarding plan 9/9front specifics.

One note is, I am not currently implementing DoS/Cookie challenges, we
can respond to them but we don't currently generate them. This is blocked
on there being some meaningful way of measuring "under load" from just userspace.

Thank you,
Jacob Moody

