Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86E16C636CC
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 16 Feb 2023 14:52:34 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 98d1f80d;
	Thu, 16 Feb 2023 14:52:31 +0000 (UTC)
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 0c6b937b
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 11 Feb 2023 15:39:34 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id CC7D45C00C8
 for <wireguard@lists.zx2c4.com>; Sat, 11 Feb 2023 10:39:32 -0500 (EST)
Received: from imap42 ([10.202.2.92])
 by compute1.internal (MEProxy); Sat, 11 Feb 2023 10:39:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=unexpl0.red; h=
 cc:content-type:date:date:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to; s=fm1; t=
 1676129972; x=1676216372; bh=HLS9csEARpDqZX036Shk+DAgoyt+s+IfV7/
 5fqGqPsw=; b=wyMKM0zhTKKTlvviCZxAfhVqsQuizQpPyY/XReiz8j5Nnc5H+Ba
 rkFvNOIefQIYur0VBw27Rj6tLqC/QhVcLTjjVwKbwMNk9jf18rYmRmJrAlog72nT
 WLeIX4WbFyYllMS+EVI+jqRdhbYVgkwcldpa4pSTd2p8CRPtIet3vrb6nplxaf0a
 SjPHOVb8E6L9tHkhoOQJgTyWceKarZ4a/Z1/nlt1QyMlZTvf2+eH0WqVm7Qb3ebg
 C33TU1wppm7moZcQ49oI4PZZSGiFrgAgCF9fzTOwM+7BD0FWbLFZPm2Tn+kW6Qjk
 pc+RnXfoPawqy33hSUTlB3XOlPTf6t/1YaA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:message-id:mime-version
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1676129972; x=
 1676216372; bh=HLS9csEARpDqZX036Shk+DAgoyt+s+IfV7/5fqGqPsw=; b=H
 jhgATjYs4NLEFOdSPMoAyV9ojeElv6TXcV3eWhMvF9tE4zF58IWiE3PX4k9vw3cU
 sGrWhgYB8MheYP6HOaTFcD2BkyKG7u04CiCpjzBnwCLDk3sDvFmb3RZsI7/be7N2
 HgFCvn5LIn6tnYgUUCLo0trit42jgNB8XVlP9fN9ohRK3m5RFD4dHjbXhA3fHUiq
 p8fxcFPUK2MFI/ZlrUvhOTOf7n6jCwifc/cGZeMp2rhxkrGGEUka0u/HZML3u2nD
 oakSlni5rm1EbPluhGoE6jHsuW7CSYFmb9L+1H34ooguS2+ZisEczvanrminEN9A
 bl6qbjKIT7NeCcF4WoLAg==
X-ME-Sender: <xms:tLbnY7I0vWKVg_AnxvQgZlJ38ieblzmZuSe8M69I82wvtEys4ugY2g>
 <xme:tLbnY_J39T-GFKaCKqhP2oE5LogrQG9kZbh-MXfNhyZuNhQXjaYy0MlzcW-FMSCp4
 7ss6jKZxdAa-_6vg9k>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudehjedgjeekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefofgggkfffhffvufgtsehttdertd
 erredtnecuhfhrohhmpeiiuceougiimhesuhhnvgigphhltddrrhgvugeqnecuggftrfgr
 thhtvghrnhepteeghfekudekieegtdejteeihfdthfejtefgfeeuvedvgefhtdevveduke
 dvheeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhep
 ugiimhesuhhnvgigphhltddrrhgvug
X-ME-Proxy: <xmx:tLbnYzvWvys4Jqx8HeVSS-1sG8DYqGlNrqDDTtVz2wDD2mV1C51zXA>
 <xmx:tLbnY0albuhsfsHobDVcvd9TETWIEQyprhA6RHS7c_jcjiS9b86TBw>
 <xmx:tLbnYyYHZay_KptWQlrekNgHjpbA4lQ6qWCw3z3ZskJZoF-F3RbtJQ>
 <xmx:tLbnY7nDKPbvIBrxPx-Bo5Odp0g8d0qZZu947Mpu8Y9H2cpyYHUjhA>
Feedback-ID: i0fcc46dd:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 91997BC0078; Sat, 11 Feb 2023 10:39:32 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-156-g081acc5ed5-fm-20230206.001-g081acc5e
Mime-Version: 1.0
Message-Id: <0685312b-2d0f-495b-b321-80d46326b764@app.fastmail.com>
Date: Sat, 11 Feb 2023 15:39:12 +0000
From: z <dzm@unexpl0.red>
To: wireguard@lists.zx2c4.com
Subject: Noise Protocol Question
Content-Type: text/plain
X-Mailman-Approved-At: Thu, 16 Feb 2023 14:52:30 +0000
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

Hi,

I was reading over the source code for wireguard-go, and I noticed something in the device/noise-protocol.go file that I didn't understand.

There are six invocations of the sharedSecret() function, which performs the X25519 operation on a local private key and a remote public key as part of an ECDH key agreement. 

The first two invocations check for an all zero ECDH result.  a.la
ss := pk.sharedSecret(pubkey)
if isZero(ss) {
    return nil, errZeroECDHResult
}

If the result is zero, the operation is aborted.  The subsequent 4 invocations, however, don't check for zero on the output of sharedSecret(), and continue processing regardless.

In two of the 4 cases, I think I get why it isn't necessary, because the sharedSecret is used as input into an aead.Open, which would simply fail if the ECDH got zero'd out somehow.

However the remaining two calls are associated with an aead.Seal, which would succeed, no matter what the shared secret is.


TL;DR  Why is wireguard go not calling isZero() on the output of the ECDH key agreement every time?

Thanks,

dzm
