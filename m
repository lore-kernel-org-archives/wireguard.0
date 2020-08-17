Return-Path: <SRS0=FBn0=B4=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37E2FC433DF
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 18 Aug 2020 11:37:31 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C40AC205CB
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 18 Aug 2020 11:37:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C40AC205CB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=jku.at
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f98f0c6f;
	Tue, 18 Aug 2020 11:11:20 +0000 (UTC)
Received: from emailsecure.uni-linz.ac.at (emailsecure.uni-linz.ac.at
 [140.78.3.66])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id d17a3a42
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 17 Aug 2020 14:38:21 +0000 (UTC)
Received: from [140.78.57.134] (pnp134.pnp.jku.at [140.78.57.134])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by emailsecure.uni-linz.ac.at (Postfix) with ESMTPSA id 4BVclC6KJtz2PPx
 for <wireguard@lists.zx2c4.com>; Mon, 17 Aug 2020 17:04:23 +0200 (CEST)
To: wireguard@lists.zx2c4.com
From: Daniel Hofer <daniel.hofer@jku.at>
Subject: wg-quick: "Endpoint" inside "Allowed IPs"
Autocrypt: addr=daniel.hofer@jku.at; keydata=
 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
Message-ID: <7706462a-3f7f-bbe9-46ea-8bd31332e70a@jku.at>
Date: Mon, 17 Aug 2020 17:04:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
X-Mailman-Approved-At: Tue, 18 Aug 2020 13:11:19 +0200
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

Hello to all,

Since this is my very first mail to a mailing list ever, I hope I do not
make any mistake (especially because I could not find a bugtracker or
something similar to write my issue to).

I am working at a university and my institute switched to WireGuard a
few weeks back, which lead to the the following configuration file:

####################
[Interface]
Address =3D <Private IP>/32
PrivateKey =3D <redacted>
DNS =3D <University DNS>

[Peer]
PublicKey =3D <redacted>
AllowedIPs =3D <University class B segment>.0.0/16
Endpoint =3D <University class B segment>.123.456:<Port>
####################

I am using Arch Linux with wireguard-tools 1.0.20200513-1.

My university owns a public class B segment. The purpose of the VPN is
to access this segment, but the endpoint for wireguard is also located
inside said network.
When I want to connect using "wg-quick up <config file>", a route is
added for the "Allowed IPs" which unfortunately also covers the desired
endpoint. As a result, wireguard runs into a chicken and egg problem.

As a workaround, I added the following line to the [Interface] section
excluding the endpoint from the route created for the Allowed IPs:
PostUp =3D ip route add <University class B segment>.123.456 via $(ip
route show default | awk '/default/ {print $3}')

Now to my question: Is wg-quick working as expected or did I miss
something? If my config is correct, wouldn't it be a good idea to let
wg-quick check if the endpoint is inside the allowed IPs and add the
route I am creating in the PostUp line automatically?

--
Daniel


