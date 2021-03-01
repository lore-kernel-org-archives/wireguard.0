Return-Path: <SRS0=cL7X=H7=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDD9EC433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  1 Mar 2021 14:45:05 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B698364DF5
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  1 Mar 2021 14:45:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B698364DF5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=carmickle.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 41734e2b;
	Mon, 1 Mar 2021 14:42:51 +0000 (UTC)
Received: from mail.carmickle.com (mail.carmickle.com
 [2600:3c03::f03c:91ff:fe6e:212c])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 8f281af9
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 1 Mar 2021 14:42:48 +0000 (UTC)
Received: from [192.168.1.66] (pool-72-90-94-67.syrcny.fios.verizon.net
 [72.90.94.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.carmickle.com (Postfix) with ESMTPSA id A40EE77B5065;
 Mon,  1 Mar 2021 14:42:46 +0000 (UTC)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.17\))
Subject: Re: Nested Wireguard tunnels not working on Android and Windows
From: Frank Carmickle <frank@carmickle.com>
In-Reply-To: <CAMS0tn0k=7aVstO7Nnn1zZDUypuE2sWidS3uT+04=7rs6+YjGQ@mail.gmail.com>
Date: Mon, 1 Mar 2021 09:44:26 -0500
Cc: Aaron Jones <me@aaronmdjones.net>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <43EFA67E-34E0-4E33-A2FB-EBD42002F1AB@carmickle.com>
References: <CAMS0tn2Pq65UAVWqjV6mNd1hGqvUxVhVgmR3s2h+kh=XF8jyKA@mail.gmail.com>
 <E8F8664E-3C8A-45B9-B9B8-1A1E2873289B@carmickle.com>
 <65365aa6-cdd0-f9dc-f894-3a040ca596ae@aaronmdjones.net>
 <CAMS0tn0k=7aVstO7Nnn1zZDUypuE2sWidS3uT+04=7rs6+YjGQ@mail.gmail.com>
To: i iordanov <iiordanov@gmail.com>
X-Mailer: Apple Mail (2.3445.104.17)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=carmickle.com;
 s=20160808-mail; t=1614609766; bh=Xbq0+ja83Q0fTtrxRoB0PlWZK/h0RH63E/abD5oQdQE=;
 h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:Content-Transfer-Encoding:Message-Id:References:To;
 b=fQEMEZq2Skay0GnVlwPY0nB1eXpbCvIrehhFW0GqCSphbBhqKn0xXMven92tlj8yQNs8r5rClCZACLQ1m/+Wz3kbWviX/FEIYwpCUwU0lghyoZHAI/Ji7DSz3vxFWsMh+LUn0TCLV0XRyvjvW+NbuN0KMrze2S8DUMsJYXhqsO4=
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

Iordan,

> On Mar 1, 2021, at 1:07 AM, i iordanov <iiordanov@gmail.com> wrote:
>=20
> Hi Aaron, Frank,
>=20
> Thanks for your replies. For some reason, gmail had decided Frank's
> original reply was spam, I apologize for missing it. The first message
> in response to mine I received was Aaron's. Frank, after retrieving
> your message, yes you understanding is correct.
>=20
> Yes, I have done packet capture and indeed, the setup works correctly
> on Linux and Mac, whereas it does not work under Android and Windows.

Maybe it's a bug and not a feature? It seems to me that you would have =
no way of setting the MTU on the inner tunnel.

> What can I do to help diagnose, debug and/or resolve this issue?

Is there a reason why you can't try multiple interfaces?

--FC

> Cheers and thanks!
> iordan
>=20
>=20
> On Sun, Feb 28, 2021 at 5:17 PM Aaron Jones <me@aaronmdjones.net> =
wrote:
>>=20
>> On 27/02/2021 17:16, Frank Carmickle wrote:
>>> Iordan,
>>>=20
>>> You say that it's possible to run a nested configuration on
>>> Linux and Macos with just a single interface each. Have you
>>> done a packet capture to prove that that is in fact what is
>>> happening? That doesn't seem like how it would act given the
>>> design goals.
>>=20
>> Nesting (Using one of Peer A's AllowedIPs as Peer B's Endpoint) does
>> work within the same WireGuard interface, at least on Linux.
>>=20
>>=20
>=20
>=20
> --
> The conscious mind has only one thread of execution.

