Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D605CC3DA6E
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 20 Dec 2023 04:58:47 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 539eb5c6;
	Wed, 20 Dec 2023 04:58:45 +0000 (UTC)
Received: from w4.tutanota.de (w4.tutanota.de [81.3.6.165])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 6b608025
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sat, 8 Apr 2023 13:04:34 +0000 (UTC)
Received: from tutadb.w10.tutanota.de (unknown [192.168.1.10])
 by w4.tutanota.de (Postfix) with ESMTP id 74D9110602D8
 for <wireguard@lists.zx2c4.com>; Sat,  8 Apr 2023 13:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1680959074; 
 s=s1; d=tutamail.com;
 h=From:From:To:To:Subject:Subject:Content-Description:Content-ID:Content-Type:Content-Type:Content-Transfer-Encoding:Content-Transfer-Encoding:Cc:Date:Date:In-Reply-To:MIME-Version:MIME-Version:Message-ID:Message-ID:Reply-To:References:Sender;
 bh=BUxtINg/O8hpBW8EYnduGU5HTHmZzPo90ymB3Y3yXpY=;
 b=cLKLZ5iFKogf/kR83BOJIXcGS/MqFMwmUiGyTWyp2pfzM7i4pK618cvVyZftAyg2
 QjrzBOB5ET3AWjWUTR+dj3F1NaWI0x3mIPEVUoNjpPkTBXxQT0ClXZAnUZNjoFTa3w4
 tpNgzxKIUfdGmBCqj1KdP90JovBuwyZE6BbfEEjFauonesrEehLQm3wZq+rd+hmDuCB
 IPictQSulapp9Nq0lyewiEYZPaOql6qYImqoyv7wdnm1/sox9eyPcLtEeXl43G9Y/27
 Yf8GgvtapopDUe/wZGyhz0FGiQxWEcxcQNBFT3tSUm/AvI97uSILMDjXN0rAlRhOhm3
 6QL7HrH02A==
Date: Sat, 8 Apr 2023 15:04:34 +0200 (CEST)
From: "Leon J. Brits" <ljbrits@tutamail.com>
To: Wireguard <wireguard@lists.zx2c4.com>
Message-ID: <NSVxyu4--3-9@tutamail.com>
Subject: Multiple peers with one down
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Wed, 20 Dec 2023 04:58:44 +0000
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


Hi all,=C2=B7

I have a setup where a client connects to multiple peers. By accident one o=
f the pees (a VM) was down and caused the client to connect to none of them=
, and showed the error:
=C2=A0 =C2=A0 Device or resource busy: `<blah>:<port>`. Trying again in <x>=
 seconds...
for (about) 15 times with increased timeout between tries.

Eventually it fails and deletes the whole wiregaurd interface with all succ=
essfull connections.
I would like it to succeed and keep the successful connections and ignore t=
he unsuccessful one.
How do I do that?

Thanks for your time
Leon

--=20
 Sent with Tutanota, enjoy secure & ad-free emails.
