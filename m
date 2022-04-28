Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2E98C433FE
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 30 Apr 2022 14:41:39 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id c32fa8b2;
	Sat, 30 Apr 2022 14:39:48 +0000 (UTC)
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26]) by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 8b57383b
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 28 Apr 2022 13:14:37 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id E7D6F5C0152
 for <wireguard@lists.zx2c4.com>; Thu, 28 Apr 2022 09:14:35 -0400 (EDT)
Received: from imap47 ([10.202.2.97])
 by compute2.internal (MEProxy); Thu, 28 Apr 2022 09:14:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=feld.me; h=cc
 :content-type:date:date:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to; s=fm3; t=
 1651151675; x=1651238075; bh=ucqs1OjlbylvKxJvRnntyiwH00uj/sTk91X
 qmwaWQ8I=; b=pqPzw/ocqYLljJ6ZzEJuqTUAyJ53w47tO4w1FpxtWqd4y6cHeUy
 7vOjolabriqgDv8oaur0dOJGS8RlIvJvoC0Z6+XxIcRGBqmC64PpBI19xqEHC0ii
 lv2ROsEnrFYRkU208sV5g3zkdthoPnROZuWT0HEp7rBmn9Xr+NbVKEnv1PnrgLV8
 JUxXgEIFaPoK0+6meXIf/ZNa/LIdouKcWQaytzyhcllPC1ZlpyP8wW/MsmRISypR
 7v42y1MMldyoHc6avE2kMLrhuIZ9+2Xzn6otGYaOjVt7iFwnfbKEK2b0Uz5Q5FGm
 ZfNh5gUzzWb7EXqTxPPwGWUB2jXjvgFQ99A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:date:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1651151675; x=1651238075; bh=ucqs1OjlbylvK
 xJvRnntyiwH00uj/sTk91XqmwaWQ8I=; b=f62T771fZFwcTZ3i6/BSiG50s3ifb
 26Jn3kxjEgRV/icxSzZRKTTekRUi6aoeJDike8takPl73bA6TLj4eCuJT4CYXEhU
 ASRp4sjdpQCVYW3o6+E5jZvRQzPo50VI9n8c9/5BefPtYUr2+IG+J/LBos7IsjMI
 GtZJxUtebgSw9l8TjD6mAbIc64Y/boU00zGsCNgX4eSnEbedAcK1oxNm/28Y61Xk
 djYCdGCdH7aZZ5KRuAO4pcaIxUYcIqNrg6ubxFD4kQXeXojeY0xwvbK8LqH/nKiM
 UdcvUr9di8QI6tJXK/1UXHg/JX5+eKLOvGDnQIyGt4fDYYxv/pP8daY5A==
X-ME-Sender: <xms:O5NqYmRB3-dFlept9h2uSc4uRr7fON4kjduoRjlX9x7F5kbAXNnrbQ>
 <xme:O5NqYrzL9JYHV0aKR9S3c3QZanXbawYMM3wXoQo71W7YH5DbnIlutao_8zPmWvbsm
 g2s4uDjy4UZGe2w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudejgdeifecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhepofgfggfkfffhvffutgesthdtredtre
 ertdenucfhrhhomhepfdforghrkhcuhfgvlhguvghrfdcuoehfvghlugesfhgvlhgurdhm
 vgeqnecuggftrfgrthhtvghrnhepgeekiedukedvueejhfejgfehffeujeffgfegtdfhff
 fgudejtdeuleegvddvieefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehm
 rghilhhfrhhomhepfhgvlhgusehfvghlugdrmhgv
X-ME-Proxy: <xmx:O5NqYj3_9QWg4_I1l3dS3AsHIDnXoaRw9dwTxr6Qy9Sg8EPToD-ShA>
 <xmx:O5NqYiDnLQQ9tD0ul7l1DbyCilcXcovogizVChdij9ZIMj8ijunSCA>
 <xmx:O5NqYvjs9RIj_u0U2vVgfsM0eSWHifcEYKjs_4dGFj4nT6KP0mPdiQ>
 <xmx:O5NqYhc6CCZhOJJk6QEq0cNoSlLd4O6IPXDUC_7dwnSfan0djaPcHg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 80B58A6005D; Thu, 28 Apr 2022 09:14:35 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-591-gfe6c3a2700-fm-20220427.001-gfe6c3a27
Mime-Version: 1.0
Message-Id: <80f2d9f4-9917-4e59-87fc-6713e80b1880@www.fastmail.com>
Date: Thu, 28 Apr 2022 09:14:13 -0400
From: "Mark Felder" <feld@feld.me>
To: wireguard@lists.zx2c4.com
Subject: [MacOS] DNS search path not working?
Content-Type: text/plain
X-Mailman-Approved-At: Sat, 30 Apr 2022 14:39:45 +0000
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

Hello,

I've observed this on MacOS 12 Monterey. I have also tested on iOS 15.4.1 where it works as expected. (I know they share the same codebase).

On MacOS I have my DNS configured correctly as DNS = 1.2.3.4, int.foo.com but it doesn't seem to actually work. e.g., if I have a host named server.int.foo.com I cannot just "ping server"; I have to use the FQDN of server.int.foo.com.

This behavior works correctly with an OpenVPN connection using the Viscosity software. I have compared the output of scutil --dns and verified that both OpenVPN and Wireguard appear to generate identical DNS configuration. I'm not sure where else to look for differences between what OpenVPN/Viscosity and Wireguard are doing.

Any tips?


Thanks!


Mark

-- 
  Mark Felder
  feld@feld.me
