Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 962B9C433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 18 Apr 2022 08:47:20 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id b1d9f965;
	Mon, 18 Apr 2022 08:43:37 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.133])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id e265b769
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 18 Apr 2022 08:43:36 +0000 (UTC)
Received: from [192.168.177.41] ([94.31.101.241]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1Mn2Jj-1oNdwW2oOV-00k8Nb; Mon, 18 Apr 2022 10:43:35 +0200
From: "Hendrik Friedel" <hendrik@friedels.name>
To: "Kilian Schauer" <kilian@schauer.tech>
Subject: Re[2]: ipv6 vs. ipv4
Cc: wireguard@lists.zx2c4.com
Date: Mon, 18 Apr 2022 08:43:34 +0000
Message-Id: <ema52cc7e0-e1ab-4564-a4a6-fbb65abb12c4@envy>
In-Reply-To: <9ff861ea-6d25-4e63-ba43-615afe1b655b@schauer.tech>
References: <emdff71c03-470a-45f8-ade7-0343b0b698ab@envy>
 <9ff861ea-6d25-4e63-ba43-615afe1b655b@schauer.tech>
User-Agent: eM_Client/8.2.1659.0
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:fcCegs9+29pLXSLQRIKmXnePyEbsNOM1gtSn34PjYgUgLXwYpDd
 EH7pqIdzt6DR0w3XY/Ggry2FQhSZbOHRM+91r/dJP+xCR0Piwr0Mvjq+kj7W1TvWvndvv+G
 bVhiAhhQRpHV1Q+3tam66uWUSBcT2/ywu7XYaGXguIraNztpHkJHZyEaYlvVQu6kfwGCHA/
 z1VU4zaJqsmvyTPexM1WA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:UeuyRyVA4Yk=:zv7m1K1gjBKXpANdZfKLfF
 7Y5zLtrlqkiERtBJ1IUNDRxWKM/ySvr89wCBVlgMjOs8UpnzNU3IyKhlFSckwLPBQfKZrEh/U
 /5RVKnPB5gBjpO9E27F2n35DwptE/hHX6NxkS78Wd9Q+fJXVsMNAwT/Q/M85lwXFCk3wfYVmY
 cwA4thJ+YeFZtKbWhddAZLrpTpC7pH4Bj5vjb7RBNyLDnX4X6qR8SAfDgc2VPYWSX8jWwlNR6
 JO25e6G+FDpQaWKDMSB3I9lvN/WzdwWGC/ePfEFKE7DEf0CLjxpnn6o0/OykmDlcyUGuzpWzo
 hYlBkdQ8VyNTnvzBBkov8xRLaWGNRmSVQKLc+ft3k3u0q0a2FKAMSFwWsakzSixTbZPDo53ym
 2tmhrhHYNBsaR16RQK5ouWcj5DvP4o8T2ehrWAsH7vauohV49cabfbjjUC87hycRphDw7w9Aw
 MEHNA8rfIZoLUiGQXy58DEnyn0AlZ/AGvt1/RizziIYTx9d71AOaGytN62Inr5JBGsSlleBld
 VPZbU+uuXsyQAE5HW+BkxPiruypkAm26a5QV4zyWeBb+5MPbT9Tf33AYs+0l1pbD5vUAWDPsH
 KzKtcIPm46bBtZGbVANL54LoUg2CG0Z6TjswJR42E1fZpjH0kV9qtLr7UeTtF4Dt2EAWZ4X94
 oBUBSRwOQjs82CObZVOQYmfSvSwXqwyEszbGejmYlvYXwlFjCmKzFmkkktt4fDdd+w0w=
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
Reply-To: Hendrik Friedel <hendrik@friedels.name>
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Hello Kilian,

thanks for your reply.

>the WireGuard mobile apps prefer IPv4 for connecting to the peer, since th=
is helps roaming between networks (where many are still IPv4-only).
understood. Is that documented somewhere? For the Windows-Client, I did=20
read somewhere that ipv6 is preferred.
I find it inconsistent, that the clients behave differently.

>If you want to force an IPv6 transport, you either need to put a raw IPv6=
 address into Endpoint, or use an AAAA-only domain
Intuitively, I tried [my.domain.com]:51280 in order to enforce ipv6=20
(just like ipv6 adresses are enclosed in [].
Would that not be an enhancement to the app?

Best regards,
Hendrik

>

